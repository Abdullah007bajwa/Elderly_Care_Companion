from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import MedicationViewSet, AppointmentViewSet, TaskViewSet, EmergencyAlertViewSet
router = DefaultRouter()
router.register(r'medications', MedicationViewSet)
router.register(r'appointments', AppointmentViewSet)
router.register(r'tasks', TaskViewSet)
router.register(r'alerts', EmergencyAlertViewSet)

urlpatterns = [
    #path('google_assistant_webhook/', google_assistant_webhook, name='google_assistant_webhook'),
    path('', include(router.urls)),
]

