import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Favoriten',
      ),
    );
  }
}
