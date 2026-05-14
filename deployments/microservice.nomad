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
    count = 2

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
        
        "traefik.http.routers.${var.service_name}.rule=Host(`${var.service_name}.ezlanguages.me`)",
        "traefik.http.routers.${var.service_name}.entrypoints=websecure",
        "traefik.http.routers.${var.service_name}.middleware=clerk-jwt@file",
        "traefik.http.routers.${var.service_name}.tls.certresolver=letsencrypt",
        "traefik.http.routers.${var.service_name}.priority=100"
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
  -o ./app

echo "[run.sh] file type: $$(file ./app | cut -d: -f2)"
chmod +x ./app
echo "[run.sh] Launching binary..."
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