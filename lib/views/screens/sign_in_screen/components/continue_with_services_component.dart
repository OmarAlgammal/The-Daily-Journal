import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_daily_journal/utils/extensions/screen_dimens.dart';

import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/icons.dart';
import '../../../../utils/theme/colors.dart';
import '../../../../view_model/auth_cubit/auth_cubit.dart';
import '../../../widgets/register_item.dart';

class ContinueWithServicesComponent extends StatelessWidget {
  const ContinueWithServicesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RegisterItemDesign(
            icon: facebookIcon,
            iconColor: blueColor,
            registrationText: 'Continue With Facebook',
            onPressed: () {
              /// TODO: Sign in with Facebook
            },
          ),
          gap16,
          RegisterItemDesign(
            svgPicture: SvgPicture.asset(
              'assets/google.svg',
              height: context.screenWidth() * .10,
            ),
            iconColor: blueColor,
            registrationText: 'Continue in with Google',
            onPressed: () {
              AuthCubit.of(context).signInWithGoogle();
            },
          ),
          gap16,
          RegisterItemDesign(
            icon: appleIcon,
            iconColor: blackColor,
            registrationText: 'Continue with Apple',
            onPressed: () {
              // TODO: sing in with Apple
            },
          ),
        ],
      ),
    );
  }
}
