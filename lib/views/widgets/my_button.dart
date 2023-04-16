import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/border_radius.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_cubit.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_states.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.onPressed,
      required this.buttonName,
      this.loadingState = false})
      : super(key: key);

  final VoidCallback onPressed;
  final String buttonName;
  final bool loadingState;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: circular8)),
        fixedSize: MaterialStateProperty.all<Size>(
          /// TODO: Refactor this
          const Size(double.maxFinite, 56.0),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary,
        ),
      ),
      onPressed: onPressed,
      child: loadingState
          ? CircularProgressIndicator(color: Theme.of(context).colorScheme.background,)
          : Text(
              buttonName,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
    );
  }
}
