import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/navigation/bottom_navigation.dart';
import 'package:grootly_app/src/core/presentation/home/home.dart';
import 'package:grootly_app/src/features/recipes/presentation/screens/recipes.dart';
import 'package:grootly_app/src/features/search/presentation/screens/search_page.dart';
import 'package:grootly_app/src/features/tips/presentation/screens/tips.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  List<Widget> screens = [
    const HomePage(),
    const SearchPage(),
    const RecipePage(),
    const TipsPage()
  ];

  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar:
            BottomMenu(selectedIndex: _selectedIndex, onClicked: onItemTapped));
  }
}
