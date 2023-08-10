import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool selectedLanguage = true;
  TimeOfDay lastChanged = const TimeOfDay(hour: 08, minute: 15);

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Sprachauswahl:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(179, 224, 213, 1),
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    selectedLanguage ? 'Deutsch' : 'Englisch',
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 45, 34, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              onTap: () async {
                final userAnswer =
                    await Navigator.pushNamed(context, '/languages') as bool?;

                if (userAnswer != null) {
                  setState(() {
                    selectedLanguage = userAnswer;
                    lastChanged = TimeOfDay.now();
                  });
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Zuletzt geändert:'),
            const SizedBox(
              height: 8,
            ),
            Text(
                '${lastChanged.hour} : ${lastChanged.minute < 10 ? '0' : ''} ${lastChanged.minute}'),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Color.fromRGBO(255, 211, 171, 1),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(179, 224, 213, 1),
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'back to home',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 45, 34, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              onTap: () {
                Navigator.popUntil(
                    context, (route) => route.settings.name == '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
