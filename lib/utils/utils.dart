// Copyright 2022-2025 Tecdrop. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://www.tecdrop.com/helloworldplus/license/.

/// Various utility functions used in the app.
library;

import 'package:flutter/material.dart';

/// Navigates to the specified [screen] and returns the result.
Future<T?> navigateTo<T>(BuildContext context, Widget screen) async {
  return await navigatorTo<T>(Navigator.of(context), screen);
}

/// Navigates to the specified [screen] and returns the result.
Future<T?> navigatorTo<T>(NavigatorState navigator, Widget screen) async {
  return await navigator.push(MaterialPageRoute<T>(builder: (context) => screen));
}
