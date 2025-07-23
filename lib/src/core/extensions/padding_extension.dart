import 'package:flutter/material.dart';

extension PaddingExtension on num {
  EdgeInsets get padAll => EdgeInsets.all(toDouble());
  EdgeInsets get padHor => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get padVer => EdgeInsets.symmetric(vertical: toDouble());
}
