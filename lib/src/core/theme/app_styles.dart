import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  const AppStyles._();

  static String? get fontFamily => GoogleFonts.roboto().fontFamily;

  //light
  static TextStyle get text30PxLight => TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w300,
    fontFamily: fontFamily,
  );

  static TextStyle get text26PxLight => TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w300,
    fontFamily: fontFamily,
  );

  static TextStyle get text24PxLight => TextStyle(
    fontSize: 24,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get text20PxLight => TextStyle(
    fontSize: 20,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get text18PxLight => TextStyle(
    fontSize: 18,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get text16PxLight => TextStyle(
    fontSize: 16,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get text14PxLight => TextStyle(
    fontSize: 14,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  );

  static TextStyle get text12PxLight => TextStyle(
    fontSize: 12,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  );

  //regular
  static TextStyle get text30PxRegular => TextStyle(
    fontSize: 30,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text26PxRegular => TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static TextStyle get text24PxRegular => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text20PxRegular => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text18PxRegular => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text16PxRegular => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text14PxRegular => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text12PxRegular => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

//medium

  static TextStyle get text30PxMedium => const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get text26PxMedium => const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get text24PxMedium => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get text20PxMedium => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get text18PxMedium => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get text16PxMedium => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get text14PxMedium => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get text12PxMedium => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get text10PxMedium => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

//semi bold

  static TextStyle get text30PxSemiBold => const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text26PxSemiBold => const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text24PxSemiBold => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text20PxSemiBold => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text18PxSemiBold => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text16PxSemiBold => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text14PxSemiBold => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text12PxSemiBold => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text10PxSemiBold => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

  //bold
  static TextStyle get text30PxBold => const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text26PxBold => const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text24PxBold => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text20PxBold => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text18PxBold => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text16PxBold => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text14PxBold => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text12PxBold => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text10PxBold => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );
}

double calculateSpacing(double em) {
  return 16 * em;
}
