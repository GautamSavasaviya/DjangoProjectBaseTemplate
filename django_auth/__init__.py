# filepath: /home/gautam/Desktop/DjangoAuth/django_auth/__init__.py
"""
This file is intentionally left blank.
"""

# django_auth/__init__.py

# Ensure the Celery app is imported when Django starts
from .celery import celery_app  # noqa
