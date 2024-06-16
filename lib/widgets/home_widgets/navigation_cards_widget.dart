import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skills_app/constants/localisation.constant.dart';
import 'package:skills_app/core/localization/app_localizations.dart';
import 'package:skills_app/widgets/home_widgets/title_section.widget.dart';

class NavigationCardsWidget extends StatefulWidget {
  const NavigationCardsWidget({super.key});

  @override
  State<NavigationCardsWidget> createState() => _NavigationCardsWidgetState();
}

class _NavigationCardsWidgetState extends State<NavigationCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: getTranslate(context, 'navigation_header'),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            top: 2.0,
            right: 16.0,
            bottom: 2.0,
          ),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 150,
              aspectRatio: 2.0,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
            ),
            itemCount: _navigationItems.length,
            itemBuilder: (context, index, realIdx) {
              return _buildCard(
                context,
                icon: _navigationItems[index].icon,
                label: getTranslate(context, _navigationItems[index].labelKey),
                routeName: _navigationItems[index].routeName,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
      required String label,
      required String routeName}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.8),
              Color(0xFFFCA311).withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
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
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
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
