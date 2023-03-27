import 'package:flutter/material.dart';
import 'package:the_daily_journal/shared/constance/colors.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({Key? key, required this.icon, this.showNotificationState = false}) : super(key: key);
  final IconData icon;
  final bool showNotificationState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: brightGreyColor,
      ),
      child: Center(
        child: Stack(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.black,
            ),
            if (showNotificationState)
              Positioned(
              left: 11,
              child: Icon(Icons.brightness_1, color: redColor, size: 9,),
            ),
          ],
        ),
      ),
    );
  }
}
