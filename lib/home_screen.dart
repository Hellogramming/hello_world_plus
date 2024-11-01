import 'dart:math';
import 'package:flutter/material.dart';

import 'hello_world_messages.dart';
import 'strings.dart' as strings;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();

  int _messageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(
        language: helloWorldMessages[_messageIndex].language,
        // onAction: ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            helloWorldMessages[_messageIndex].message,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          setState(() {
            _messageIndex = _random.nextInt(helloWorldMessages.length);
          });
        },
        tooltip: 'New Message',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

/// Enum that defines the actions of the app bar.
enum _AppBarActions {
  viewSource,
  about,
}

/// The app bar of the recursive routing screen.
class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    super.key, // ignore: unused_element
    required this.language,
    this.onAction,
  });

  /// The language of the current Hello World message.
  final String language;

  /// The callback that is called when an app bar action is pressed.
  final void Function(_AppBarActions action)? onAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(strings.homeScreenTitle(language)),
      actions: <Widget>[
        PopupMenuButton<_AppBarActions>(
          onSelected: onAction,
          itemBuilder: (_) => [
            const PopupMenuItem(
              value: _AppBarActions.viewSource,
              child: Text(strings.viewSourceMenuItem),
            ),
            const PopupMenuItem(
              value: _AppBarActions.about,
              child: Text(strings.aboutMenuItem),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
