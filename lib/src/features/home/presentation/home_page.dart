import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/icons/grootly_icons_icons.dart';
import 'package:grootly_app/src/features/favourite/presentation/screens/favourite_screen.dart';
import 'package:grootly_app/src/features/home/presentation/home_provider.dart';
import 'package:grootly_app/src/features/home/presentation/home_screen.dart';
import 'package:grootly_app/src/features/recipes/presentation/screens/recipes_screen.dart';
import 'package:grootly_app/src/features/tips/presentation/screens/tips_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const RecipeScreen(),
      const TipsScreen(),
      const FavouriteScreen(),
    ];

    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: screens[provider.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: GrootlyColor.primary,
          selectedItemColor: GrootlyColor.white,
          unselectedItemColor: GrootlyColor.lightgrey,
          iconSize: 24,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.houseChimneyWindow),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.bowlFood), label: 'Rezepte'),
            BottomNavigationBarItem(
                icon: FaIcon(GrootlyIcons.sustainable), label: 'Tipps'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidHeart), label: 'Favoriten'),
          ],
          currentIndex: provider.selectedIndex,
          onTap: provider.onItemTapped,
        ),
      );
    });
  }
}
