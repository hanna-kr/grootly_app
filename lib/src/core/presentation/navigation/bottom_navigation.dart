import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/icons/grootly_icons_icons.dart';

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
      backgroundColor: GrootlyColor.primary,
      selectedItemColor: GrootlyColor.offWhite,
      unselectedItemColor: GrootlyColor.offWhite.withOpacity(0.4),
      iconSize: 30,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(GrootlyIcons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(GrootlyIcons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(GrootlyIcons.chefshat), label: 'Recipes'),
        BottomNavigationBarItem(
            icon: Icon(GrootlyIcons.sustainablehand), label: 'Tips')
      ],
      currentIndex: selectedIndex,
      onTap: onClicked,
    );
  }
}
