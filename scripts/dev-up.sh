#!/usr/bin/env bash
set -euo pipefail

if [ ! -f ".env.development" ]; then
  echo "Missing .env.development"
  echo "Run: cp .env.development.example .env.development"
  exit 1
fi

docker compose -f docker-compose.dev.yml up -d --build
docker compose -f docker-compose.dev.yml ps
