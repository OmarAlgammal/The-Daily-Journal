import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/border_radius.dart';
import 'package:the_daily_journal/views/widgets/my_button.dart';

import '../../../utils/constance/gaps.dart';
import '../../../utils/constance/padding.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const String routeName = 'createAccountWithEmailPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: padding16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Sign up',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Form(
                  child: Column(
                    children: [
// name field
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: circular8,
                          ),
                        ),
                      ),
                      gap12,
// account field
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Account',
                          border: OutlineInputBorder(
                            borderRadius: circular8,
                          ),
                        ),
                      ),
                      gap12,
// password field
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'password (+8 characters)',
                          border: OutlineInputBorder(
                            borderRadius: circular8,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: MyButton(
                        onPressed: () {}, buttonName: 'Create an account')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
