import 'package:flutter/material.dart';

class AppBarWorldScreen extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWorldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Hot Issues',
        style: TextStyle(
          fontSize: 36,
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}