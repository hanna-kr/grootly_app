import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final Function()? onPressed;
  final bool hasIcon;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.hasIcon = true,
  });

  @override
  State createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            color: GrootlyColor.white,
            borderRadius: GrootlyBorderRadius.medium,
            child: InkWell(
              borderRadius: GrootlyBorderRadius.medium,
              onTap: widget.onPressed,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: GrootlyColor.lightgreen2,
                  ),
                  borderRadius: GrootlyBorderRadius.medium,
                ),
                child: Center(
                  child: Padding(
                    padding: PaddingAll.m,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.hasIcon && widget.icon != null)
                          Padding(
                            padding: PaddingHor.m,
                            child: Icon(
                              widget.icon,
                              size: 24,
                              color: GrootlyColor.darkgreenText,
                            ),
                          ),
                        if (widget.hasIcon || widget.icon == null)
                          const SizedBox(width: 8),
                        Text(
                          widget.text,
                          style: GrootlyTextStyle.buttonSecond,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
