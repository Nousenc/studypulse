import 'dart:convert';
import 'package:http/http.dart' as http;

/// Gets a Moodle Web Services token for the student.
class MoodleAuthService {
  Future<String> requestToken(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://dl.nure.ua/login/token.php'),
      body: {
        'username': username,
        'password': password,
        'service': 'moodle_mobile_app',
      },
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data['token'] as String;
  }
}
