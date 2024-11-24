#!/usr/bin/env bash

# Run the prestart script
poetry run python ./app/backend_pre_start.py

# Run migrations
poetry run alembic upgrade head

# Create initial data in DB
poetry run python ./app/initial_data.py

# Start the FastAPI server
exec poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000
