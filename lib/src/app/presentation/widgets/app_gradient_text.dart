import 'package:flutter/cupertino.dart';
import 'package:voyage/src/core/theme/app_colors.dart';

class AppGradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const AppGradientText(this.text, {
    required this.style,
    required this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
