import 'package:flutter/material.dart';
import 'services/gemini_service.dart';
import 'package:elderly_care_companion/screens/home_screen.dart';
import 'package:elderly_care_companion/screens/medication_screen.dart';
import 'package:elderly_care_companion/screens/appointment_screen.dart';
import 'package:elderly_care_companion/screens/task_screen.dart';
import 'package:elderly_care_companion/screens/health_screen.dart';
import 'package:elderly_care_companion/screens/emergency_screen.dart';
import 'package:elderly_care_companion/screens/ai_companion_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  final geminiService = GeminiService(apiKey: 'AIzaSyAf4bggM6glD_VDQH7Ul7HsE7UxdEcCj5I');
  geminiService.initialize();
  
  runApp(MyApp(geminiService: geminiService));
}

class MyApp extends StatelessWidget {
  final GeminiService geminiService;

  const MyApp({super.key, required this.geminiService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(geminiService: geminiService),
        '/medications': (context) => const MedicationForm(),
        '/appointments': (context) => const AppointmentSchedulingScreen(),
        '/tasks': (context) => const DailyTaskManagementScreen(),
        '/health': (context) => const HealthMonitoringScreen(),
        '/emergency': (context) => const EmergencyContactScreen(),
        '/ai_companion': (context) => const ConversationalAIScreen(),
      },
    );
  }
}
