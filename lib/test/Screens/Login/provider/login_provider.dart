import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  User? _user;
  String? _errorMessage;
  bool isLoggedIn = false;

  AuthProvider() {
    _user = _firebaseAuth.currentUser;
    _firebaseAuth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;
  String? get errorMessage => _errorMessage;

  // Sign In Method
  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      _errorMessage = null;
      notifyListeners();
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      isLoggedIn = true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _handleAuthError(e);
      notifyListeners();
    }
  }

  // Sign Out Method
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _user = null;
    notifyListeners();
  }

  // Error Handling
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found for this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }
}
