import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

import 'password_dot_validation.dart';

class PasswordPanelWidget extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueChanged<bool> passwordValid;
  const PasswordPanelWidget({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordValid,
  });

  @override
  State<PasswordPanelWidget> createState() => _PasswordPanelWidgetState();
}

class _PasswordPanelWidgetState extends State<PasswordPanelWidget> {
  final validationRulesPasswordText = ValueNotifier('');
  final approvedRules = List.generate(5, (index) => false);
  var passwordValid = false;
  @override
  void initState() {
    widget.passwordController.addListener(
      () {
        validationRulesPasswordText.value = widget.passwordController.text;
      },
    );
    super.initState();
  }

  void updateValidRule(ValueKey<int> key, bool valid) {
    approvedRules[key.value] = valid;
    checkRules();
  }

  void checkRules() {
    final allValid = approvedRules.every(
      (element) => element,
    );
    if (allValid != passwordValid) {
      print('====================================$allValid');
      passwordValid = allValid;
      widget.passwordValid(allValid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sua senha deve conter',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        PasswordDotValidation(
          label: 'Mínimo de 8 caracteres',
          key: ValueKey(0),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'^.{8,}$',
          updateMatch: updateValidRule,
        ),
        PasswordDotValidation(
          label: '1 ou mais letras maiúsculas',
          key: ValueKey(1),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[A-Z]',
          updateMatch: updateValidRule,
        ),
        PasswordDotValidation(
          label: '1 ou mais números',
          key: ValueKey(2),
          passwordValue: validationRulesPasswordText,
          patternValidation: '[0-9]',
          updateMatch: updateValidRule,
        ),
        PasswordDotValidation(
          label: '1 ou mais simbolos',
          key: ValueKey(3),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[^\w\s]',
          updateMatch: updateValidRule,
        ),
        ValueListenableBuilder(
          valueListenable: widget.confirmPasswordController,
          builder: (_, value, _) {
            return PasswordDotValidation(
              label: 'Senha igual a confirma senha',
              key: ValueKey(4),
              passwordValue: validationRulesPasswordText,
              patternValidation: '^${RegExp.escape(value.text)}\$',
              updateMatch: updateValidRule,
            );
          },
        ),
      ],
    );
  }
}
