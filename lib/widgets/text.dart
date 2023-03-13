import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TiText extends StatelessWidget {
  late String text;
  late double fontSize;
  late Color color;
  TiText(
      {super.key,
      required this.fontSize,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: fontSize, color: color),
    );
  }
}
