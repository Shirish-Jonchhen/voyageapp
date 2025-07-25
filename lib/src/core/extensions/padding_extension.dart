import 'package:flutter/material.dart';

extension PaddingExtension on num {
  EdgeInsets get padAll => EdgeInsets.all(toDouble());
  EdgeInsets get padHor => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get padVer => EdgeInsets.symmetric(vertical: toDouble());

  /// Custom symmetric padding (default to 0)
  EdgeInsets padSymmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  /// Padding using EdgeInsets.only with optional named args
  EdgeInsets padOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );

  /// Padding using EdgeInsets.fromLTRB
  EdgeInsets padLTRB(double left, double top, double right, double bottom) =>
      EdgeInsets.fromLTRB(left, top, right, bottom);
}
