import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

import 'widgets/custom_text_field_pwd.dart';
import 'widgets/password_button.dart';
import 'widgets/password_panel_validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final passwordValidVN = ValueNotifier<bool>(false);
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightGrayColor,
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 44,
                      bottom: 42,
                    ),
                    child: Image.asset('assets/images/logoadf.png'),
                  ),
                  Text(
                    'Defina uma senha',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    'Uma senha forte ajuda a manter sua conta segura.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: mediumGrayColor,
                    ),
                  ),
                  SizedBox(height: 26),
                  CustomTextFieldPwd(
                    label: 'Senha',
                    backgroundColor: Colors.white,
                    textEditingController: passwordController,
                  ),
                  SizedBox(height: 22),
                  CustomTextFieldPwd(
                    label: 'Confirmar senha',
                    backgroundColor: Colors.white,
                    textEditingController: confirmPasswordController,
                  ),
                  SizedBox(height: 37),
                  PasswordPanelWidget(
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    passwordValid: (value) {
                      Future.microtask(
                        () {
                          passwordValidVN.value = value;
                        },
                      );
                    },
                  ),
                  SizedBox(height: 40),
                  ValueListenableBuilder(
                    valueListenable: passwordValidVN,
                    builder: (_, value, _) {
                      return PasswordButton(
                        passwordValid: value,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
