import 'package:flutter/material.dart';
import 'package:voyage/src/core/theme/app_colors.dart';

extension TextStyleColors on TextStyle {
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get neutral => copyWith(color: Color(0xFFA6A6A6)); // or your AppColors.neutral
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get red => copyWith(color: Colors.red);
  TextStyle get green => copyWith(color: Colors.green);
  TextStyle get primary => copyWith(color: Colors.blue); //
  TextStyle get primaryGradient => copyWith(
    foreground: Paint()
      ..shader = AppColors.primaryMain.createShader(Rect.fromLTWH(0, 0, 0, 0)), // width & height can be adjusted
  );

}
