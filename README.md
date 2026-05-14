# ezlanguages-me Backend

Go microservices monorepo — REST API, AI service, and stats consumer.

## 🏗️ Structure

```
backend/
├── services/
│   ├── api/             # REST API  (port 3000)
│   ├── ai/              # Gemini AI  (port 3001)
│   └── stats_consumer/  # NATS consumer (no HTTP port)
├── pkg/
│   ├── billing/         # Subscription & token logic
│   ├── domain/          # Shared domain models + interfaces
│   ├── server/          # Fiber server helpers
│   └── shared/          # Misc utilities
├── deployments/
│   ├── microservice.nomad  # Template for HTTP services (api, ai)
│   └── worker.nomad        # Template for background workers (stats_consumer)
└── .githooks/           # Shared git hooks
```

## 🚀 Setup

```bash
make setup    # Install tools (golangci-lint, goimports) + configure git hooks
```

## 📋 Commands

| Command | Description |
|---|---|
| `make check` | Format + lint + test (also runs on pre-commit) |
| `make fmt` | Format all modules |
| `make lint` | Run golangci-lint on all modules |
| `make test` | Run tests on all modules |
| `make build` | Build binaries to `bin/` |
| `make clean` | Remove build artifacts |
| `make db-reset` | Drop + recreate schema + views |
| `make db-seed` | Load seed data (no drop) |
| `make db-fresh` | Full reset: schema + views + seed data |
| `make db-backup` | Manual backup to R2 |

## 🪝 Git Hooks

| Hook | Triggers |
|---|---|
| `pre-commit` | gofmt, debug prints, secret pattern scan (staged files only) |
| `commit-msg` | Conventional Commits format validation |
| `prepare-commit-msg` | Auto-populates template from branch name |
| `pre-push` | Full test suite |

### Commit format

```
<type>(<scope>): <description>
```

**Allowed types:** `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `ci`, `build`, `revert`

To skip hooks temporarily: `git commit --no-verify` (not recommended)

## 🔄 Development Workflow

1. Create branch: `git checkout -b feat/new-feature`
2. Develop — commits auto-run `make check`
3. Push + open PR → add a `major` / `minor` / `patch` label
4. **Squash and Merge** with a Conventional Commits message
5. Deploy workflow triggers automatically

## 📦 Versioning

Tags follow the pattern `<service>-vMAJOR.MINOR.PATCH`.

| Priority | Source | Bump |
|---|---|---|
| 1 | PR label `major` | +1.0.0 |
| 1 | PR label `minor` | +0.1.0 |
| 1 | PR label `patch` | +0.0.1 |
| 2 | Commit `BREAKING CHANGE` or `feat!:` | +1.0.0 |
| 2 | Commit `feat:` | +0.1.0 |
| 3 | Default | +0.0.1 |

## 🔐 Environment Variables

Each service reads its own `.env` file at startup.

### `services/api`

| Variable | Required | Description |
|---|---|---|
| `HOST` | ✅ | Bind address (e.g. `0.0.0.0`) |
| `PORT` | ✅ | HTTP port (default `3000`) |
| `DB_USER` | ✅ | Postgres user |
| `DB_PASSWORD` | ✅ | Postgres password |
| `DB_NAME` | ✅ | Postgres database name |
| `MASTER_POSTGRES_DNS` | ✅ | Primary Postgres IP (Tailscale) |
| `REPLICA_POSTGRES_DNS` | ✅ | Read replica IPs, comma-separated |
| `NATS_URL` | ✅ | NATS connection URL |

### `services/ai`

| Variable | Required | Description |
|---|---|---|
| `HOST` | ✅ | Bind address |
| `PORT` | ✅ | HTTP port (default `3001`) |
| `GEMINI_API_KEY` | ✅ | Google Gemini API key |
| `DB_USER` | ✅ | Postgres user |
| `DB_PASSWORD` | ✅ | Postgres password |
| `DB_NAME` | ✅ | Postgres database name |
| `MASTER_POSTGRES_DNS` | ✅ | Primary Postgres IP (Tailscale) |

### `services/stats_consumer`

| Variable | Required | Description |
|---|---|---|
| `NATS_URL` | ✅ | NATS connection URL |
| `DB_USER` | ✅ | Postgres user |
| `DB_PASSWORD` | ✅ | Postgres password |
| `DB_NAME` | ✅ | Postgres database name |
| `MASTER_POSTGRES_DNS` | ✅ | Primary Postgres IP (Tailscale) |

## 🔑 GitHub Actions Secrets

Required in **Settings → Secrets and variables → Actions**.

### CI workflow (`ci.yml`)

| Secret | Description |
|---|---|
| `GITHUB_TOKEN` | Auto-provided by GitHub — no setup needed |

### Deploy workflow (`deploy.yml`)

| Secret | Description |
|---|---|
| `GITHUB_TOKEN` | Auto-provided by GitHub — no setup needed |
| `TS_OAUTH_ID` | Tailscale OAuth client ID (`tag:ci` tag required) |
| `TS_OAUTH_SECRET` | Tailscale OAuth client secret |
| `NOMAD_IPS` | Space-separated list of Nomad server IPs (tried in order) |
| `NOMAD_ADDR` | Fallback Nomad address (`http://<ip>:4646`) |
| `GH_TOKEN_DOWNLOAD` | GitHub PAT — allows Nomad nodes to download release binaries |

> **Tailscale setup:** create an OAuth client at <https://login.tailscale.com/admin/settings/oauth> with `Devices: Write` scope and the `tag:ci` ACL tag.

## 🚢 Deploy

Triggered automatically on every merge to `main`.

1. **Detect** — which services were affected by the diff (with pkg cascade rules)
2. **Version** — calculate next semver tag from PR label / commit message
3. **Tailscale** — join the private network to reach the Nomad cluster
4. **Build** — `GOOS=linux GOARCH=amd64 go build` for each affected service
5. **Release** — create GitHub Release with the versioned binary
6. **Deploy** — `nomad job run` against each node in `NOMAD_IPS` until one succeeds

Services use their own Nomad template:
- `api`, `ai` → `deployments/microservice.nomad` (HTTP service, Traefik + Consul)
- `stats_consumer` → `deployments/worker.nomad` (background worker, no port)

