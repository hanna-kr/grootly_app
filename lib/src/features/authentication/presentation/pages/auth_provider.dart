import 'package:flutter/material.dart';
import 'package:grootly_app/src/features/authentication/application/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  // variables

  AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _passwordVisible = false;
  final bool _isEmailVerified = false;
  final bool _canResendEmail = false;
  bool _isLogin = false;

  String _errormessage = '';

// getter

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get nameController => _nameController;
  bool get passwordVisible => _passwordVisible;
  bool get isEmailVerified => _isEmailVerified;
  bool get canResendEmail => _canResendEmail;
  bool get isLogin => _isLogin;
  String get errormessage => _errormessage;

// functions

// SignUp with Email

  Future<void> signUp() async {
    try {
      await authService
          .signUpWithEmail(
            _emailController.text,
            _passwordController.text,
          )
          .then((value) => clearController());
      // // Add User Details
      // authService
      //     .addUserDetails(
      //         _nameController.text.trim(), _emailController.text.trim())
      //     .then((value) => clearController());
    } catch (e) {
      clearController();
      rethrow;
    }
    clearController();
    notifyListeners();
  }

// SignIn with Email

  Future<void> signInWithEmail() async {
    try {
      await authService
          .signIn(_emailController.text, _passwordController.text)
          .then((value) {
        clearController();
      });
    } catch (e) {
      clearController();
      rethrow;
    }
    notifyListeners();
  }

// Reset Password

  Future<void> resetPassword() async {
    try {
      await authService.resetPassword(_emailController.text).then((value) {
        clearController();
      });
    } catch (e) {
      clearController();
      rethrow;
    }
    notifyListeners();
  }

// Verify Email

  // Future sendVerificationEmail() async {
  //   final user = FirebaseAuth.instance.currentUser!;
  //   try {
  //     await user.sendEmailVerification();
  //   } catch (e) {
  //     rethrow;
  //   }
  //   notifyListeners();
  // }

// clearController

  void clearController() {
    _emailController.clear();
    _passwordController.clear();
  }

// Password visibility

  void isVisible() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

// Toggle between Login and SignUp

  void toggle() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

// Error message Reauthentication

  void setErrorMessage(String errormessage) {
    _errormessage = errormessage;
    notifyListeners();
  }
}
