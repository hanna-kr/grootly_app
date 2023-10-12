import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/icons/grootly_icons_icons.dart';
import 'package:grootly_app/src/features/home/presentation/home.dart';
import 'package:grootly_app/src/features/recipes/presentation/screens/recipes.dart';
import 'package:grootly_app/src/features/search/presentation/screens/search_page.dart';
import 'package:grootly_app/src/features/tips/presentation/screens/tips.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomePage(),
      const RecipePage(),
      const TipsPage(),
      const SearchPage(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: GrootlyColor.primary,
        selectedItemColor: GrootlyColor.white,
        unselectedItemColor: GrootlyColor.white.withOpacity(0.7),
        iconSize: 30,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(GrootlyIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(GrootlyIcons.food), label: 'Rezepte'),
          BottomNavigationBarItem(
              icon: Icon(GrootlyIcons.sustainablehand), label: 'Tipps'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined), label: 'Favouriten'),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
