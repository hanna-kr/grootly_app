import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grootly_app/src/core/presentation/styles/border/border_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/color/color_style.dart';
import 'package:grootly_app/src/core/presentation/styles/padding/position_styles.dart';
import 'package:grootly_app/src/core/presentation/styles/text/text_styles.dart';
import 'package:grootly_app/src/features/tips/domain/tips_model.dart';
import 'package:shimmer/shimmer.dart';

class TipBigCard extends StatefulWidget {
  final Tips tips;
  final bool? hasLabel;
  final String? text;

  const TipBigCard({
    super.key,
    required this.tips,
    this.hasLabel,
    this.text,
  });

  @override
  State<TipBigCard> createState() => _TipBigCardState();
}

class _TipBigCardState extends State<TipBigCard> {
  void navigateToTipDetail() {
    Navigator.pushNamed(context, '/tip_details',
        arguments: {'tips': widget.tips, 'heroTag': widget.tips.imgURL});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: GrootlyColor.lightgrey2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        color: GrootlyColor.lightgrey2,
        borderRadius: GrootlyBorderRadius.medium,
        child: InkWell(
          borderRadius: GrootlyBorderRadius.medium,
          onTap: () {
            navigateToTipDetail();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Hero(
                      tag: widget.tips.imgURL,
                      child: CachedNetworkImage(
                        imageUrl: widget.tips.imgURL,
                        fit: BoxFit.cover,
                        height: 180.0,
                        width: double.infinity,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: GrootlyColor.lightgrey,
                          highlightColor: GrootlyColor.lightgrey2,
                          child: Container(
                            height: 150.0,
                            width: double.infinity,
                            color: GrootlyColor.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 30,
                          color: GrootlyColor.red,
                        ),
                      ),
                    ),
                  ),
                  if (widget.hasLabel ?? false)
                    Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: GrootlyBorderRadius.medium,
                              color: GrootlyColor.limegreen),
                          child: Center(
                              child: Padding(
                            padding: PaddingAll.s,
                            child: Text(
                              widget.text ?? '',
                              style: GrootlyTextStyle.label,
                            ),
                          )),
                        ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.tips.title, style: GrootlyTextStyle.headlineB4),
                    const SizedBox(height: 5.0),
                    Text(
                      widget.tips.subtitle,
                      style: GrootlyTextStyle.body2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
