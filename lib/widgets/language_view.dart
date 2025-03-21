import 'package:flutter/material.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({
    super.key,
    required this.languageCode,
    required this.languageName,
    required this.foregroundColor,
    this.textStyle,
  });

  /// The ISO 639-3 code of the language of the message.
  final String languageCode;

  /// The English name of the language of the message.
  final String languageName;

  /// The color of the text.
  final Color foregroundColor;

  /// The text style to use for the language name and code.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveTextStyle = textStyle ?? Theme.of(context).textTheme.bodyMedium!;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Display the language name
        Text(
          languageName,
          style: effectiveTextStyle.copyWith(
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
            style: effectiveTextStyle.copyWith(
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
