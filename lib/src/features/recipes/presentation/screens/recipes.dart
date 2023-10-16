import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GrootlyColor.white,
        appBar: CustomAppBar(
          title: 'Rezepte',
        ));
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: GrootlyColor.primary,
    //     title: const Text(
    //       'Rezepte',
    //     ),
    //     centerTitle: true,
    //     leading: IconButton(
    //       icon: const Icon(Icons.arrow_back),
    //       onPressed: () {
    //         Navigator.popAndPushNamed(context, '/home');
    //       },
    //     ),
    //     actions: const [
    //       Icon(Icons.favorite),
    //       Padding(padding: EdgeInsets.all(8))
    //     ],
    //   ),
    // );
  }
}
