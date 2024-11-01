// Copyright 2022-2024 Hellogramming. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://hellogramming.com/hello_world_plus/license/.

import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'strings.dart' as strings;

void main() {
  runApp(const HelloWorldPlusApp());
}

/// The Hello, World! Plus app widget.
class HelloWorldPlusApp extends StatelessWidget {
  const HelloWorldPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: strings.appName,
      theme: ThemeData.light().copyWith(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
