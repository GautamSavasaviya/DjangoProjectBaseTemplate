# Use an official Python runtime as a parent image
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

# Install system deps required for many Python packages (including psycopg2)
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential libpq-dev curl gnupg2 && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt /app/requirements.txt
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy project
COPY . /app

# Add entrypoint and other scripts files (waits for DB, runs migrations, then execs CMD)
# Copy entrypoint to root
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copy other scripts to /app/docker
COPY docker/*.sh /app/docker/
RUN chmod +x /app/docker/*.sh

ENTRYPOINT ["/entrypoint.sh"]


# Default command (can be overridden by docker-compose)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
