import 'package:flutter/material.dart';

class AppTheme {
  ///
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
