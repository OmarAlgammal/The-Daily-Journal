import 'package:flutter/material.dart';
import 'package:the_daily_journal/routing/routes.dart';

import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/icons.dart';
import '../../../widgets/circular_icon.dart';

class HomeAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeAppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        gap16,
        CircularIcon(
          icon: AppIcons.menuIcon,
          onTap: (){
            /// TODO: Complete this action
          },
        ),
        const Spacer(),
        CircularIcon(icon: AppIcons.searchIcon, onTap: (){
          Navigator.of(context, rootNavigator: true).pushNamed(AppRouts.searchScreen);
        },),
        gap8,
        CircularIcon(
          icon: AppIcons.bellIcon,
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
