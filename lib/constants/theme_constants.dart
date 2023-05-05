import 'package:flutter/material.dart';

class ThemeColors {
  static const scaffold = Color(0xFF121212);
  static const container = Color(0xFF363636);
  static const text = Color(0xDDFFFFFF);
  static const fadedText = Color(0xFFAFAFAF);
  static const primary = Color(0xFF8687E7);
  static const error = Color(0xFFFF0000);
  // static Color text = Colors.white.withOpacity(.87);
}

class ThemeFonts {
  static const r12 = TextStyle(
    fontSize: 12,
    color: ThemeColors.text,
    height: 1.5,
  );

  static const r14 = TextStyle(
    fontSize: 14,
    color: ThemeColors.text,
    height: 1.5,
  );

  static const r16 = TextStyle(
    fontSize: 16,
    color: ThemeColors.text,
    height: 1.5,
  );

  static const r20 = TextStyle(
    fontSize: 20,
    color: ThemeColors.text,
    height: 1.5,
  );
}