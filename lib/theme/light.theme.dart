import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.constants.dart';
import 'package:quiz/core/colors/colors.services.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: oxfordBlue,
  primarySwatch: createMaterialColor(oxfordBlue),
  // accentColor: orangeWeb,
  brightness: Brightness.light,
  // backgroundColor: platinum,
  scaffoldBackgroundColor: white,
  appBarTheme: AppBarTheme(
    color: oxfordBlue,
    titleTextStyle: TextStyle(
      color: white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: orangeWeb,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // primary: orangeWeb,
      //onPrimary: white,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: black),
    bodyMedium: TextStyle(color: black.withOpacity(0.6)),
    headlineLarge: TextStyle(
      color: oxfordBlue,
      fontWeight: FontWeight.bold,
      fontSize: 32.0,
    ),
    titleLarge: TextStyle(
      color: oxfordBlue,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: platinum,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: oxfordBlue),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: oxfordBlue.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  cardTheme: CardTheme(
    color: white,
    shadowColor: oxfordBlue.withOpacity(0.2),
    elevation: 5,
    margin: EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  iconTheme: IconThemeData(
    color: oxfordBlue,
  ),
);
