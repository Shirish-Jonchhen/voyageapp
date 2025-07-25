import 'package:flutter/material.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import '../../../core/theme/app_colors.dart';

class AppCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Function()? onTap;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const AppCard({
    super.key,
    this.height,
    this.width,
    this.child,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: AppColors.primary950,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
          Container(
            width: width,
            height: height,
            padding: padding,

            decoration: BoxDecoration(
              gradient: AppColors.overLay,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
