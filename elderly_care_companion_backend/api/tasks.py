from celery import shared_task
from firebase_admin import messaging
from django.contrib.auth.models import User

@shared_task
def send_reminder(user_id, message):
    user = User.objects.get(id=user_id)
    registration_token = user.profile.firebase_token
    message = messaging.Message(
        notification=messaging.Notification(
            title='Reminder',
            body=message,
        ),
        token=registration_token,
    )
    response = messaging.send(message)
    return response
