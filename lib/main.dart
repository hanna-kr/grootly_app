import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meine App',
      theme: ThemeData(
        primaryColor: Color(0xFF008868),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Grootly'),
        leading: Icon(Icons.list_alt),
        actions: [
          Icon(Icons.person),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Code, der beim Klicken von Option 1 ausgeführt wird
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Code, der beim Klicken von Option 2 ausgeführt wird
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Body'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Code, der beim Klicken des FloatingActionButton ausgeführt wird
        },
        child: Icon(Icons.shopping_basket_sharp),
      ),
    );
  }
}
