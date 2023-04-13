import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';

import '../../../../utils/constance/icons.dart';
import '../../../widgets/circular_icon.dart';

class ViewAllNewsAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const ViewAllNewsAppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 56,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: CircularIcon(
          icon: arrowLeftIcon,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
