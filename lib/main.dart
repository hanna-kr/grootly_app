import 'package:flutter/material.dart';
import 'package:grootly_app/grootly_icons_icons.dart';
import 'package:grootly_app/home.dart';
import 'package:grootly_app/profile.dart';
import 'package:grootly_app/recipes.dart';
import 'package:grootly_app/search.dart';
import 'package:grootly_app/settings.dart';
import 'package:grootly_app/tips.dart';

void main() {
  runApp(const GrootlyApp());
}

class GrootlyApp extends StatelessWidget {
  const GrootlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grootly App',
      theme: ThemeData(
        primaryColor: const Color(0xFF008868),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/recipes': (context) => const RecipePage(),
        '/search': (context) => const SearchPage(),
        '/tips': (context) => const TipsPage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage()
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> screens = [
    const HomePage(),
    const SearchPage(),
    const RecipePage(),
    const TipsPage()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: const Color.fromRGBO(255, 242, 230, 1),
        unselectedItemColor: const Color.fromRGBO(0, 60, 46, 1),
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(GrootlyIcons.home2), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(GrootlyIcons.search2), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(GrootlyIcons.chefshat2), label: 'Recipes'),
          BottomNavigationBarItem(
              icon: Icon(GrootlyIcons.sustainablehand), label: 'Tips')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
