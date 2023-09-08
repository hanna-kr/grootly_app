import 'package:flutter/material.dart';
import 'package:grootly_app/Screens/home.dart';
import 'package:grootly_app/Screens/recipes.dart';
import 'package:grootly_app/Screens/search.dart';
import 'package:grootly_app/Screens/tips.dart';
import 'package:grootly_app/Styles/Icons/grootly_icons_icons.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: const Color.fromRGBO(255, 242, 230, 1),
        unselectedItemColor: const Color.fromRGBO(0, 60, 46, 1),
        iconSize: 24,
        showSelectedLabels: true,
        showUnselectedLabels: false,
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
        onTap: onItemTapped,
      ),
    );
  }
}
