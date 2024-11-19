import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://mediadwi.com/api/latihan';

  Future<Map<String, dynamic>> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Login failed');
    }
  }
}
