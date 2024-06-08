import 'package:flutter/material.dart';
import 'package:skills_app/core/localization/app_localizations.dart';

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
            _buildHeroSection(context),
            _buildNavigationCards(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate('welcome'),
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            AppLocalizations.of(context).translate('discover'),
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationCards(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildCard(
            context,
            icon: Icons.info,
            label: AppLocalizations.of(context).translate('go_to_about'),
            routeName: '/about',
          ),
          _buildCard(
            context,
            icon: Icons.school,
            label: AppLocalizations.of(context).translate('go_to_skills'),
            routeName: '/skills',
          ),
          _buildCard(
            context,
            icon: Icons.work,
            label: AppLocalizations.of(context).translate('go_to_work'),
            routeName: '/work',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required IconData icon, required String label, required String routeName}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40.0),
        title: Text(label),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}