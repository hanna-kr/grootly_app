import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/spacing/spacing.dart';
import 'package:grootly_app/src/core/presentation/widgets/primary_button.dart';
import 'package:grootly_app/src/core/presentation/widgets/secondary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrootlyColor.white,
      body: Padding(
        padding: PaddingAll.l,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 200,
                        width: 200,
                        child:
                            Image.asset('assets/images/logo/grootlylogo.png')),
                    Column(
                      children: [
                        TextFormField(
                            // controller: _emailController,
                            // keyboardType: TextInputType.emailAddress,
                            // decoration: kTextfieldDeco,
                            ),
                        SpacingH.l,
                        TextFormField(),
                      ],
                    ),
                    PrimaryButton(text: 'Jetzt registrieren', onPressed: () {}),
                    Divider(),
                    SecondaryButton(text: 'Login mit Google', onPressed: () {})
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
