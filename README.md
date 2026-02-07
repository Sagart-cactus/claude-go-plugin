# go

Opinionated Claude plugin for Go development with a practical debug-and-feedback loop.

## Installation

### Option 1: Install from GitHub (Recommended)

```bash
# Add the plugin marketplace
claude plugin marketplace add https://github.com/Sagart-cactus/claude-go-plugin

# Install the plugin
claude plugin install go@go
```

### Option 2: Install from local clone

```bash
# Clone the repository
git clone https://github.com/Sagart-cactus/claude-go-plugin.git
cd claude-go-plugin

# Add as marketplace and install
claude plugin marketplace add .
claude plugin install go@go
```

### Post-Installation

After installation, run the bootstrap script to install required Go tools:

```bash
# The plugin scripts will be in your project directory
./scripts/bootstrap-go-tools.sh
```

This installs: `gopls`, `goimports`, `golangci-lint`, `dlv`, `govulncheck`, `go-mod-outdated`, `benchstat`, `gosec`, and `goose`.

### Verify Installation

```bash
claude plugin list
```

You should see:
```
✔ go@go
  Version: 0.1.1
  Status: ✔ enabled
```

### Updating

To update to the latest version:

```bash
# Update the marketplace
claude plugin marketplace update go

# Reinstall the plugin
claude plugin uninstall go
claude plugin install go@go
```

## What this plugin gives you
- Fast targeted test loop for changed Go packages
- Lint + vet guardrails
- Local CI parity command (race + coverage + security)
- Breakpoint-first debugging workflow with Delve
- Failure triage helper to decide next action quickly
- Security scanning (govulncheck + gosec)
- Dependency management and safe upgrade workflows
- Coverage reporting with thresholds
- Benchmarking and profiling tools
- Code generation helper
- Database migration management

## Plugin structure
- `.claude-plugin/plugin.json`: plugin manifest
- `commands/`: Claude slash commands
- `skills/`: reusable Go development/debugging instructions
- `hooks/hooks.json`: post-edit guidance hook
- `scripts/`: runnable local workflow scripts

## Recommended tooling
- Go 1.22+
- `gopls`
- `golangci-lint`
- `dlv`

Install tools:

```bash
./scripts/bootstrap-go-tools.sh
```

## Daily loop
1. Make a change.
2. Run fast tests:

```bash
./scripts/test-fast.sh
```

3. Run lint/vet:

```bash
./scripts/lint.sh
```

4. Before pushing, run full local CI:

```bash
./scripts/ci-local.sh
```

## Debugging failing tests like real developers
1. Reproduce one failing test.
2. Start Delve:

```bash
./scripts/debug-test.sh ./path/to/pkg '^TestName$'
```

3. Set 2-3 breakpoints:
- test/function entry
- pre-mutation branch where state diverges
- error return or panic path

4. Inspect runtime state (`stack`, `goroutines`, locals) and validate one hypothesis at a time.
5. Apply minimal fix and rerun fast loop.

## Failure triage
If you have a failure log file:

```bash
./scripts/triage-failure.sh /tmp/test.log
```

The script classifies the failure and suggests the next debug step.

## Extended Workflows

### Security & Dependencies
```bash
# Weekly security audit
./scripts/security-scan.sh    # Check dependency vulnerabilities
./scripts/gosec-scan.sh        # Check code security issues

# Dependency management
./scripts/deps-check.sh        # Audit dependencies
./scripts/deps-upgrade.sh github.com/pkg/name minor  # Safe upgrade

# Before releases
./scripts/ci-local.sh          # Now includes security scanning
```

### Performance & Coverage
```bash
# Measure performance
./scripts/bench-run.sh results.txt BenchmarkFoo
./scripts/bench-profile.sh BenchmarkFoo  # With profiling

# Coverage analysis
./scripts/coverage-report.sh 80  # Enforce 80% threshold
go tool cover -html=coverage.out  # Visual exploration
```

### Code Generation & Migrations
```bash
# Run code generation
./scripts/generate.sh ./internal/api

# Database migrations
DB_STRING='postgres://...' ./scripts/migrate.sh status
DB_STRING='postgres://...' ./scripts/migrate.sh up
DB_STRING='postgres://...' ./scripts/migrate.sh create add_users_table
```

## Optional editor setup
A sample launch configuration is in `templates/vscode-launch.json`.
