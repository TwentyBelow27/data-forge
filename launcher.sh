#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR" || exit

docker compose --profile core up -d
docker compose --profile airflow up -d
docker compose --profile explore up -d