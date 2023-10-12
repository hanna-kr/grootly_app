import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            color: GrootlyColor.primary,
            borderRadius: GrootlyBorderRadius.medium,
            child: InkWell(
              borderRadius: GrootlyBorderRadius.medium,
              onTap: widget.onPressed,
              child: Center(
                  child: Padding(
                padding: PaddingAll.m,
                child: Text(
                  widget.text,
                  style: GrootlyTextStyle.buttonPrime,
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
