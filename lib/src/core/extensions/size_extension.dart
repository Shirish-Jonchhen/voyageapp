import 'package:flutter/widgets.dart';

extension SpaceExtension on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}
