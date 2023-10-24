import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_journal/views/widgets/my_circular_progress_indicator.dart';

class MyCachedImageNetwork extends StatelessWidget {
  const MyCachedImageNetwork(
      {super.key, required this.url, this.itemBuilder});

  final String url;
  final Widget Function (BuildContext context, ImageProvider imageProvider)? itemBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, _) => const MyCircularProgressIndicator(),
      imageBuilder: itemBuilder ?? (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),),
        ),
      ),
    );
  }
}
