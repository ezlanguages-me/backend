variable "service_name" { type = string }
variable "version"      { type = string }
variable "github_token" { type = string }

# Nomad job template for background worker services (no HTTP/Traefik).
# Used by stats_consumer and any future non-HTTP microservices.
job "worker" {
  datacenters = ["dc1"]
  type        = "service"

  update {
    max_parallel      = 1
    min_healthy_time  = "30s"
    healthy_deadline  = "5m"
    auto_revert       = true
    health_check      = "task_states"
  }

  group "instances" {
    count = 1  # Single consumer — NATS queue-group semantics handle concurrency

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

ASSET_URL=$(curl -s -L \
  -H "Authorization: Bearer ${var.github_token}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/ezlanguages-me/backend/releases/tags/${var.service_name}-${var.version}" \
  | grep -o '"url": "https://api.github.com/repos/ezlanguages-me/backend/releases/assets/[0-9]*"' \
  | head -n 1 \
  | cut -d '"' -f 4)

curl -L \
  -H "Accept: application/octet-stream" \
  -H "Authorization: Bearer ${var.github_token}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$ASSET_URL" \
  -o ./app

chmod +x ./app
exec ./app
EOF
        destination = "local/run.sh"
        perms       = "755"
      }

      config {
        command = "local/run.sh"
      }

      resources {
        cpu    = 500
        memory = 512
      }
    }
  }
}
