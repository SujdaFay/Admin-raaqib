import 'package:flutter/material.dart';

final darkThe = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.dark(primary: Colors.black, secondary: Colors.white),
);
final lightThe = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade100,
  brightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade300,
    secondary: Colors.black,
  ),
);
