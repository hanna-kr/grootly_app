import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/core/presentation/widgets/icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? leadingIcon;
  final void Function()? onLeadingPressed;
  final IconData? trailingIcon;
  final void Function()? onTrailingPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.onLeadingPressed,
    this.trailingIcon,
    this.onTrailingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: GrootlyColor.white,
      centerTitle: true,
      leading: (leadingIcon != null || onLeadingPressed != null)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyIconButton(
                icon: leadingIcon!,
                onPressed: onLeadingPressed,
              ),
            )
          : null,
      title: Text(
        title ?? '',
        style: GrootlyTextStyle.headlineB2,
      ),
      actions: (trailingIcon != null || onTrailingPressed != null)
          ? [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyIconButton(
                  icon: trailingIcon!,
                  onPressed: onTrailingPressed,
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
