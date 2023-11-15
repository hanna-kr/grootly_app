import 'package:flutter/material.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/auth_provider.dart';
import 'package:grootly_app/src/features/authentication/presentation/widget/login_widget.dart';
import 'package:grootly_app/src/features/authentication/presentation/widget/sign_up_widget.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return provider.isLogin
          ? LoginWidget(
              onClickedSignUp: provider.toggle,
            )
          : SignUpWidget(onClickedSignIn: provider.toggle);
    });
  }
}
