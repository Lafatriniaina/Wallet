import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceUserRegister {
  // ignore: non_constant_identifier_names
  Future<int?> UserRegiter(
      String name, String firstname, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/users/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'firstname': firstname,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to create user.');
      }

      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['id'];
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
