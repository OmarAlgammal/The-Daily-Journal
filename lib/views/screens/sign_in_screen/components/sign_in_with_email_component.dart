import 'package:flutter/material.dart';

import '../../../../utils/constance/border_radius.dart';
import '../../../../utils/constance/gaps.dart';
import '../../../widgets/my_button.dart';

class SignInWithEmailComponent extends StatelessWidget {
  const SignInWithEmailComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
    );
  }
}
