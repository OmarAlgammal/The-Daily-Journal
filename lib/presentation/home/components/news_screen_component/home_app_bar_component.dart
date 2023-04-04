import 'package:flutter/material.dart';

import '../../../../../shared/constance/gaps.dart';
import '../../../../../shared/constance/icons.dart';
import '../../../../../shared/widgets/circular_icon.dart';

class HomeAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeAppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        gap16,
        CircularIcon(
          icon: menuIcon,
          onTap: (){
            /// TODO: Complete this action
          },
        ),
        Spacer(),
        CircularIcon(icon: searchIcon, onTap: (){
          /// TODO: Complete this action
        },),
        gap8,
        CircularIcon(
          icon: bellIcon,
          onTap: (){
            /// TODO: Complete this action
          },
          showNotificationState: true,
        ),
        gap16,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
