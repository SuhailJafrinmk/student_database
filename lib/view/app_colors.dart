import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsApp {
  static const primaryColor = Color(0xFFC4DFE6);
  static const secondaryColor = Color.fromARGB(255, 180, 212, 234);
  static const Color tertiaryColor = Color(0xFF5F9EA0);
  static const textColor = Colors.black87;

  static final primaryText = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static TextStyle settexttheme(
      {required double size,
      required FontWeight fontWeight,
      Color color = Colors.black}) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
