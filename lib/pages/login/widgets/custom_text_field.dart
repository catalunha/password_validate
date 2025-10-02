import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final Color backgroundColor;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  const CustomTextField({
    super.key,
    required this.label,
    this.hintText,
    required this.backgroundColor,
    this.suffixIcon,
    required this.textEditingController,
    required this.obscureText,
    this.validator,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        TextFormField(
          controller: widget.textEditingController,
          validator: widget.validator,
          focusNode: widget.focusNode,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            fillColor: widget.backgroundColor,
            filled: true,
            isDense: true,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
