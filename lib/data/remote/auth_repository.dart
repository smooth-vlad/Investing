import 'package:flutter/foundation.dart';

class AuthRepository extends ChangeNotifier {
  String? _token;

  String? get token => _token;

  void setToken(String newToken) {
    _token = newToken;
    notifyListeners();
  }
}
