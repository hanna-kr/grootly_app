import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/widgets/icon_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String imageUrl;
  final String heroTag;
  final VoidCallback onLeadingPressed;
  final IconData icon;

  const CustomSliverAppBar({
    super.key,
    required this.imageUrl,
    required this.heroTag,
    required this.onLeadingPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyIconButton(
          icon: icon,
          onPressed: onLeadingPressed,
        ),
      ),
      backgroundColor: GrootlyColor.white,
      elevation: 0,
      expandedHeight: 250,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: heroTag,
          child: ClipRRect(
            borderRadius: GrootlyBorderRadius.imageCard,
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
