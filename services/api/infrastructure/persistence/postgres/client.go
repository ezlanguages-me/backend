package postgres

import (
	"context"
	"fmt"
	"log/slog"
	"net"
	"os"
	"services/api/infrastructure/environment"
	"strings"
	"sync/atomic"

	"github.com/jackc/pgx/v5/pgxpool"
)

type PostgresRepository struct {
	master   *pgxpool.Pool
	replicas []*pgxpool.Pool
	counter  uint32
}

func NewPostgresRepository(ctx context.Context) (*PostgresRepository, error) {
	env := environment.Env

	masterURL := fmt.Sprintf(
		"postgres://%s:%s@%s:%s/%s?statement_timeout=8000&lock_timeout=3000",
		env.DB_USER, env.DB_PASSWORD, env.MASTER_POSTGRES_DNS, env.DB_PORT, env.DB_NAME,
	)
	masterConfig, err := pgxpool.ParseConfig(masterURL)
	if err != nil {
		slog.Error("error parsing master postgres config", "err", err)
		os.Exit(1)
	}
	masterConfig.MaxConns = 30
	masterConfig.MinConns = 5
	master, err := pgxpool.NewWithConfig(ctx, masterConfig)
	if err != nil {
		slog.Error("error connecting to master postgres", "err", err)
		os.Exit(1)
	}

	var replicaIPs []string

	ips, err := net.LookupHost(env.REPLICA_POSTGRES_DNS)
	if err == nil && len(ips) > 0 {
		replicaIPs = ips
	} else {
		if env.REPLICA_POSTGRES_DNS != "" {
			replicaIPs = strings.Split(env.REPLICA_POSTGRES_DNS, ",")
		}
	}

	var replicas []*pgxpool.Pool
	for _, ip := range replicaIPs {
		replicaURL := fmt.Sprintf(
			"postgres://%s:%s@%s:%s/%s?statement_timeout=8000&lock_timeout=3000",
			env.DB_USER, env.DB_PASSWORD, ip, env.DB_PORT, env.DB_NAME,
		)
		config, _ := pgxpool.ParseConfig(replicaURL)
		config.MaxConns = 20
		config.MinConns = 3

		pool, err := pgxpool.NewWithConfig(ctx, config)
		if err == nil {
			replicas = append(replicas, pool)
		}
	}

	return &PostgresRepository{
		master:   master,
		replicas: replicas,
		counter:  0,
	}, nil
}

func (r *PostgresRepository) getPool(readOnly bool) *pgxpool.Pool {
	if readOnly && len(r.replicas) > 0 {
		n := atomic.AddUint32(&r.counter, 1)
		return r.replicas[n%uint32(len(r.replicas))]
	}
	return r.master
}

func (r *PostgresRepository) HealthCheck(ctx context.Context) {
	var masterIP string
	var isRecovery bool
	err := r.master.QueryRow(ctx, "SELECT inet_server_addr()::text, pg_is_in_recovery()").Scan(&masterIP, &isRecovery)
	if err != nil {
		slog.Error("error connecting to master", "err", err)
		os.Exit(1)
	}

	for _, pool := range r.replicas {
		var replicaIP string
		var isReplicaRecovery bool
		err := pool.QueryRow(ctx, "SELECT inet_server_addr()::text, pg_is_in_recovery()").Scan(&replicaIP, &isReplicaRecovery)
		if err != nil {
			slog.Error("error connecting to replica", "err", err)
			os.Exit(1)
		}
	}
}

// Close closes all database connections
func (r *PostgresRepository) Close() {
	if r.master != nil {
		r.master.Close()
	}
	for _, replica := range r.replicas {
		if replica != nil {
			replica.Close()
		}
	}
}
