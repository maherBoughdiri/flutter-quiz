import 'package:flutter/material.dart';
import 'package:skills_app/core/localization/app_localizations.dart';

class NavigationCardsWidget extends StatefulWidget {
  const NavigationCardsWidget({super.key});

  @override
  State<NavigationCardsWidget> createState() => _NavigationCardsWidgetState();
}

class _NavigationCardsWidgetState extends State<NavigationCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          childAspectRatio: 1, // Adjust to fit your desired aspect ratio
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: _navigationItems.length,
        itemBuilder: (context, index) {
          return _buildCard(
            context,
            icon: _navigationItems[index].icon,
            label: AppLocalizations.of(context)
                .translate(_navigationItems[index].labelKey),
            routeName: _navigationItems[index].routeName,
          );
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
      required String label,
      required String routeName}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.white,
              ),
              SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String labelKey;
  final String routeName;

  NavigationItem(
      {required this.icon, required this.labelKey, required this.routeName});
}

final List<NavigationItem> _navigationItems = [
  NavigationItem(
    icon: Icons.person,
    labelKey: 'personal_information',
    routeName: '/personal_information',
  ),
  NavigationItem(
    icon: Icons.school,
    labelKey: 'education',
    routeName: '/education',
  ),
  NavigationItem(
    icon: Icons.work,
    labelKey: 'professional_experience',
    routeName: '/professional_experience',
  ),
  NavigationItem(
    icon: Icons.location_on,
    labelKey: 'professional_address',
    routeName: '/professional_address',
  ),
  NavigationItem(
    icon: Icons.star,
    labelKey: 'skills_certifications',
    routeName: '/skills_certifications',
  ),
  NavigationItem(
    icon: Icons.portrait,
    labelKey: 'portfolio',
    routeName: '/portfolio',
  ),
  // Add more items as needed
];
