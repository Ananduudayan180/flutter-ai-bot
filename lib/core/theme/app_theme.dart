import 'package:flutter/material.dart';
import 'package:flutter_ai_bot/core/theme/color_theme.dart';
import 'package:flutter_ai_bot/core/theme/text_theme.dart';

final darkTheme = ThemeData(
  textTheme: textTheme,
  scaffoldBackgroundColor: Color(0xFF000000),
  colorScheme: darkColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
);

final lightTheme = ThemeData(
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
