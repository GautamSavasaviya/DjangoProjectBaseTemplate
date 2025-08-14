#!/bin/bash
set -e

echo "🔍 Checking if superuser exists..."
python manage.py shell << END
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username="${DJANGO_SUPERUSER_USERNAME}").exists():
    print("⚡ Creating superuser '${DJANGO_SUPERUSER_USERNAME}'...")
    User.objects.create_superuser(
        username="${DJANGO_SUPERUSER_USERNAME}",
        email="${DJANGO_SUPERUSER_EMAIL}",
        password="${DJANGO_SUPERUSER_PASSWORD}"
    )
    print("✅ Superuser created.")
else:
    print("ℹ️ Superuser '${DJANGO_SUPERUSER_USERNAME}' already exists. Skipping.")
END
