import 'package:flutter/material.dart';

class DailyTaskManagementScreen extends StatefulWidget {
  const DailyTaskManagementScreen({super.key});

  @override
  _DailyTaskManagementScreenState createState() => _DailyTaskManagementScreenState();
}

class _DailyTaskManagementScreenState extends State<DailyTaskManagementScreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> _tasks = [
    {'title': 'Take Medication', 'category': 'Health', 'dueDate': 'Today'},
    {'title': 'Clean Living Room', 'category': 'Household', 'dueDate': 'Today'},
    {'title': 'Call Friend', 'category': 'Social', 'dueDate': 'Tomorrow'},
  ];

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _addTask(Map<String, String> newTask) {
    setState(() {
      _tasks.add(newTask);
    });
  }

  void _showAddTaskForm() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _buildAddTaskForm(context);
      },
    );
  }

  Widget _buildAddTaskForm(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final dueDateController = TextEditingController();
    final priorityController = TextEditingController();
    final notesController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the task title';
                }
                return null;
              },
            ),
            TextFormField(
              controller: dueDateController,
              decoration: const InputDecoration(labelText: 'Due Date'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the due date';
                }
                return null;
              },
            ),
            TextFormField(
              controller: priorityController,
              decoration: const InputDecoration(labelText: 'Priority'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the priority';
                }
                return null;
              },
            ),
            TextFormField(
              controller: notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter any notes';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _addTask({
                    'title': titleController.text,
                    'category': 'General',
                    'dueDate': dueDateController.text,
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Task Management'),
      ),
      body: Column(
        children: <Widget>[
          _buildTaskList(),
          _buildAddTaskButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'taskManagementFab', // Unique hero tag
        onPressed: _showAddTaskForm,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
            child: ListTile(
              title: Text(
                _tasks[index]['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${_tasks[index]['category']} - Due: ${_tasks[index]['dueDate']}'),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAddTaskButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: _showAddTaskForm,
        child: const Text('Add Task'),
      ),
    );
  }
}
