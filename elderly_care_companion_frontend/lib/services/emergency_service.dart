import 'dart:convert';
import 'package:http/http.dart' as http;

class EmergencyService {
  final String baseUrl;

  EmergencyService({required this.baseUrl});

  Future<void> sendEmergencyAlert(String userId, String message) async {
    final url = Uri.parse('$baseUrl/emergency-alert');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'userId': userId,
        'message': message,
      }),
    );

    if (response.statusCode != 200) {
      throw 'Failed to send emergency alert';
    }
  }
}
