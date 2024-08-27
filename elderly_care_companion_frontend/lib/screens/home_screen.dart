import 'package:flutter/material.dart';
import '../services/gemini_service.dart'; // Update with the correct path

class HomeScreen extends StatefulWidget {
  final GeminiService geminiService;

  const HomeScreen({super.key, required this.geminiService});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elderly Care Companion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            const SizedBox(height: 20),
            _buildTodayOverview(),
            const Spacer(),
            _buildEmergencyButton(context),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButtons(context),
    );
  }

  Widget _buildHeader() {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeIn,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, User!', // Optionally, you can integrate dynamic user names here
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            '“The best way to predict your future is to create it.”',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayOverview() {
    return Column(
      children: [
        _buildOverviewCard('Medications', 'Today’s medication schedule'),
        const SizedBox(height: 10),
        _buildOverviewCard('Appointments', 'Upcoming appointments'),
        const SizedBox(height: 10),
        _buildOverviewCard('Tasks', 'Tasks for today'),
      ],
    );
  }

  Widget _buildOverviewCard(String title, String subtitle) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeIn,
        ),
      ),
      child: Card(
        child: ListTile(
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }

  Widget _buildEmergencyButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/emergency');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: const Text(
            'Emergency',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFloatingActionButton(
          icon: Icons.add,
          onPressed: () {
            Navigator.pushNamed(context, '/medications');
          },
          tooltip: 'Add Medication',
        ),
        const SizedBox(height: 16),
        _buildFloatingActionButton(
          icon: Icons.calendar_today,
          onPressed: () {
            Navigator.pushNamed(context, '/appointments');
          },
          tooltip: 'Add Appointment',
        ),
        const SizedBox(height: 16),
        _buildFloatingActionButton(
          icon: Icons.task,
          onPressed: () {
            Navigator.pushNamed(context, '/tasks');
          },
          tooltip: 'Add Task',
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      hoverElevation: 10.0,
      hoverColor: Colors.blueAccent,
      child: Icon(icon),
    );
  }
}
