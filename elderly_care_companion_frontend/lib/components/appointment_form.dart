import 'package:flutter/material.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String date;

  void _saveAppointment() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Handle appointment saving logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              onSaved: (value) {
                title = value ?? '';
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter title';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Date'),
              onSaved: (value) {
                date = value ?? '';
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter date';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAppointment,
              child: const Text('Save Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
