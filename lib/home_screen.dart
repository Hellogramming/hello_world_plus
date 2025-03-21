// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

import 'dart:math';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'hello_world_messages.dart';
import 'message_list_screen.dart';
import 'strings.dart' as strings;
import 'urls.dart' as urls;

/// The home screen of the Hello, World! Plus app.
///
/// Displays a random Hello World message and allows the user to refresh the message.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// A random number generator used to select a random Hello World message.
  final Random _random = Random();

  /// The index of the selected Hello World message.
  int _messageIndex = 0;

  /// Handles the app bar actions.
  void _onAppBarAction(_AppBarActions action) async {
    switch (action) {
      // Open the message list screen and update the message index if a new message is selected
      case _AppBarActions.messageList:
        final int? newIndex = await Navigator.of(
          context,
        ).push(MaterialPageRoute<int>(builder: (_) => const MessageListScreen()));
        if (newIndex != null) setState(() => _messageIndex = newIndex);
        break;

      // Open the view source URL in the default browser
      case _AppBarActions.viewSource:
        launchUrl(Uri.parse(urls.viewSourceUrl));
        break;

      // Open the about URL in the default browser
      case _AppBarActions.about:
        launchUrl(Uri.parse(urls.aboutUrl));
        break;
    }
  }

  /// Refreshes the Hello World message when the FAB is pressed.
  void _onFABPressed() {
    setState(() {
      _messageIndex = _random.nextInt(helloWorldMessages.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(
        language: helloWorldMessages[_messageIndex].language,
        onAction: _onAppBarAction,
      ),

      // The body of the home screen displays the selected Hello World message
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

      // The FAB allows the user to refresh the Hello World message
      floatingActionButton: FloatingActionButton.large(
        tooltip: strings.homeFabTooltip,
        onPressed: _onFABPressed,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

/// Enum that defines the actions of the app bar.
enum _AppBarActions { messageList, viewSource, about }

/// The app bar of the home screen.
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
      title: Text(language),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.list_alt_rounded),
          tooltip: strings.messageListTooltip,
          onPressed: () => onAction?.call(_AppBarActions.messageList),
        ),
        PopupMenuButton<_AppBarActions>(
          onSelected: onAction,
          itemBuilder:
              (_) => [
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
