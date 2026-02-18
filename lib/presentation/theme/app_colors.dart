import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF19E65E);
  static const Color backgroundLight = Color(0xFFF6F8F6);
  static const Color backgroundDark = Color(0xFF112116);
  static const Color textDark = Color(0xFF112116);
  static const Color textLight = Colors.white;
  static const Color textGrey = Color(0xFF63886F);
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF1C2E22);
  static const Color premiumGradientStart = Color(0xFF112116);
  static const Color premiumGradientEnd = Color(0xFF1A3A24);
  static const Color gold = Color(0xFFFFD700);
  static const Color red = Colors.red;
  static Color primaryWithOpacity(double opacity) => primary.withOpacity(opacity);
}
