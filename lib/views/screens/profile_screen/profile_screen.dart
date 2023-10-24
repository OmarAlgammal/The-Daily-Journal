import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding/padding.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_cubit.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_states.dart';
import 'package:the_daily_journal/view_model/theme_provider/theme_provider.dart';
import 'package:the_daily_journal/views/widgets/my_button.dart';

import '../../../services/firebase_auth_service.dart';
import '../../../services_locator/services_locator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${sl<FirebaseAuthentication>().currentUser?.displayName}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              gap12,
              Text(
                '${sl<FirebaseAuthentication>().currentUser?.email}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              gap36,
              const Divider(
                thickness: 2.0,
              ),
              gap16,
              ListTile(
                title: const Text('Dark theme'),
                trailing: Switch(
                  onChanged: (value) {
                    setState(() {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleThemeMode();
                    });
                  },
                  value: Provider.of<ThemeProvider>(
                    context,
                  ).isDarkMode,
                ),
              ),
              const Divider(
                thickness: 2.0,
              ),
              gap16,
              const ListTile(
                title: Text('Notifications'),
                subtitle:
                    Text('Choose how you want to receive news notifications'),
              ),
              const Divider(
                thickness: 2.0,
              ),
              const ListTile(
                title: Text('Usage rules'),
              ),
              const ListTile(
                title: Text('Privacy policy'),
              ),
              const Spacer(),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return MyButton(
                    loadingState: state is SigningOut,
                    onPressed: () {
                      AuthCubit.of(context).signOut();
                    },
                    buttonName: 'Sign out',
                  );
                },
              ),
              gap16
            ],
          ),
        ),
      ),
    );
  }
}
