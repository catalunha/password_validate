import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

import 'custom_text_field.dart';

class CustomTextFieldPwd extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final TextEditingController textEditingController;
  const CustomTextFieldPwd({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textEditingController,
  });

  @override
  State<CustomTextFieldPwd> createState() => _CustomTextFieldPwdState();
}

class _CustomTextFieldPwdState extends State<CustomTextFieldPwd> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: widget.label,
      backgroundColor: widget.backgroundColor,
      textEditingController: widget.textEditingController,
      obscureText: obscureText,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
      ),
    );
  }
}
