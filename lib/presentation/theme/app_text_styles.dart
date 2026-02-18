import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextTheme get textTheme => GoogleFonts.eduSaHandTextTheme();

  static TextStyle get headline => GoogleFonts.eduSaHand(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle get title => GoogleFonts.eduSaHand(fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle get body => GoogleFonts.eduSaHand(fontSize: 16);
  static TextStyle get bodyBold => GoogleFonts.eduSaHand(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle get caption => GoogleFonts.eduSaHand(fontSize: 12);
  static TextStyle get button => GoogleFonts.eduSaHand(fontSize: 14, fontWeight: FontWeight.bold);
}
