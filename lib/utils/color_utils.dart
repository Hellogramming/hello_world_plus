import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

Random _random = Random();

Color randomColor() {
  return Color.from(
    alpha: 1.0,
    red: _random.nextDouble(),
    green: _random.nextDouble(),
    blue: _random.nextDouble(),
    colorSpace: ColorSpace.displayP3,
  );
}

/// Returns the black or white contrast color of the given [Color].
Color contrastColor(Color color) {
  switch (ThemeData.estimateBrightnessForColor(color)) {
    case Brightness.light:
      return Colors.black;
    case Brightness.dark:
      return Colors.white;
  }
}
