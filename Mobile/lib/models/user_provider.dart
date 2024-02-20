import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String? _token;

  UserProvider() {
    _loadJWT();
  }

  String? get token => _token;

  set token(String? value) {
    if (_token != value) {
      _token = value;
      notifyListeners();
    }
  }

  Future<void> _loadJWT() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('jwt') ?? '';
    notifyListeners();
  }
}
