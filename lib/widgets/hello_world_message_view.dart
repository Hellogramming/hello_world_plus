// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

import 'package:flutter/material.dart';

import '../models/hello_world_message.dart';

/// A widget that displays a Hello World message.
///
/// The message is displayed in a large font with the language name and code below it.
class HelloWorldMessageView extends StatelessWidget {
  const HelloWorldMessageView({
    super.key,
    required this.message,
    required this.foregroundColor,
    this.showLanguage = true,
  });

  /// The Hello World message to display.
  final HelloWorldMessage message;

  /// The color of the text.
  final Color foregroundColor;

  /// Whether to display the language name and code below the message.
  final bool showLanguage;

  @override
  Widget build(BuildContext context) {
    // Display the Hello World message in a large font
    final Widget messageView = FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        message.message,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
          color: foregroundColor,
          fontWeight: FontWeight.bold,
          fontSize: 96.0,
          height: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    );

    // Display the language name and code immediately below the message
    final Widget languageView = FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Display the language name
          Text(
            message.languageName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(width: 12),

          // Display the language code in a rounded border
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
            decoration: BoxDecoration(
              border: Border.all(color: foregroundColor.withValues(alpha: 0.3), width: 1.5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              message.languageCode,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: foregroundColor.withValues(alpha: 0.8),
                fontFamily: 'monospace',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child:
          showLanguage
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[messageView, const SizedBox(height: 24), languageView],
              )
              : messageView,
    );
  }
}
