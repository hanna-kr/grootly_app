import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'Einstellungen',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                color: Colors.orange,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('back to home'),
                ),
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
