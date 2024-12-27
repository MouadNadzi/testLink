// File: lib/controllers/auth_controller.dart
import 'package:flutter/foundation.dart';
import '../models/user.dart';

class AuthController extends ChangeNotifier {
  bool _isInitialized = false;
  bool _isAuthenticated = false;
  User? _currentUser;
  String? _error;

  bool get isInitialized => _isInitialized;
  bool get isAuthenticated => _isAuthenticated;
  User? get currentUser => _currentUser;
  String? get error => _error;

  AuthController() {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // Simulate checking stored credentials
      await Future.delayed(const Duration(seconds: 2));
      // TODO: Implement actual credential check
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isInitialized = true;
      notifyListeners();
    }
  }

  Future<void> login(String username, String password) async {
    try {
      _error = null;
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      if (username == 'test' && password == 'test') {
        _currentUser = User(
          id: '1',
          username: username,
          email: 'test@example.com',
          name: 'Test User',
        );
        _isAuthenticated = true;
        notifyListeners();
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> register(String username, String email, String password) async {
    try {
      _error = null;
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      _currentUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        username: username,
        email: email,
        name: username,
      );
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      _error = null;
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
      _currentUser = null;
      _isAuthenticated = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}