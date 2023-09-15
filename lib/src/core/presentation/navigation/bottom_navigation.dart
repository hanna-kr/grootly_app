import 'package:flutter/material.dart';

import '../../Theme/color_theme.dart';

class BottomMenu extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onClicked;

  const BottomMenu({
    super.key,
    required this.selectedIndex,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: grootlyTheme.primaryColor,
      selectedItemColor: const Color.fromRGBO(255, 242, 230, 1),
      unselectedItemColor:
          const Color.fromRGBO(255, 242, 230, 1).withOpacity(0.4),
      iconSize: 24,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.cookie), label: 'Recipes'),
        BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Tips')
      ],
      currentIndex: selectedIndex,
      onTap: onClicked,
    );
  }
}
