import 'package:flutter/material.dart';
import 'package:voyage/src/core/theme/app_colors.dart';

extension TextStyleColors on TextStyle {
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get neutral => copyWith(color: Color(0xFFA6A6A6)); // or your AppColors.neutral
  TextStyle get neutral200 => copyWith(color: Color(0xFFD2D2D2)); // or your AppColors.neutral400
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get dark700 => copyWith(color: Color(0xFF787878)); // or your AppColors.darkColor
  TextStyle get dark400 => copyWith(color: Color(0xFFC6C6C6)); // or your AppColors.darkColor
  TextStyle get error => copyWith(color: AppColors.errorColor);
  TextStyle get green => copyWith(color: Colors.green);
  TextStyle get primary => copyWith(color: Colors.blue); //
  TextStyle get primaryGradient => copyWith(
    foreground: Paint()
      ..shader = AppColors.primaryMain.createShader(Rect.fromLTWH(0, 0, 0, 0)), // width & height can be adjusted
  );

}
