import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/home/home.dart';
import 'package:grootly_app/src/core/presentation/navigation/bottom_nav_page.dart';
import 'package:grootly_app/src/core/presentation/splash_screen.dart';
import 'package:grootly_app/src/features/profile/presentation/screens/profile_page.dart';
import 'package:grootly_app/src/features/recipes/presentation/screens/recipes.dart';
import 'package:grootly_app/src/features/search/presentation/screens/search_page.dart';
import 'package:grootly_app/src/features/settings/presentation/screens/settings_language_page.dart';
import 'package:grootly_app/src/features/settings/presentation/screens/settings_page.dart';
import 'package:grootly_app/src/features/tips/presentation/screens/tips.dart';

class GrootlyApp extends StatelessWidget {
  const GrootlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grootly App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/bottom_nav': (context) => const BottomNavPage(),
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
