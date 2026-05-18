variable "service_name" { type = string }
variable "version"      { type = string }
variable "port"         { type = number }
variable "github_token" { type = string }

job "service" {
  datacenters = ["dc1"]
  type        = "service"

  update {
    max_parallel      = 1
    min_healthy_time  = "30s"
    healthy_deadline  = "5m"
    auto_revert       = true
    health_check      = "checks"
  }

  group "instances" {
    count = 4

    constraint {
      operator  = "distinct_hosts"
      value     = "true"
    }

    network {
      port "http" { static = var.port }
    }

    service {
      name = var.service_name
      port = "http"
      tags = [
        "traefik.enable=true",

        # CORS headers middleware — applied to ALL responses (including 401 from
        # ForwardAuth) so the browser never sees a CORS error on auth failures.
        "traefik.http.middlewares.${var.service_name}-cors.headers.accesscontrolalloworiginlist=https://app.ezlanguages.me,https://front.juancarloslucenamonje.workers.dev,http://localhost:8081",
        "traefik.http.middlewares.${var.service_name}-cors.headers.accesscontrolallowmethods=GET,POST,PUT,DELETE,PATCH,OPTIONS",
        "traefik.http.middlewares.${var.service_name}-cors.headers.accesscontrolallowheaders=Origin,Content-Type,Accept,Authorization,X-User-Email",
        "traefik.http.middlewares.${var.service_name}-cors.headers.accesscontrolexposeheaders=X-User-Email",
        "traefik.http.middlewares.${var.service_name}-cors.headers.accesscontrolmaxage=86400",

        # Main router — protected by Clerk JWT.
        # cors middleware listed first so it wraps the response even on 401.
        "traefik.http.routers.${var.service_name}.rule=Host(`${var.service_name}.ezlanguages.me`)",
        "traefik.http.routers.${var.service_name}.entrypoints=websecure",
        "traefik.http.routers.${var.service_name}.middlewares=${var.service_name}-cors@consulcatalog,clerk-jwt@consulcatalog",
        "traefik.http.routers.${var.service_name}.tls.certresolver=letsencrypt",
        "traefik.http.routers.${var.service_name}.priority=10",

        # Health check router — no auth, higher priority
        "traefik.http.routers.${var.service_name}-health.rule=Host(`${var.service_name}.ezlanguages.me`) && Path(`/health`)",
        "traefik.http.routers.${var.service_name}-health.entrypoints=websecure",
        "traefik.http.routers.${var.service_name}-health.tls.certresolver=letsencrypt",
        "traefik.http.routers.${var.service_name}-health.priority=20",

        # Public router for POST /api/v1/users (user registration — no auth required)
        "traefik.http.routers.${var.service_name}-public-users.rule=Host(`${var.service_name}.ezlanguages.me`) && Path(`/api/v1/users`) && Method(`POST`)",
        "traefik.http.routers.${var.service_name}-public-users.entrypoints=websecure",
        "traefik.http.routers.${var.service_name}-public-users.tls.certresolver=letsencrypt",
        "traefik.http.routers.${var.service_name}-public-users.priority=20",

        # CORS preflight router — OPTIONS requests must bypass auth so the browser
        # receives proper CORS headers from Fiber's cors middleware.
        "traefik.http.routers.${var.service_name}-options.rule=Host(`${var.service_name}.ezlanguages.me`) && Method(`OPTIONS`)",
        "traefik.http.routers.${var.service_name}-options.entrypoints=websecure",
        "traefik.http.routers.${var.service_name}-options.tls.certresolver=letsencrypt",
        "traefik.http.routers.${var.service_name}-options.priority=30"
      ]
      check {
        type     = "http"
        path     = "/health"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "app" {
      driver = "raw_exec"

      # Read secrets from: nomad var put secrets/app
      template {
        data        = <<EOF
{{ with nomadVar "secrets/app" }}
{{ range $k, $v := . }}{{ $k }}={{ $v }}
{{ end }}{{ end }}
EOF
        destination = "local/.env"
        env         = true
      }

      template {
        data = <<EOF
#!/bin/bash
set -e

echo "[run.sh] Starting service=${var.service_name} version=${var.version}"

RELEASE_JSON=$(curl -s -L \
  -H "Authorization: Bearer ${var.github_token}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/ezlanguages-me/backend/releases/tags/${var.service_name}-${var.version}")

echo "[run.sh] Release JSON: $${RELEASE_JSON:0:300}"

ASSET_URL=$(echo "$RELEASE_JSON" \
  | grep -o '"url": "https://api.github.com/repos/ezlanguages-me/backend/releases/assets/[0-9]*"' \
  | head -n 1 \
  | cut -d '"' -f 4)

echo "[run.sh] ASSET_URL=$ASSET_URL"

if [ -z "$ASSET_URL" ]; then
  echo "[run.sh] ERROR: could not find asset URL" >&2
  exit 1
fi

curl -L \
  -H "Accept: application/octet-stream" \
  -H "Authorization: Bearer ${var.github_token}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$ASSET_URL" \
  -o "$NOMAD_TASK_DIR/app"

echo "[run.sh] file type: $(file $NOMAD_TASK_DIR/app | cut -d: -f2)"
chmod +x "$NOMAD_TASK_DIR/app"
echo "[run.sh] Launching binary..."
cd "$NOMAD_TASK_DIR"
exec ./app
EOF
        destination = "local/run.sh"
        perms = "755"
      }

      config {
        command = "local/run.sh"
      }

      resources {
        cpu    = 1000
        memory = 1024
      }
    }
  }
}