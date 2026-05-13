#!/usr/bin/env bash
set -euo pipefail

echo "Running backend lint..."
cd services/api

if [ -d ".venv" ]; then
  source .venv/bin/activate
fi

ruff check .
mypy app || true

cd ../..

echo "Running frontend lint..."
if [ -f "pnpm-workspace.yaml" ]; then
  pnpm --filter web lint || true
fi
