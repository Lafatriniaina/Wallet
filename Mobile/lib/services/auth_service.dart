import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final http.Client _client = http.Client();
  final String apiUrl = "http://localhost:8000";

  Future<Map<String, dynamic>> login(
      String name, String email, String password) async {
    try {
      final response = await _client.post(
        Uri.parse('$apiUrl/login/'),
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode(
          <String, dynamic>{
            "name": name,
            "email": email,
            "password": password,
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        return data;
      } else {
        throw Exception('Failed to load data');
      }
      // ignore: empty_catches
    } catch (e) {
      print(e);
      return {};
    }
  }

  Future<bool> isTokenValid(String token) async {
    try {
      var parts = token.split('.');
      var payload = base64Url.decode(parts[1]);
      var payloadMap = jsonDecode(utf8.decode(payload));

      var now = DateTime.now().millisecondsSinceEpoch;
      return payloadMap['exp'] > now;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void storeJWT(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('jwt', token);
  }

  Future<String> getJWT() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt') ?? '';
  }

  Future<bool> deleteJWT() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: unnecessary_null_comparison
    bool result = await prefs.remove('jwt') != null;
    // ignore: avoid_print
    print("JWT deleted: $result");
    return result;
  }
}
