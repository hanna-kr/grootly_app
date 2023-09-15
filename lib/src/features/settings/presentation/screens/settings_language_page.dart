import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'Sprachauswahl',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop<bool>(context, true);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).primaryColor.withOpacity(0.6),
                  )),
                  child: const Text(
                    'Deutsch',
                  )),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop<bool>(context, false);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).primaryColor.withOpacity(0.6),
                  )),
                  child: const Text('Englisch')),
            ],
          ),
        ],
      ),
    );
  }
}
