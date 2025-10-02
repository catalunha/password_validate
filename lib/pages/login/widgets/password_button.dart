import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../shared/app_colors.dart';

class PasswordButton extends StatelessWidget {
  final bool passwordValid;
  const PasswordButton({super.key, required this.passwordValid});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .9,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: passwordValid ? primaryColor : redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        onPressed: () {},
        child: Text(
          passwordValid ? 'SENHA APROVADA' : 'SENHA REPROVADA',
          style: GoogleFonts.inter(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
