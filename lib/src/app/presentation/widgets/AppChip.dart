import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AppChip extends StatelessWidget {
  final Widget? child;
  final bool isActive;
  final bool visible;
  final Function()? onTap;

  const AppChip({
    super.key,
    this.child,
    required this.isActive,
    required this.visible,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal:  14,
          vertical:  11.5,
        ),
        decoration: BoxDecoration(
          gradient: isActive ? AppColors.primaryMain : null,
          color: isActive ? null : AppColors.transparent,

          borderRadius: BorderRadius.circular(8),
          border: isActive
              ? Border.all(color: AppColors.transparent, width: 1)
              : Border.all(color: AppColors.dark800, width: 1),
        ),
        child: child,
      ),
    );
  }
}
