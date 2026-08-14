#!/usr/bin/env bash
# Install grapeot/ai_session_export into adhoc_jobs/ai_session_export/
# Mirrors install_tavily_skill.sh.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$ROOT/adhoc_jobs/ai_session_export"
REPO="https://github.com/grapeot/ai_session_export.git"

if [[ ! -f "$TARGET/pyproject.toml" ]]; then
  echo "Cloning $REPO -> $TARGET"
  rm -rf "$TARGET"
  git clone --depth 1 "$REPO" "$TARGET"
fi

cd "$TARGET"
uv venv .venv
uv pip install -e '.[dev]'

mkdir -p "$ROOT/contexts/ai_sessions"

GITIGNORE="$ROOT/.gitignore"
if ! grep -qxF "contexts/ai_sessions/" "$GITIGNORE" 2>/dev/null; then
  printf '\n# Private AI session export archive (real transcripts; never commit)\ncontexts/ai_sessions/\n' >> "$GITIGNORE"
fi

echo "ai_session_export installed."
