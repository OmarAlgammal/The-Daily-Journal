import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/utils/constance/border_radius.dart';
import 'package:the_daily_journal/utils/extensions/screen_dimens.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_cubit.dart';
import 'package:the_daily_journal/views/widgets/my_button.dart';

import '../../../utils/constance/gaps.dart';
import '../../../utils/constance/icons.dart';
import '../../../utils/constance/padding.dart';
import '../../../utils/theme/colors.dart';
import 'components/register_item.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: padding24,
          child: Column(
            children: [
              /// TODO: Remove sign in work and replace it with app logo
              Flexible(
                flex: 1,
                child: Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    /// TODO: Change font type here
                    'Hi!',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                          border: OutlineInputBorder(
                        borderRadius: circular8,
                      )),
                    ),
                    gap18,
                    MyButton(onPressed: () {}, buttonName: 'Continue'),
                    gap36,
                    Text('Or'),
                  ],
                ),
              ),
              Flexible(
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
                        AuthCubit.instance(context).signInWithGoogle();
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
              ),
              Flexible(
                flex: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New user ?',
                      ),
                      gap8,
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouts.signUpScreen);
                        },
                        child: Text(
                          'Create an account',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
