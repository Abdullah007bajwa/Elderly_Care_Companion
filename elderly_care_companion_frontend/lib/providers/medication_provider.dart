import 'package:flutter/material.dart';
import 'database_provider.dart';
import '../models/medication.dart';

class MedicationProvider with ChangeNotifier {
  List<Medication> _medications = [];
  late DatabaseProvider _databaseProvider;

  MedicationProvider() {
    _databaseProvider = DatabaseProvider();
    _loadMedications();
  }

  List<Medication> get medications => _medications;

  Future<void> _loadMedications() async {
    _medications = await _databaseProvider.getMedications();
    notifyListeners();
  }

  Future<void> addMedication(Medication medication) async {
    final id = await _databaseProvider.insertMedication(medication);
    medication = Medication(
        id: id,
        name: medication.name,
        dosage: medication.dosage,
        frequency: medication.frequency);
    _medications.add(medication);
    notifyListeners();
  }

  Future<void> removeMedication(int id) async {
    await _databaseProvider.deleteMedication(id);
    _medications.removeWhere((med) => med.id == id);
    notifyListeners();
  }
}
