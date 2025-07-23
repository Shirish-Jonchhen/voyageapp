import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';

class SnackBarHelper{
  static void showSnackBar({required String message, bool isError = false, required BuildContext context}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Row(
          children: [
            isError
                ? const Icon(
              Icons.error_outline,
              color: AppColors.white,
            )
                : Icon(
              Icons.check_circle_outline,
              color: AppColors.white,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              message,
              style: AppStyles.text14PxSemiBold.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
        backgroundColor: isError ? AppColors.errorColor : AppColors.successColor,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}