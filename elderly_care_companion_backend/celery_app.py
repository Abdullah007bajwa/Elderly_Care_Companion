from __future__ import absolute_import, unicode_literals
import os
from celery import Celery  # Correct import

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'health_app_backend.settings')

app = Celery('health_app_backend')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()
