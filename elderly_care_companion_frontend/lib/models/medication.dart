class Medication {
  final int? id;
  final String name;
  final String dosage;
  final String frequency;

  Medication(
      {this.id,
      required this.name,
      required this.dosage,
      required this.frequency});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dosage': dosage,
      'frequency': frequency,
    };
  }

  factory Medication.fromMap(Map<String, dynamic> map) {
    return Medication(
      id: map['id'],
      name: map['name'],
      dosage: map['dosage'],
      frequency: map['frequency'],
    );
  }
}
