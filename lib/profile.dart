import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'Profile',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.orangeAccent,
              ),
              const SizedBox(
                height: 120,
              ),
              const Text('Vorname:'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Vorname',
                      hintText: 'Hier kannst du deinen Vornamen ändern'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Familienname:'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Nachname',
                      hintText: 'Hier kannst du deinen Familiennamen ändern'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop<String>(context);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(179, 224, 213, 1),
                  )),
                  child: const Text(
                    'speichern',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 45, 34, 1),
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
