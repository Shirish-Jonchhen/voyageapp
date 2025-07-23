import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AppCard extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;
  final Function()? onTap;
  const AppCard({super.key, this.height = 44, this.width = double.infinity, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            // padding: 12.5.padVer,padVer
            decoration: BoxDecoration(
              color: AppColors.primary950,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: AppColors.overLay,
              borderRadius: BorderRadius.circular(8),
            ),
            child: child,
          )
        ],
      ),
    );
  }
}
