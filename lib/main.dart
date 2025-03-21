// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'common/strings.dart' as strings;

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
