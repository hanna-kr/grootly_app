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
  final Image? image;
  final bool hasImage;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.hasIcon = true,
    this.image,
    this.hasImage = true,
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
                          Row(
                            children: [
                              Icon(
                                widget.icon,
                                size: 24,
                                color: GrootlyColor.darkgreenText,
                              ),
                            ],
                          ),
                        if (widget.hasImage || widget.image != null)
                          Row(
                            children: [
                              SizedBox(
                                  width: 24, height: 24, child: widget.image),
                              const SizedBox(
                                width: 8,
                              )
                            ],
                          ),
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
