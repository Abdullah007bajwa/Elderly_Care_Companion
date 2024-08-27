import datetime
import google.auth
from googleapiclient.discovery import build

def get_calendar_service():
    credentials, project = google.auth.default()
    service = build('calendar', 'v3', credentials=credentials)
    return service

def list_events():
    service = get_calendar_service()
    now = datetime.datetime.utcnow().isoformat() + 'Z'
    events_result = service.events().list(calendarId='primary', timeMin=now,
                                          maxResults=10, singleEvents=True,
                                          orderBy='startTime').execute()
    events = events_result.get('items', [])
    return events
import googlemaps
from django.conf import settings

gmaps = googlemaps.Client(key=settings.GOOGLE_MAPS_API_KEY)

def geocode_address(address):
    geocode_result = gmaps.geocode(address)
    return geocode_result
from googleapiclient.discovery import build
from google.oauth2 import service_account

SCOPES = ['https://www.googleapis.com/auth/fitness.activity.read']
SERVICE_ACCOUNT_FILE = 'path/to/service/account.json'

def get_fit_service():
    credentials = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    service = build('fitness', 'v1', credentials=credentials)
    return service

def list_data_sources():
    service = get_fit_service()
    data_sources = service.users().dataSources().list(userId='me').execute()
    return data_sources
