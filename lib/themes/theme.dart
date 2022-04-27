import 'package:flutter/material.dart';
import 'package:iot_project/const/const.dart';

import 'package:flutter/material.dart';

const PRIMARY_COLOR = Color.fromARGB(255, 155, 5, 42);
const COLOR_ACCENT = Color.fromARGB(255, 243, 85, 151);
const BACKGROUND_COLOR = Color.fromARGB(255, 211, 199, 204);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: PRIMARY_COLOR,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(COLOR_ACCENT),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_ACCENT),
);

NavigationBarThemeData bottomNavBarTheme = NavigationBarThemeData(
  indicatorColor: Colors.pink.shade100,
  labelTextStyle: MaterialStateProperty.all(
    TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);
