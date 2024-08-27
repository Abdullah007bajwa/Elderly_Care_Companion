import firebase_admin
from firebase_admin import credentials

cred = credentials.Certificate(r"C:\Users\HP\PycharmProjects\web_Q\health_app_backend\elderly-care-companion-e567b-firebase-adminsdk-y5q8m-3816e277c8.json")
firebase_admin.initialize_app(cred)
