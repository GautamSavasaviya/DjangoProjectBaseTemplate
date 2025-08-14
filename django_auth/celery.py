import os
from celery import Celery

# allow the environment to control which settings module to use, fallback to dev
os.environ.setdefault("DJANGO_SETTINGS_MODULE", os.getenv("DJANGO_SETTINGS_MODULE", "django_auth.settings.dev"))

app = Celery("django_auth")

# Load task module configuration from Django settings, using the CELERY_ prefix
app.config_from_object("django.conf:settings", namespace="CELERY")

# Auto-discover tasks from installed apps
app.autodiscover_tasks()

# optional alias exported for some tooling
celery_app = app
