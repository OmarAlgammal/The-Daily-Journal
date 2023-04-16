import 'package:flutter/material.dart';

import '../../utils/theme/colors.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon(
      {Key? key,
      this.icon,
      this.onTap,
      this.color,
      this.fillColor,
      this.showNotificationState = false})
      : super(key: key);

  final IconData? icon;
  final Color? color;
  final Color? fillColor;
  final bool showNotificationState;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fillColor ?? Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                  color: blackColor.withOpacity(.2),
                  blurRadius: 1,
                  spreadRadius: 0)
            ]),
        child: Center(
          child: Stack(
            children: [
              Icon(
                icon,
                size: 20,
                color: color ?? Theme.of(context).colorScheme.background,
              ),
              if (showNotificationState)
                Positioned(
                  left: 11,
                  child: Icon(
                    Icons.brightness_1,
                    color: Theme.of(context).colorScheme.error,
                    size: 9,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
