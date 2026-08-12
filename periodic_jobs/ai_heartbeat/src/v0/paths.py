"""Workspace path constants for ai_heartbeat scripts."""
from __future__ import annotations

import os
from pathlib import Path

_V0_DIR = Path(__file__).resolve().parent
_DEFAULT_ROOT = _V0_DIR.parents[3]

WORKSPACE_ROOT = Path(os.getenv("WORKSPACE_ROOT", _DEFAULT_ROOT)).resolve()
ENV_PATH = WORKSPACE_ROOT / ".env"

KNOWLEDGE_BASE = WORKSPACE_ROOT / "periodic_jobs/ai_heartbeat/docs/KNOWLEDGE_BASE.md"
OBSERVATIONS_PATH = WORKSPACE_ROOT / "contexts/memory/OBSERVATIONS.md"
LIFE_RECORD_DIR = WORKSPACE_ROOT / "contexts/life_record"
CHECK_RECORDINGS_SCRIPT = LIFE_RECORD_DIR / "scripts/check_recent_recordings.py"
