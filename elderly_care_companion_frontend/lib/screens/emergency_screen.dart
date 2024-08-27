import 'package:flutter/material.dart';

class EmergencyContactScreen extends StatefulWidget {
  const EmergencyContactScreen({super.key});

  @override
  _EmergencyContactScreenState createState() => _EmergencyContactScreenState();
}

class _EmergencyContactScreenState extends State<EmergencyContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final List<Map<String, String>> _contacts = [];

  void _addContact() {
    if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
      setState(() {
        _contacts.add({
          'name': _nameController.text,
          'phone': _phoneController.text,
        });
        _nameController.clear();
        _phoneController.clear();
      });
    }
  }

  Widget _buildContactList() {
    return ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: (context, index) {
        final contact = _contacts[index];
        return ListTile(
          title: Text(contact['name']!),
          subtitle: Text(contact['phone']!),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _contacts.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildAddContactForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Contact Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Contact Phone',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: _addContact,
            child: const Text('Add Contact'),
          ),
        ],
      ),
    );
  }

  void _sendEmergencyAlert() {
    // Logic for sending emergency alerts to contacts
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Emergency Alert'),
        content: const Text('Emergency alert sent to all contacts.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contact and Alert System'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildContactList(),
          ),
          _buildAddContactForm(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendEmergencyAlert,
        backgroundColor: Colors.red,
        child: const Icon(Icons.warning),
      ),
    );
  }
}
