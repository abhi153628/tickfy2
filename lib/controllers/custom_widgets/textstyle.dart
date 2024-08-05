import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  CustomText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: color,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: CustomText(
          text: 'Hello, World!',
          color: Colors.white,
          fontSize: 12,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ));
}
