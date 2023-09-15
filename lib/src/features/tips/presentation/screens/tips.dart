import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/Theme/color_theme.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grootlyTheme.primaryColor,
        title: const Text(
          'Tipps',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
        actions: const [
          Icon(Icons.favorite),
          Padding(padding: EdgeInsets.all(8))
        ],
      ),
    );
  }
}
