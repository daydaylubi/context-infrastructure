#!/usr/bin/env bash
# Install grapeot/tavily-skill into adhoc_jobs/tavily_skill/
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$ROOT/adhoc_jobs/tavily_skill"
REPO="https://github.com/grapeot/tavily-skill.git"

if [[ ! -f "$TARGET/pyproject.toml" ]]; then
  echo "Cloning $REPO -> $TARGET"
  rm -rf "$TARGET"
  git clone --depth 1 "$REPO" "$TARGET"
fi

cd "$TARGET"
uv venv .venv
uv pip install -e '.[dev]'

echo ""
echo "Tavily skill installed."
echo "  CLI:  cd $TARGET && .venv/bin/python -m tavily_skill search \"test\" --stdout"
echo "  Key:  add TAVILY_API_KEY to $ROOT/.env"
echo "  Skill: rules/skills/tavily.md"
