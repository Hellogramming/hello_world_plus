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
    this.padding = const EdgeInsets.symmetric(horizontal: 32.0),
  });

  /// The Hello World message to display.
  final HelloWorldMessage message;

  /// The color of the text.
  final Color foregroundColor;

  /// Whether to display the language name and code below the message.
  final bool showLanguage;

  final EdgeInsetsGeometry padding;

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
      child: _LanguageView(
        languageCode: message.languageCode,
        languageName: message.languageName,
        foregroundColor: foregroundColor,
      ),
    );

    return Padding(
      padding: padding,
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

/// A helper widget that displays the language name and code.
class _LanguageView extends StatelessWidget {
  const _LanguageView({
    super.key, // ignore: unused_element_parameter
    required this.languageCode,
    required this.languageName,
    required this.foregroundColor,
  });

  /// The ISO 639-3 code of the language of the message.
  final String languageCode;

  /// The English name of the language of the message.
  final String languageName;

  /// The color of the text.
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Display the language name
        Text(
          languageName,
          style: textStyle?.copyWith(
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
            languageCode,
            style: textStyle?.copyWith(
              color: foregroundColor.withValues(alpha: 0.8),
              fontFamily: 'monospace',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
