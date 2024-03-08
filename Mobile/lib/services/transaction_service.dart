// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'package:http/http.dart' as http;

class TransactionService {
  Uri FETCH_TRANSACTION_GAINER_URI =
      Uri.parse("http://localhost:8000/transactions/top_gainers/");
  Uri FETCH_TRANSACTION_LOSER_URI =
      Uri.parse("http://localhost:8000/transactions/top_losers/");
  Uri LATEST_TRANSACTION_URI =
      Uri.parse("http://localhost:8000/transactions/latest_transactions/");

  Future<List<dynamic>> fetchTopGainers(double userId) async {
    var fullUri = FETCH_TRANSACTION_GAINER_URI.replace(
      queryParameters: {
        "user_id": userId.toString(),
      },
    );

    final response = await http.get(
      fullUri,
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

  Future<List<dynamic>> fetchTopLosers(double userId) async {
    var fullUri = FETCH_TRANSACTION_LOSER_URI.replace(
      queryParameters: {
        "user_id": userId.toString(),
      },
    );

    final response = await http.get(
      fullUri,
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

  Future<List<dynamic>> latestTransactionLists(double userId) async {
    var fullUri = LATEST_TRANSACTION_URI.replace(
      queryParameters: {
        "user_id": userId.toString(),
      },
    );

    final response = await http.get(
      fullUri,
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
}
