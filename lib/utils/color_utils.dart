// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

/// A utility class for working with colors.
library;

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// A random number generator used to generate random colors.
Random _random = Random();

/// Returns a random color in the display P3 color space.
Color randomColor() {
  double randomChannel() => _random.nextInt(256) / 255;
  return Color.from(
    alpha: 1.0,
    red: randomChannel(),
    green: randomChannel(),
    blue: randomChannel(),
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
