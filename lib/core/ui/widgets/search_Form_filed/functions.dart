import 'dart:async';

import 'package:flutter/material.dart';

abstract class SearchFunctions {
  static const _duration = Duration(seconds: 1);

  static Timer? _searchOnStoppedTyping;
  static void onChangeHandler(String? value, VoidCallback handleSearch) {
    if ((value.toString()).trim().isNotEmpty) {
      if (_searchOnStoppedTyping != null) {
        _searchOnStoppedTyping?.cancel();
      }
      _searchOnStoppedTyping = Timer(_duration, () => handleSearch());
    }
  }
}
