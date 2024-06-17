import 'package:flutter/material.dart';
import 'package:skills_app/core/localization/app_localizations.dart';
import 'package:skills_app/widgets/home_widgets/contact.widget.dart';
import 'package:skills_app/widgets/home_widgets/hero_widget.dart';
import 'package:skills_app/widgets/home_widgets/navigation_cards_widget.dart';
import 'package:skills_app/widgets/home_widgets/navigation_contact.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final Function(String) changeLanguage;

  HomeScreen({required this.toggleTheme, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.8),
                Color(0xFFFCA311).withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context).translate('title'),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleTheme,
            color: Colors.white,
          ),
          PopupMenuButton<String>(
            onSelected: changeLanguage,
            icon: Icon(Icons.language, color: Colors.white),
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
            NavigationContactWidget(),
            // ClickableActionsWidget(),
          ],
        ),
      ),
    );
  }
}
