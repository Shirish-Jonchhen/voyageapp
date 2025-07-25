import 'package:flutter/material.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';

class AppHollowButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color borderColor;

  const AppHollowButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.borderColor = AppColors.neutral400,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: 20.padVer,
      height: 46, // Set your desired height
      decoration: BoxDecoration(
        // gradient: AppColors.primaryMain,
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: borderColor), // Optional
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
          child: Text(title, style: AppStyles.text16PxSemiBold.white),
        ),
      ),
    );
  }
}
