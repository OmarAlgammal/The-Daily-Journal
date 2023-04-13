import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/views/widgets/my_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Omar Algammal', style: Theme.of(context).textTheme.headlineSmall,),
              gap12,
              Text('devomar24@gmail.com', style: Theme.of(context).textTheme.bodyMedium,),
              gap36,
              Divider(
                thickness: 2.0,
              ),
              gap16,
              ListTile(
                title: Text('Dark theme'),
                trailing: Switch(
                  onChanged: (value) {
                    /// TODO: Comlete this action
                    setState(() {
                      darkTheme = value;
                    });
                  },
                  value: darkTheme,
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              gap16,
              ListTile(
                title: Text('Notifications'),
                subtitle: Text('Choose how you want to receive BBC news notifications'),
              ),
              Divider(
                thickness: 2.0,
              ),
              ListTile(
                title: Text('Usage rules'),
              ),
              ListTile(
                title: Text('Privacy policy'),
              ),
              const Spacer(),
              MyButton(
                onPressed: () {
                  /// TODO: Complete sign out action
                },
                buttonName: 'Sign out',
              ),
              gap16
            ],
          ),
        ),
      ),
    );
  }
}
