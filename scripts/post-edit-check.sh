#!/usr/bin/env bash
set -euo pipefail

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  exit 0
fi

if ! command -v go >/dev/null 2>&1; then
  exit 0
fi

changed_go=()
while IFS= read -r file; do
  [[ -n "$file" ]] && changed_go+=("$file")
done < <(git diff --name-only | grep '\.go$' | head -n 20)
if [[ "${#changed_go[@]}" -eq 0 ]]; then
  exit 0
fi

# Output JSON so Claude Code surfaces it as context (plain stdout is hidden for PostToolUse)
cat <<'JSON'
{
  "additionalContext": "[go] Go files changed. Run the feedback loop: 1) ./scripts/test-fast.sh 2) ./scripts/lint.sh 3) ./scripts/debug-test.sh <pkg> <regex> (when a test fails) 4) ./scripts/coverage-report.sh (check test coverage)"
}
JSON
exit 0
