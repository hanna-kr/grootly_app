import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/widgets/custom_app_bar.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GrootlyColor.white,
        appBar: CustomAppBar(
          title: 'Tipps',
        ));
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: GrootlyColor.primary,
    //     title: const Text(
    //       'Tipps',
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
