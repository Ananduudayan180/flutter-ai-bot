import 'package:flutter/material.dart';

final darkColorScheme =
    ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.green,
    ).copyWith(
      primary: Colors.green,
      onPrimary: Colors.white,
      secondary: Colors.yellow,
      onSecondary: Colors.black,
      surface: Color(0xFF0F1A14),
      onSurface: Colors.white,
    );

final lightColorScheme =
    ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.green,
    ).copyWith(
      primary: Colors.green,
      onPrimary: Colors.white,
      secondary: Colors.yellow,
      onSecondary: Colors.black,
      surface: Colors.green[50],
      onSurface: Colors.black,
    );
