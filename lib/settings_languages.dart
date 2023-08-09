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
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(179, 224, 213, 1),
                  )),
                  child: const Text(
                    'Deutsch',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 45, 34, 1),
                        fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop<bool>(context, false);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(179, 224, 213, 1),
                  )),
                  child: const Text(
                    'Englisch',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 45, 34, 1),
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
