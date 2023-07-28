import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
        primaryColor: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: isDarkTheme
                  ? const Color(0xFF1a1f3c)
                  : const Color(0xFFFFFFFF),
              brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            ),
        cardColor: isDarkTheme
            ? Color.fromARGB(255, 18, 21, 38)
            : const Color(0xFFFFFFFF),
        canvasColor: isDarkTheme ? Colors.black : Colors.grey,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()));
  }
}
