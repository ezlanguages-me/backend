.PHONY: fmt lint test build clean db-reset db-seed db-fresh db-backup db-migrate

fmt:
	@echo "Formatting code..."
	@for dir in services/*/. pkg/*/. ; do \
		if [ -f "$$dir/go.mod" ]; then \
			echo "Formatting $$dir"; \
			cd "$$dir" && go fmt ./... && cd - > /dev/null; \
		fi \
	done
	@goimports -local pkg -w .

lint:
	@echo "Running linter..."
	@ROOT_DIR=$$(pwd); \
	for dir in services/*/. pkg/*/. ; do \
		if [ -f "$$dir/go.mod" ]; then \
			echo "Linting $$dir"; \
			cp .golangci.yml "$$dir/.golangci.yml" 2>/dev/null || true; \
			cd "$$dir" && golangci-lint run; \
			LINT_EXIT=$$?; \
			rm -f .golangci.yml 2>/dev/null || true; \
			cd - > /dev/null; \
			if [ $$LINT_EXIT -ne 0 ]; then exit 1; fi; \
		fi \
	done

check: fmt lint test

test:
	@echo "Running tests..."
	@for dir in services/*/. pkg/*/. ; do \
		if [ -f "$$dir/go.mod" ]; then \
			echo "Testing $$dir"; \
			cd "$$dir" && go test -v -race ./...; \
			TEST_EXIT=$$?; \
			cd - > /dev/null; \
			if [ $$TEST_EXIT -ne 0 ]; then exit 1; fi; \
		fi \
	done

build:
	@echo "Building services..."
	cd services/api && go build -o ../../bin/api

clean:
	@echo "Cleaning..."
	rm -rf bin/
	rm -f coverage.out coverage.html

# ── Database ──────────────────────────────────────────────────────────────────

# Drop, recreate, apply schema + views (no data)
db-reset:
	@./scripts/db-reset.sh

# Load seed data into the existing DB (no drop/recreate)
db-seed:
	@./scripts/db-reset.sh --seed-only

# Full reset: drop + recreate + schema + views + all seed data
db-fresh:
	@./scripts/db-reset.sh --seed

# Manual backup to R2 (requires R2_* env vars)
db-backup:
	@../devops/scripts/db-backup.sh

# Apply pending migrations without dropping the DB (safe on live data)
db-migrate:
	@./scripts/db-migrate.sh


install-tools:
	@echo "Installing tools..."
	curl -sSfL https://golangci-lint.run/install.sh | sh -s -- -b $$(go env GOPATH)/bin v2.9.0
	go install golang.org/x/tools/cmd/goimports@latest

install-hooks:
	@echo "Installing git hooks..."
	@git config core.hooksPath .githooks
	@chmod +x .githooks/pre-commit \
	          .githooks/commit-msg \
	          .githooks/prepare-commit-msg \
	          .githooks/pre-push
	@echo "✓ Git hooks installed:"
	@echo "    pre-commit         — gofmt + debug prints + secret patterns (staged files only)"
	@echo "    commit-msg         — Conventional Commits format validation"
	@echo "    prepare-commit-msg — auto-populate template from branch name"
	@echo "    pre-push           — full test suite before push"

setup: install-tools install-hooks
	@echo "Setup complete! Tools installed and git hooks configured."
