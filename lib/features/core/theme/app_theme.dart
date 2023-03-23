import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: const Color.fromARGB(255, 1, 114, 82),
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    listTileTheme: const ListTileThemeData(
      textColor: Color.fromARGB(255, 45, 45, 45),
    ),
    brightness: Brightness.dark,
  );
}
