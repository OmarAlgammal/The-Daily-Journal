import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_cubit.dart';
import 'package:the_daily_journal/views/screens/bottom_nav_screen/bottom_nav_screen.dart';

import '../sign_in_screen/sign_in_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthCubit.instance(context).checkRegistration(),
      builder: (context, snapshot) {
        if ([ConnectionState.active, ConnectionState.done]
            .contains(snapshot.connectionState)) {
          if (snapshot.data != null) {
            return BottomNavScreen();
          }
          return const SignInScreen();
        } else if (snapshot.hasError) {
          return const Text('error');
        } else {
          return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
            color: Colors.blue,
          )));
        }
      },
    );
  }
}
