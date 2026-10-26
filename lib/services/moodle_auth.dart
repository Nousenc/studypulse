import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

/// Gets a Moodle Web Services token for the student and keeps it
/// only on the device, in encrypted storage. The password is never stored.
class InvalidLoginException implements Exception {
  InvalidLoginException(this.message);
  final String message;
  @override
  String toString() => message;
}

class MoodleAuthService {
  MoodleAuthService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;
  static const _tokenKey = 'moodle_token';

  Future<String> requestToken(String username, String password) async {
    final response = await http.post(
      Uri.parse('${AppConfig.moodleBaseUrl}/login/token.php'),
      body: {
        'username': username,
        'password': password,
        'service': 'moodle_mobile_app',
      },
    ).timeout(AppConfig.requestTimeout);
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    if (data['token'] == null) {
      // Moodle returns {"error": "...", "errorcode": "invalidlogin"}
      throw InvalidLoginException(
          data['error'] as String? ?? 'Invalid login, please try again');
    }
    final token = data['token'] as String;
    await _storage.write(key: _tokenKey, value: token);
    return token;
  }

  Future<String?> savedToken() => _storage.read(key: _tokenKey);

  Future<void> signOut() => _storage.delete(key: _tokenKey);
}
