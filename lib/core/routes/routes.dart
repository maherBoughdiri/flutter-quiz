import 'package:flutter/material.dart';
import 'package:quiz/screens/home_screen.dart';

Map<String, WidgetBuilder> getRoutes(
    VoidCallback toggleTheme, Function(String) changeLanguage) {
  return {
    '/': (context) =>
        HomeScreen(toggleTheme: toggleTheme, changeLanguage: changeLanguage),
  };
}
