import 'package:flutter/material.dart';

import '../../../../shared/constance/gaps.dart';
import '../../../../shared/constance/icons.dart';
import '../../../../shared/widgets/circular_icon.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const NewsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      centerTitle: true,
      toolbarHeight: 56,
      actions: const [
        gap16,
        CircularIcon(icon: menuIcon),
        Spacer(),
        CircularIcon(icon: searchIcon),
        gap4,
        CircularIcon(
          icon: bellIcon,
          showNotificationState: true,
        ),
        gap16,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
