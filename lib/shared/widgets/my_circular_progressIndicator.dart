import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({Key? key, this.color = Colors.blue}) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: color,);
  }
}
