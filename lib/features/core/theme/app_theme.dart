import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: const Color.fromARGB(255, 1, 114, 82),
    brightness: Brightness.light,
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
      checkColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 31, 105, 33)),
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    listTileTheme: const ListTileThemeData(
        selectedTileColor: Color.fromARGB(255, 217, 217, 217)),
  );

  static ThemeData darkTheme = ThemeData(
    colorSchemeSeed: Colors.cyan,
    brightness: Brightness.dark,
  );

  static Color avatarColor(int index) {
    return Colors.white;
  }

  static ButtonStyle dateTimeStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white70),
      foregroundColor: MaterialStateProperty.all(Colors.black87),
      fixedSize: MaterialStateProperty.all(
          Size.fromWidth(MediaQuery.of(context).size.width * 0.1)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      side: MaterialStateProperty.all(
          const BorderSide(width: 1.5, color: Color.fromARGB(255, 56, 55, 55))),
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
    );
  }
}
