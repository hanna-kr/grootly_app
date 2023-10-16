import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Suche',
      ),
      body: SearchBar(
        leading: Icon(Icons.search),
        hintText: 'Search text ...',
      ),
    );
  }
}
