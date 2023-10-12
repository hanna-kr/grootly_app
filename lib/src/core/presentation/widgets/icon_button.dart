import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;

  const MyIconButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Material(
        color: GrootlyColor.lightgrey2,
        borderRadius: GrootlyBorderRadius.medium,
        child: InkWell(
          borderRadius: GrootlyBorderRadius.medium,
          onTap: onPressed,
          child: Center(
              child: Icon(
            icon,
            color: GrootlyColor.mediumgreen2,
            size: 24.0,
          )),
        ),
      ),
    );
  }
}
