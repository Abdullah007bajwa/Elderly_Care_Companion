class Task {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime dueDate;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      this.isCompleted = false,
      required this.dueDate});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isCompleted': isCompleted,
        'dueDate': dueDate.toIso8601String(),
      };

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'] ?? false,
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'])
          : DateTime.now(),
    );
  }
}
