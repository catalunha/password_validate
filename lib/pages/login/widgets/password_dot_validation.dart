import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

class PasswordDotValidation extends StatelessWidget {
  final String label;
  final String patternValidation;
  final ValueNotifier<String> passwordValue;
  final void Function(ValueKey<int> key, bool match) updateMatch;
  const PasswordDotValidation({
    required super.key,
    required this.label,
    required this.patternValidation,
    required this.passwordValue,
    required this.updateMatch,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: passwordValue,
      builder: (_, passwordText, _) {
        final valid = RegExp(patternValidation).hasMatch(passwordText);
        updateMatch(super.key as ValueKey<int>, valid);
        return Row(
          spacing: 8,
          children: [
            Container(
              height: 13,
              width: 13,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Visibility(
                visible: valid,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            Text(
              label,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: coolGrayColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
