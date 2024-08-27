// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class MedicationForm extends StatefulWidget {
  const MedicationForm({super.key});

  @override
  _MedicationFormState createState() => _MedicationFormState();
}

class _MedicationFormState extends State<MedicationForm> {
  final _formKey = GlobalKey<FormState>();
  late String _medicationName;
  late String _dosage;
  late String _frequency;

  void _saveMedication() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Handle medication saving logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Medication Name'),
                onSaved: (value) {
                  _medicationName = value ?? '';
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter medication name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Dosage'),
                onSaved: (value) {
                  _dosage = value ?? '';
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter dosage';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Frequency'),
                onSaved: (value) {
                  _frequency = value ?? '';
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter frequency';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMedication,
                child: const Text('Save Medication'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'medicationFormFab', // Unique hero tag
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
