import 'package:flutter/material.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';

class AppTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final bool isFocused;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final bool enabled;
  final IconData? iconData;
  final IconData? suffixIconData;
  final VoidCallback? onObscureText;
  final Function(String value)? onChanged;
  final TextInputType keyboardType;
  final double borderRadius;
  final Function()? onTap;

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
    this.borderRadius = 12.0,
    this.keyboardType = TextInputType.text,
    this.iconData,
    this.onTap,
    this.suffixIconData,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.all(2), // Border thickness
      decoration: BoxDecoration(
        color: isFocused
            ? null
            : AppColors.textFieldBorderColor.withOpacity(0.2),
        gradient: isFocused ? AppColors.primaryMain : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextFormField(
        readOnly: !enabled,
        onChanged: onChanged,
        onTap: onTap,
        // enabled: enabled,enable
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
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: isFocused ? AppColors.white : AppColors.neutral,
                  ),
                )
              : suffixIconData!=null? Icon(suffixIconData, color: AppColors.neutral,):null,

          hintText: hintText,
          hintStyle: AppStyles.text14PxMedium.neutral,
          filled: true,
          fillColor: isFocused
              ? AppColors.primary950
              : AppColors.textFieldFillDefault,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
