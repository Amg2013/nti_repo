// theme.dart
import 'package:flutter/material.dart';

// 1- define lightTheme and darkTheme static properties
//
// 2- create proivders (theme date , func that change the theme)
//
// 3- use the theme data in the MaterialApp/
//
// 4- use the provider to change the theme mode

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    //
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.blue),
    ),
    //
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.blue),

    //
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    hintColor: Colors.white,

    scaffoldBackgroundColor: Colors.black,
  );
}
