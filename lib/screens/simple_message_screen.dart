// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

import 'package:flutter/material.dart';

import '../models/hello_world_message.dart';
import '../utils/color_utils.dart' as color_utils;
import '../widgets/hello_world_message_view.dart';

/// A screen that displays a Hello World message with a minimal layout.
///
/// The message is displayed in a large font with a background color in the center of the screen.
class SimpleMessageScreen extends StatelessWidget {
  const SimpleMessageScreen({super.key, required this.message});

  /// The Hello World message to display.
  final HelloWorldMessage message;

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor = color_utils.contrastColor(message.color);

    return Scaffold(
      backgroundColor: message.color,

      // A transparent app bar with no elevation
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: foregroundColor,
        elevation: 0.0,
      ),

      // A centered Hello World message
      body: Center(
        child: HelloWorldMessageView(
          message: message,
          foregroundColor: foregroundColor,
          showLanguage: false,
        ),
      ),
    );
  }
}
