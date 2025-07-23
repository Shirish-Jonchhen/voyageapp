import 'package:flutter/material.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';

class AppTextField extends StatelessWidget {
  final FocusNode focusNode;
  final bool isFocused;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final bool enabled;
  final IconData? iconData;
  final VoidCallback? onObscureText;
  final Function(String value)? onChanged;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.focusNode,
    required this.isFocused,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.enabled = true,
    this.onObscureText,
    this.onChanged,
    this.keyboardType = TextInputType.text, this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.all(2), // Border thickness
      decoration: BoxDecoration(
        gradient: isFocused
            ? AppColors.primaryMain
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        focusNode: focusNode,
        style: AppStyles.text14PxMedium.white,
        decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
            color: isFocused ? AppColors.white : AppColors.neutral,
          ),

          suffixIcon: onObscureText != null
              ? IconButton(
                  onPressed: onObscureText,
                  icon: Icon(
                    obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: isFocused ? AppColors.white : AppColors.neutral,
                  ),
                )
              : null,


          hintText: hintText,
          hintStyle: AppStyles.text14PxMedium.neutral,
          filled: true,
          fillColor: isFocused
              ? AppColors.primary950
              : AppColors.textFieldFillDefault,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
