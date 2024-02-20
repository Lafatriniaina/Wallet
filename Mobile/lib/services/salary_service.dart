import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceUserSalary {
  // ignore: non_constant_identifier_names
  Future<void> UserSalary(
      int userId, String job, double salary, String devise) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/salary/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'user': userId,
          'job': job,
          'salary': salary,
          'devise': devise,
        }),
      );
      // ignore: unused_local_variable
      var jsonResponse = jsonDecode(response.body);

      if (response.statusCode != 201) {
        throw Exception('Failed to create salary.');
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}
