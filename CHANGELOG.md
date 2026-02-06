# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.1] - 2026-02-07

### Fixed
- Remove duplicate hooks declaration from plugin.json - `hooks/hooks.json` is automatically loaded by Claude, so it shouldn't be declared in the manifest to avoid "Duplicate hooks file detected" error

## [0.1.0] - 2026-02-07

### Added

#### Core Workflows
- Fast targeted test loop with changed package detection (`/go:test-fast`)
- Opinionated linting with gofmt, go vet, and golangci-lint (`/go:lint`)
- Local CI parity with race detection, coverage, and security scanning (`/go:ci-local`)
- Breakpoint-first debugging workflow with Delve (`/go:debug-test`)
- Intelligent failure triage helper (`/go:triage-failure`)

#### Security & Dependencies
- Vulnerability scanning with govulncheck (`/go:security-scan`)
- Static security analysis with gosec (`/go:gosec-scan`)
- Dependency audit and outdated check (`/go:deps-check`)
- Safe dependency upgrade workflow with automatic testing (`/go:deps-upgrade`)

#### Performance & Quality
- Coverage reporting with threshold enforcement (`/go:coverage-report`)
- Statistical benchmarking with 5 iterations (`/go:bench-run`)
- CPU and memory profiling for benchmarks (`/go:bench-profile`)
- HTML coverage visualization support

#### Code Generation & Migrations
- Go generate wrapper with change detection (`/go:generate`)
- Database migration management with goose (`/go:migrate`)

#### Automation & Hooks
- Post-edit hook suggesting recommended workflows
- Bootstrap script for installing all required Go tools
- Argument validation in test scripts
- Timing output for CI stages

#### Documentation
- Comprehensive README with installation instructions
- Extended feedback loops skill documentation
- Breakpoint-first debugging skill guide
- Usage examples for all commands

### Fixed
- Use `${CLAUDE_PLUGIN_ROOT}` instead of `${CLAUDE_PROJECT_DIR}` in hooks
- Register hooks properly in plugin.json
- Git reference validation in test scripts
- Marketplace.json name consistency

### Changed
- Plugin renamed from "go-dev-opinionated" to "go" for shorter slash commands
- Skill descriptions shortened to under 70 characters for better triggering
- CI pipeline now includes security scanning as Stage 4

[0.1.1]: https://github.com/Sagart-cactus/claude-go-plugin/releases/tag/v0.1.1
[0.1.0]: https://github.com/Sagart-cactus/claude-go-plugin/releases/tag/v0.1.0
