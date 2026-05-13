#!/usr/bin/env bash
set -euo pipefail

echo "Running backend tests..."
cd services/api

if [ -d ".venv" ]; then
  source .venv/bin/activate
fi

pytest

cd ../..

echo "Running web checks..."
if [ -f "pnpm-workspace.yaml" ]; then
  pnpm --filter web test || true
fi
