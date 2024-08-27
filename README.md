# Elderly Care Companion

## 🚀 Overview

**Elderly Care Companion** is a comprehensive mobile application designed to enhance the quality of life for elderly individuals. The app integrates multiple functionalities, including medication reminders, appointment scheduling, task management, conversational AI for companionship, and an emergency alert system. Built with **Flutter** for the frontend and **Django** for the backend, the app leverages Google technologies to deliver an exceptional user experience.

## 🎯 Core Features

### 1. Medication Reminders
- **Input**: Easily input medication details (name, dosage, frequency).
- **Notifications**: Receive timely notifications to ensure medication adherence.
- **Tracking**: Track your medication intake history.
- **Enhancements**: Voice commands via Google Assistant, integration with health monitoring devices.

### 2. Appointment Scheduling and Reminders
- **Scheduling**: Manage medical appointments and daily activities with ease.
- **Reminders**: Get notifications for upcoming appointments.
- **Enhancements**: Sync with Google Calendar, location-based reminders.

### 3. Daily Task Reminders
- **Tasks**: Set and manage daily tasks.
- **Categorization**: Categorize tasks (e.g., health, household, social).
- **Enhancements**: Voice input/output via Google Assistant.

### 4. Conversational AI for Companionship
- **Companion AI**: Engage in meaningful conversations with AI.
- **Mental Stimulation**: Access trivia, memory games, and more.

### 5. Emergency Contact and Alert System
- **Panic Button**: A simple button for instant emergency alerts.
- **Location Tracking**: Real-time location tracking during emergencies.
- **Enhancements**: Voice-activated alerts via Google Assistant.

### 6. Integration with Health Monitoring Devices
- **Health Data**: Connect to devices like blood pressure monitors and glucose meters.
- **Analysis**: Display and analyze health trends.

## 🛠️ Tech Stack

### **Backend**
- **Django**: Server-side logic and API development.
- **Django REST Framework**: For building RESTful APIs.
- **Google Cloud Firestore**: Real-time syncing database.
- **Neo4j**: Graph database for complex relationships.
- **PostgreSQL**: Relational database for structured data.
- **Celery**: Background task processing.

### **Frontend**
- **Flutter**: Cross-platform mobile app development.
- **Provider**: State management.
- **Firebase Cloud Messaging**: Push notifications.

### **Integration**
- **Google Assistant SDK**: Voice commands and interactions.
- **Google Calendar API**: Calendar synchronization.
- **Google Maps API**: Location-based services.
- **Google Dialogflow**: Conversational AI.
- **Google Fit API**: Health data collection.
- **TensorFlow**: Machine learning for health insights.

## 📁 Project Structure

### Frontend (Flutter)
```plaintext
elderly_care_companion_frontend/
├── lib/
│   ├── main.dart
│   ├── screens/
│   ├── providers/
│   ├── components/
│   ├── models/
│   ├── services/
│   ├── secure_storage.dart
├── android/
├── ios/
├── web/
├── test/
└── pubspec.yaml
```

### Backend (Django)
```plaintext
elderly_care_companion_backend/
├── app/
│   ├── models/
│   ├── routes/
│   ├── services/
│   ├── utils/
├── config/
├── tests/
├── migrations/
├── main.py
├── requirements.txt
└── .env
```

## ⚙️ Setup and Installation

### Prerequisites
- **Flutter**: Follow the [official installation guide](https://flutter.dev/docs/get-started/install).
- **Django**: Install Django and dependencies using pip.
- **PostgreSQL**: Ensure you have PostgreSQL installed and configured.

### Backend Setup
1. Clone the repository and navigate to the backend directory:
   ```bash
   git clone https://github.com/yourusername/ElderlyCareApp.git
   cd ElderlyCareApp/elderly_care_companion_backend/
   ```
2. Create and activate a virtual environment:
   ```bash
   python3 -m venv env
   source env/bin/activate
   ```
3. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Set up the PostgreSQL database:
   ```sql
   CREATE DATABASE health_app_db;
   CREATE USER health_app_user WITH PASSWORD 'strongpassword';
   ALTER ROLE health_app_user SET client_encoding TO 'utf8';
   ALTER ROLE health_app_user SET default_transaction_isolation TO 'read committed';
   ALTER ROLE health_app_user SET timezone TO 'UTC';
   GRANT ALL PRIVILEGES ON DATABASE health_app_db TO health_app_user;
   ```
5. Apply migrations:
   ```bash
   python manage.py migrate
   ```
6. Start the development server:
   ```bash
   python manage.py runserver
   ```

### Frontend Setup
1. Navigate to the frontend directory:
   ```bash
   cd ../elderly_care_companion_frontend/
   ```
2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on an emulator or connected device:
   ```bash
   flutter run
   ```

## 🎨 UI/UX Design

The app is designed with elderly users in mind. Key design considerations include:
- **Large, easy-to-read text and buttons.**
- **Clear and intuitive navigation.**
- **Voice commands and responses for ease of use.**

## 🤝 Contribution

We welcome contributions! Please follow these steps:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 💬 Contact

For any questions or feedback, feel free to reach out at [bajwa15523@gmail.com](mailto:bajwa15523@gmail.com).

---

**Thank you for contributing to the Elderly Care Companion project!**
```
