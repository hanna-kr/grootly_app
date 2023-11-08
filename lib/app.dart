import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/features/authentication/domain/utils.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/password_forgotten.dart';
import 'package:grootly_app/src/features/home/presentation/home_page.dart';
import 'package:grootly_app/src/features/authentication/presentation/pages/main_page.dart';
import 'package:grootly_app/src/features/home/presentation/home_provider.dart';
import 'package:grootly_app/src/features/profile/presentation/screens/profile_page.dart';
import 'package:grootly_app/src/features/recipes/presentation/screens/recipe_form.dart';
import 'package:grootly_app/src/features/favourite/presentation/screens/favourite_screen.dart';
import 'package:grootly_app/src/features/recipes/presentation/screens/recipes_screen.dart';
import 'package:grootly_app/src/features/settings/presentation/screens/settings_page.dart';
import 'package:grootly_app/src/features/tips/presentation/screens/tips_screen.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class GrootlyApp extends StatelessWidget {
  const GrootlyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: Utils.messengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Grootly App',
        initialRoute: '/',
        routes: {
          '/': (context) => const MainPage(),
          '/forgot_password': (context) => const PasswordForgottenPage(),
          '/home': (context) => const HomePage(),
          '/recipes': (context) => const RecipeScreen(),
          '/search': (context) => const FavouriteScreen(),
          '/tips': (context) => const TipsScreen(),
          '/profile': (context) => const ProfilePage(),
          '/settings': (context) => const SettingsPage(),
          '/recipe_creator': (context) => const RecipeCreatorPage(),
          '/bottom_nav_page': (context) => const HomePage(),
        },
      ),
    );
  }
}
