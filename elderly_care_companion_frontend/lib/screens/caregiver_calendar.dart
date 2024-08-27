import 'package:flutter/material.dart';

class CaregiverCalendarScreen extends StatelessWidget {
  const CaregiverCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caregiver Calendar'),
      ),
      body: const Center(
        child: Text('Caregiver Calendar Screen'),
      ),
    );
  }
}
