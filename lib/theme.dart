import 'package:flutter/material.dart';

final appTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.dark(
    primary: Colors.blueAccent,
    secondary: Colors.cyanAccent,
    error: Colors.redAccent,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

const emergencyButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Colors.red),
  foregroundColor: MaterialStatePropertyAll(Colors.white),
  padding: MaterialStatePropertyAll(
    EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  ),
);