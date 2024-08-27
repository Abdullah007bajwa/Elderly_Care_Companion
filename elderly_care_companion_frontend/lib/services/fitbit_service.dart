import 'dart:convert';
import 'package:http/http.dart' as http;

class FitbitService {
  final String baseUrl;
  final String accessToken;

  FitbitService({required this.baseUrl, required this.accessToken});

  Future<Map<String, dynamic>> getHeartRateData() async {
    final url =
        Uri.parse('$baseUrl/1/user/-/activities/heart/date/today/1d.json');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw 'Failed to fetch heart rate data';
    }
  }

  Future<Map<String, dynamic>> getSleepData() async {
    final url = Uri.parse('$baseUrl/1.2/user/-/sleep/date/today.json');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw 'Failed to fetch sleep data';
    }
  }
}
