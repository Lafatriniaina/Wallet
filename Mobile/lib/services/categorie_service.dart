// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserCategoriesService {
  Uri URI_CATEGORY = Uri.parse('http://localhost:8000/categories/');

  Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(
      URI_CATEGORY,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> addCategory(
      String categoryName, String categoryType, String iconName) async {
    try {
      final response = await http.post(
        URI_CATEGORY,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'category_name': categoryName,
          'category_type': categoryType,
          'icon_name': iconName,
        }),
      );

      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Erreur lors de l\'ajout de la catégorie');
      }
    } catch (e) {
      print('Erreur lors de l\'ajout de la catégorie: $e');
    }
  }
}
