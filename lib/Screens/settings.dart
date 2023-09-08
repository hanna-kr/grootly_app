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
            ElevatedButton(
              onPressed: () async {
                final userAnswer =
                    await Navigator.pushNamed(context, '/languages') as bool?;

                if (userAnswer != null) {
                  setState(() {
                    selectedLanguage = userAnswer;
                    lastChanged = TimeOfDay.now();
                  });
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).primaryColor.withOpacity(0.8),
              )),
              child: Text(
                selectedLanguage ? 'Deutsch' : 'Englisch',
              ),
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
            Divider(
              height: 16,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                      context, (route) => route.settings.name == '/');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).primaryColor.withOpacity(0.8),
                )),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Icon(Icons.home),
                ))
          ],
        ),
      ),
    );
  }
}
