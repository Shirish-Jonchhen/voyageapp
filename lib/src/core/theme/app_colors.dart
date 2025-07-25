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

  static LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF70FF82), // #00B2FF
      Color(0xFFFFFFFF), // #0AA9FA// #4670DA
    ],
    stops: [0.0, 1.0],
  );

  static LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFA808), // #FFA808
      Color(0xFF6E4700), // #6E4700
    ],
    stops: [0.3221, 1.0], // 32.21% and 100%
  );

  static const Color black = Color(0xFF000000);
  static const Color white = Colors.white;// #000000
  static const Color neutral = Color(0xFFA6A6A6);
  static const Color neutral400 = Color(0xFF797979);
static const Color primary950 = Color(0xFF042C4D); // #00B2FF
static const Color textFieldFillDefault = Color(0xFF1E1F22); // #00B2FF
static const Color successColor = Color(0xFF1Fc16B); // #00B2FF
  static const Color success700 = Color(0xFF009611); // #00B2FF
static const Color errorColor = Color(0xFFD00416); // #B00020
static const Color warningColor = Color(0xFFDFB400);
static const Color dark800 = Color(0xFF2D2D2D);// #FFA000
static const Color dark700 = Color(0xFF787878); // #B00020

static const Color textFieldBorderColor = Color(0xFFF6F6F6); // #B00020
static const Color transparent = Colors.transparent; // #B00020
static const Color white200 = Color(0xFFFAFAFA); // #B00020

}