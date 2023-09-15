import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/bottom_nav');
                },
                child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Lottie.asset('assets/json/Frame-1.json')),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
