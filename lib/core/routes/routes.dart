import 'package:flutter/material.dart';
import 'package:skills_app/screens/education.screen.dart';
import 'package:skills_app/screens/home_screen.dart';
import 'package:skills_app/screens/personal.information.screen.dart';
import 'package:skills_app/screens/portfolio.screen.dart';
import 'package:skills_app/screens/professional.address.screen.dart';
import 'package:skills_app/screens/professional.experience.screen.dart';
import 'package:skills_app/screens/skills.certifications.screen.dart';

Map<String, WidgetBuilder> getRoutes(
    VoidCallback toggleTheme, Function(String) changeLanguage) {
  return {
    '/': (context) =>
        HomeScreen(toggleTheme: toggleTheme, changeLanguage: changeLanguage),
    '/personal_information': (context) => PersonalInformationScreen(),
    '/education': (context) => EducationScreen(),
    '/professional_experience': (context) => ProfessionalExperienceScreen(),
    '/professional_address': (context) => ProfessionalAddressScreen(),
    '/skills_certifications': (context) => SkillsCertificationsScreen(),
    '/portfolio': (context) => PortfolioScreen(),
  };
}
