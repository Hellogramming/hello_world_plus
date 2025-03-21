// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

import 'dart:math';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../data/hello_world_messages.dart';
import '../message_list_screen.dart';
import '../strings.dart' as strings;
import '../urls.dart' as urls;
import '../utils/color_utils.dart' as color_utils;
import '../utils/utils.dart';
import '../widgets/hello_world_message_view.dart';
import 'simple_message_screen.dart';

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
      case _AppBarActions.simpleMessage:
        // Open the simple message screen with the selected message
        await navigateTo(context, SimpleMessageScreen(message: helloWorldMessages[_messageIndex]));
        break;

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
    final Color foregroundColor = color_utils.contrastColor(
      helloWorldMessages[_messageIndex].color,
    );

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      color: helloWorldMessages[_messageIndex].color,
      child: Scaffold(
        // backgroundColor: helloWorldMessages[_messageIndex].color,
        backgroundColor: Colors.transparent,
        appBar: _AppBar(onAction: _onAppBarAction, foregroundColor: foregroundColor),

        // The body of the home screen displays the selected Hello World message
        body: Center(
          child: HelloWorldMessageView(
            message: helloWorldMessages[_messageIndex],
            foregroundColor: foregroundColor,
          ),
        ),

        // The FAB allows the user to refresh the Hello World message
        floatingActionButton: FloatingActionButton.large(
          tooltip: strings.homeFabTooltip,
          backgroundColor: foregroundColor,
          foregroundColor: helloWorldMessages[_messageIndex].color,
          onPressed: _onFABPressed,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

/// Enum that defines the actions of the app bar.
enum _AppBarActions { simpleMessage, messageList, viewSource, about }

/// The app bar of the home screen.
class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    super.key, // ignore: unused_element_parameter
    required this.foregroundColor,
    this.onAction,
  });

  /// The color of the app bar text.
  final Color foregroundColor;

  /// The callback that is called when an app bar action is pressed.
  final void Function(_AppBarActions action)? onAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: foregroundColor,
      elevation: 0,

      actions: <Widget>[
        IconButton(
          // icon: const Icon(Icons.sms_outlined),
          icon: const Icon(Icons.visibility_outlined),
          tooltip: strings.simpleMessageTooltip,
          onPressed: () => onAction?.call(_AppBarActions.simpleMessage),
        ),
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
