
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constance/border_radius.dart';



class RegisterItemDesign extends StatelessWidget {
  const RegisterItemDesign({Key? key, this.icon, this.svgPicture, required this.iconColor, required this.registrationText, required this.onPressed}) : super(key: key);

  final IconData? icon;
  final SvgPicture? svgPicture;
  final Color iconColor;
  final String registrationText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: circular8,
          side: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2,
          )
      ),
      leading: svgPicture ?? Icon(
        icon,
        size: 36.0,
        color: iconColor,
      ),
      title: Text(
        registrationText,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}
