import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';

class SquareSecondaryButton extends StatefulWidget {
  final Function()? onPressed;
  final String imagePath;

  const SquareSecondaryButton(
      {super.key, required this.onPressed, required this.imagePath});

  @override
  State createState() => _SquareSecondaryButtonState();
}

class _SquareSecondaryButtonState extends State<SquareSecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: GrootlyColor.white,
      borderRadius: GrootlyBorderRadius.medium,
      child: InkWell(
        borderRadius: GrootlyBorderRadius.medium,
        onTap: widget.onPressed,
        child: Container(
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: GrootlyColor.lightgreen2,
            ),
            borderRadius: GrootlyBorderRadius.medium,
          ),
          child: Center(
            child: Padding(
                padding: PaddingAll.m,
                child: Image.asset(
                  widget.imagePath,
                  height: 40,
                )),
          ),
        ),
      ),
    );
  }
}
