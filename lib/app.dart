import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/features/home/presentation/home_page.dart';
import 'package:grootly_app/src/features/authentication/presentation/login_screen.dart';
import 'package:grootly_app/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:grootly_app/src/features/home/presentation/home_provider.dart';
import 'package:grootly_app/src/features/profile/presentation/screens/profile_page.dart';
import 'package:grootly_app/src/features/recipes/presentation/screens/recipe_form.dart';
import 'package:grootly_app/src/features/favourite/presentation/screens/favourite_screen.dart';
import 'package:grootly_app/src/features/recipes/presentation/screens/recipes_screen.dart';
import 'package:grootly_app/src/features/settings/presentation/screens/settings_language_page.dart';
import 'package:grootly_app/src/features/settings/presentation/screens/settings_page.dart';
import 'package:grootly_app/src/features/tips/presentation/screens/tips_screen.dart';
import 'package:provider/provider.dart';

class GrootlyApp extends StatelessWidget {
  const GrootlyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grootly App',

        // themeMode: ThemeMode.light,
        // theme: ThemeData.light(useMaterial3: true),
        // darkTheme: ThemeData.dark(useMaterial3: true),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/sign_up': (context) => const SignUpPage(),
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/recipes': (context) => const RecipeScreen(),
          '/search': (context) => const FavouriteScreen(),
          '/tips': (context) => const TipsScreen(),
          '/profile': (context) => const ProfilePage(),
          '/settings': (context) => const SettingsPage(),
          '/languages': (context) => const LanguagePage(),
          '/recipe_creator': (context) => const RecipeCreatorPage(),
          '/bottom_nav_page': (context) => ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider(), child: const HomePage())
        });
  }
}
