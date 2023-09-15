import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/Theme/color_theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grootlyTheme.primaryColor,
        title: const Text('Suche'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
      ),
      body: const SearchBar(
        leading: Icon(Icons.search),
        hintText: 'Search text ...',
      ),
    );
  }
}
