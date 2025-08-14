#!/usr/bin/env bash
set -e

# Wait for Postgres to be ready
echo "Waiting for Postgres at ${DATABASE_HOST:-db}:${DATABASE_PORT:-5432} ..."
# simple python loop using psycopg2 to check connectivity
python - <<'PYCODE'
import os, time, sys
import psycopg2
from psycopg2 import OperationalError

host = os.getenv("DATABASE_HOST", "db")
port = os.getenv("DATABASE_PORT", "5432")
user = os.getenv("DATABASE_USER", "postgres")
password = os.getenv("DATABASE_PASSWORD", "")
dbname = os.getenv("DATABASE_NAME", "postgres")

for i in range(60):
    try:
        conn = psycopg2.connect(host=host, port=port, user=user, password=password, dbname=dbname)
        conn.close()
        print("Postgres is up")
        sys.exit(0)
    except OperationalError:
        time.sleep(1)
        continue
print("Timed out waiting for Postgres")
sys.exit(1)
PYCODE

# Run migrations (non-interactive)
echo "Apply database migrations..."
python manage.py migrate --noinput

# Collect static if production
if [ "${DJANGO_ENV:-dev}" = "prod" ]; then
  python manage.py collectstatic --noinput
fi

if [ -f "/app/docker/create_superuser.sh" ]; then
    sh /app/docker/create_superuser.sh
fi

# Exec the CMD
exec "$@"
