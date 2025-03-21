// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

import 'package:flutter/material.dart';

import '../common/strings.dart' as strings;
import '../data/hello_world_messages.dart';

/// The storage bucket used to store the scroll position of the message list view.
final PageStorageBucket _storageBucket = PageStorageBucket();

/// A screen that displays the list of available Hello World messages.
class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  /// Handles the tap event on an item in the list.
  void _onItemTapped(BuildContext context, int index) {
    Navigator.of(context).pop(index);
  }

  @override
  Widget build(BuildContext context) {
    // Use a [PageStorage] widget to store / restore the scroll position of the message list view
    // while the app is running.
    return PageStorage(
      bucket: _storageBucket,
      child: Scaffold(
        appBar: AppBar(title: const Text(strings.messageListScreenTitle)),
        body: ListView.builder(
          key: const PageStorageKey<String>('message_list'),
          itemCount: helloWorldMessages.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(helloWorldMessages[index].message),
              subtitle: Text(helloWorldMessages[index].languageName),
              onTap: () => _onItemTapped(context, index),
            );
          },
        ),
      ),
    );
  }
}
