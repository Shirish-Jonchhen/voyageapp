import 'package:flutter/material.dart';

class GradientDotsIndicator extends StatelessWidget {
  final int dotsCount;
  final int currentIndex;
  final Size dotSize;
  final Size activeDotSize;
  final BorderRadiusGeometry activeBorderRadius;
  final Gradient activeGradient;
  final Color inactiveColor;
  final double spacing;
  final Duration duration;
  final Curve curve;

  const GradientDotsIndicator({
    super.key,
    required this.dotsCount,
    required this.currentIndex,
    required this.activeGradient,
    this.dotSize = const Size(9, 9),
    this.activeDotSize = const Size(18, 9),
    this.activeBorderRadius = const BorderRadius.all(Radius.circular(5)),
    this.inactiveColor = Colors.grey,
    this.spacing = 8.0,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(dotsCount, (index) {
        final isActive = index == currentIndex;

        return Container(
          // duration: duration,
          // curve: curve,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: isActive ? activeDotSize.width : dotSize.width,
          height: isActive ? activeDotSize.height : dotSize.height,
          decoration: BoxDecoration(
            gradient: isActive ? activeGradient : null,
            color: isActive ? null : inactiveColor,
            borderRadius: isActive
                ? activeBorderRadius
                : BorderRadius.circular(dotSize.height / 2),
          ),
        );
      }),
    );
  }
}
