import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/icon_button.dart';

class MyAppBar extends StatelessWidget {
  final String? title;
  final Function()? onLeftAction;
  final Function()? onRightAction;
  final IconData? leftIcon;
  final IconData? rightIcon;

  const MyAppBar({
    super.key,
    this.title,
    this.onLeftAction,
    this.onRightAction,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leftIcon != null)
            MyIconButton(
              icon: leftIcon ?? Icons.chevron_left,
              onPressed: onLeftAction ??
                  () {
                    Navigator.pop(context);
                  },
            ),
          if (leftIcon == null)
            const SizedBox(
              height: 40,
              width: 40,
            ),
          Expanded(
            child: Center(
              child: Text(
                title ?? '',
                style: GrootlyTextStyle.headlineB2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (rightIcon != null)
            MyIconButton(
              icon: rightIcon ?? Icons.menu,
              onPressed: onRightAction,
            ),
          if (rightIcon == null)
            const SizedBox(
              height: 40,
              width: 40,
            )
        ],
      ),
    );
  }
}
