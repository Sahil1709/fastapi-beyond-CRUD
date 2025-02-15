#!/bin/bash
set -e

echo "Running Alembic migrations..."
alembic upgrade head

echo "Starting FastAPI application..."
exec fastapi run src --port 8000 --host 0.0.0.0