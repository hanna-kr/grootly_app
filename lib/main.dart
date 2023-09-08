import 'package:flutter/material.dart';
import 'package:grootly_app/Screens/home.dart';
import 'package:grootly_app/Screens/profile.dart';
import 'package:grootly_app/Screens/recipes.dart';
import 'package:grootly_app/Screens/search.dart';
import 'package:grootly_app/Screens/settings.dart';
import 'package:grootly_app/Screens/settings_languages.dart';
import 'package:grootly_app/Screens/startpage.dart';
import 'package:grootly_app/Screens/tips.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/home': (context) => const HomePage(),
        '/recipes': (context) => const RecipePage(),
        '/search': (context) => const SearchPage(),
        '/tips': (context) => const TipsPage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/languages': (context) => const LanguagePage()
      },
    );
  }
}
