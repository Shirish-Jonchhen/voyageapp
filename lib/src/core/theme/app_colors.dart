import 'package:flutter/material.dart';

class AppColors{
  static const LinearGradient primaryMain = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF00B2FF), // #00B2FF
      Color(0xFF0AA9FA), // #0AA9FA
      Color(0xFF4670DA), // #4670DA
    ],
    stops: [0.0, 0.1467, 1.0],
  );

  static LinearGradient overLay = LinearGradient(
    begin: Alignment.bottomCenter, // 360deg
    end: Alignment.topCenter,
    colors: [
      Colors.black.withOpacity(0.6),
      Colors.black.withOpacity(0.0),
    ],
  );

  static const Color black = Color(0xFF000000);
  static const Color white = Colors.white;// #000000
static const Color neutral = Color(0xFFA6A6A6);
static const Color primary950 = Color(0xFF042C4D); // #00B2FF
static const Color textFieldFillDefault = Color(0xFF1E1F22); // #00B2FF
static const Color successColor = Color(0xFF1Fc16B); // #00B2FF
static const Color errorColor = Color(0xFFD00416); // #B00020
static const Color warningColor = Color(0xFFDFB400); // #FFA000
}