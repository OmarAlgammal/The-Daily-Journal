import 'package:flutter/material.dart';

import '../../utils/constance/icons.dart';

class AuthenticationMark extends StatelessWidget {
  const AuthenticationMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      checkCircleIcon,
      color: Theme.of(context).colorScheme.primary,
      size: 18,
    );
  }
}
