import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/utils/constance/border_radius.dart';
import 'package:the_daily_journal/utils/extensions/screen_dimens.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_cubit.dart';
import 'package:the_daily_journal/views/screens/sign_in_screen/components/continue_with_services_component.dart';
import 'package:the_daily_journal/views/widgets/my_button.dart';

import '../../../utils/constance/gaps.dart';
import '../../../utils/constance/icons.dart';
import '../../../utils/constance/padding.dart';
import '../../../utils/theme/colors.dart';
import '../../widgets/register_item.dart';
import 'components/sign_in_with_email_component.dart';

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
              const SignInWithEmailComponent(),
              const ContinueWithServicesComponent(),
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
