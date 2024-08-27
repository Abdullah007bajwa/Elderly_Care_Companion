import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HealthMonitoringScreen extends StatefulWidget {
  const HealthMonitoringScreen({super.key});

  @override
  _HealthMonitoringScreenState createState() => _HealthMonitoringScreenState();
}

class _HealthMonitoringScreenState extends State<HealthMonitoringScreen> {
  final TextEditingController _deviceNameController = TextEditingController();
  final List<Map<String, String>> _devices = [];

  void _addDevice() {
    if (_deviceNameController.text.isNotEmpty) {
      setState(() {
        _devices.add({
          'name': _deviceNameController.text,
        });
        _deviceNameController.clear();
      });
    }
  }

  Widget _buildDeviceList() {
    return ListView.builder(
      itemCount: _devices.length,
      itemBuilder: (context, index) {
        final device = _devices[index];
        return ListTile(
          title: Text(device['name']!),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _devices.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildAddDeviceForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _deviceNameController,
            decoration: const InputDecoration(
              labelText: 'Device Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: _addDevice,
            child: const Text('Add Device'),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthDataGraph() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Health Data',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 200, child: LineChart(LineChartData(
            borderData: FlBorderData(show: false),
            titlesData: const FlTitlesData(show: false),
            gridData: const FlGridData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 3),
                  const FlSpot(1, 1),
                  const FlSpot(2, 4),
                  const FlSpot(3, 2),
                  const FlSpot(4, 5),
                ],
                isCurved: true,
                color: Colors.blue, // Update this line
                dotData: const FlDotData(show: false),
              ),
            ],
          ))),
        ],
      ),
    );
  }

  Widget _buildHealthInsights() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            'Health Insights',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Placeholder for actual health insights
          SizedBox(height: 100, child: Center(child: Text('Health trends and insights will be displayed here.'))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Monitoring'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildHealthDataGraph(),
                _buildHealthInsights(),
                _buildDeviceList(),
              ],
            ),
          ),
          _buildAddDeviceForm(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'healthMonitoringFab', // Unique hero tag
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
