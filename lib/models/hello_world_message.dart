// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

import 'dart:ui';

import '../utils/color_utils.dart' as color_utils;

/// A Hello World message in a specific language.
class HelloWorldMessage {
  HelloWorldMessage(this.languageCode, this.languageName, this.message)
    : color = color_utils.randomColor();

  /// The ISO 639-3 code of the language of the message.
  final String languageCode;

  /// The English name of the language of the message.
  final String languageName;

  /// A random color associated with the message.
  final Color color;

  /// The Hello World message in the specified language.
  final String message;
}
