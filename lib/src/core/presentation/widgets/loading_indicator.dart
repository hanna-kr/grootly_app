import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GrootlyLoadingIndicator extends StatelessWidget {
  const GrootlyLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        width: 150,
        child: Lottie.asset('assets/json/grootly_logo2.json'));
  }
}
