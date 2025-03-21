// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

import 'dart:ui';

/// A Hello World message in a specific language.
class HelloWorldMessage {
  const HelloWorldMessage(this.languageCode, this.languageName, this.languageColor, this.message);

  /// The ISO 639-3 code of the language of the message.
  final String languageCode;

  /// The English name of the language of the message.
  final String languageName;

  /// The color associated with the language.
  final Color languageColor;

  /// The Hello World message in the specified language.
  final String message;
}
