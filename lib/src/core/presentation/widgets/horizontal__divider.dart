import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';

class HorizontalOrLine extends StatelessWidget {
  final String? label;
  final double height;
  final double thickness;

  const HorizontalOrLine({
    super.key,
    this.label,
    required this.height,
    required this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return Padding(
        padding: PaddingVer.m,
        child: Divider(
          color: GrootlyColor.lightgrey,
          height: height,
          thickness: thickness,
        ),
      );
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: GrootlyColor.lightgrey,
              height: height,
              thickness: thickness,
            ),
          ),
        ),
        Text(
          label!,
          style: GrootlyTextStyle.body2,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Padding(
              padding: PaddingVer.m,
              child: Divider(
                color: GrootlyColor.lightgrey,
                height: height,
                thickness: thickness,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
