
import 'package:flutter/material.dart';
import 'package:skills_app/screens/about_screen.dart';
import 'package:skills_app/screens/home_screen.dart';
import 'package:skills_app/screens/my_work_screen.dart';
import 'package:skills_app/screens/skills_screen.dart';


// Define a function that returns the routes map
Map<String, WidgetBuilder> getRoutes(VoidCallback toggleTheme, Function(String) changeLanguage) {
  return {
    '/': (context) => HomeScreen(toggleTheme: toggleTheme, changeLanguage: changeLanguage),
    '/about': (context) => AboutScreen(),
    '/skills': (context) => SkillsScreen(),
    '/work': (context) => MyWorkScreen(),
  };
}