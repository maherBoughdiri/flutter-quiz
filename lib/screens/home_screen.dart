import 'package:flutter/material.dart';
import 'package:skills_app/core/localization/app_localizations.dart';
import 'package:skills_app/widgets/home_widgets/hero_widget.dart';
import 'package:skills_app/widgets/home_widgets/navigation_cards_widget.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final Function(String) changeLanguage;

  HomeScreen({required this.toggleTheme, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('title')),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
          PopupMenuButton<String>(
            onSelected: changeLanguage,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
                PopupMenuItem(
                  value: 'ar',
                  child: Text('العربية'),
                ),
                PopupMenuItem(
                  value: 'fr',
                  child: Text('Français'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeroSection(),
            NavigationCardsWidget(),
          ],
        ),
      ),
    );
  }

}