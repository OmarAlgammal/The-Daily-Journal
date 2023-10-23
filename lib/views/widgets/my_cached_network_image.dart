import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/theme/colors.dart';

class MyCachedNetworkImage extends StatelessWidget {
  const MyCachedNetworkImage(
      {super.key,
      required this.imageUrl,
      this.imageBuilder,
      this.height,
      this.width});

  final String imageUrl;
  final ImageWidgetBuilder? imageBuilder;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, _) => Container(
        color: brightGreyColor,
      ),
      fit: BoxFit.fill,
      errorWidget: (context, _, __) => const SizedBox(),
      imageBuilder: imageBuilder ??
          (context, imageProvider) => DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ))),
      width: width,
      height: height,
    );
  }
}
