import 'package:flutter/material.dart';
import 'package:skills_app/constants/localisation.constant.dart';
import 'package:skills_app/constants/styles.constant.dart';
import 'package:skills_app/core/localization/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class buildHeroSection extends StatefulWidget {
  const buildHeroSection({super.key});

  @override
  State<buildHeroSection> createState() => _buildHeroSectionState();
}

class _buildHeroSectionState extends State<buildHeroSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // Background image
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.8),
            Color(0xFFFCA311).withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
      ),
      child: Stack(
        children: [
          // Dark overlay to improve text readability
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile picture
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/images/my_img.jpg'), // Ensure this image is in your assets
                ),
                SizedBox(height: 16.0),
                // Welcome message
                Text(
                  getTranslate(context, 'welcome'),
                  style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                // Subheading
                Text(
                  getTranslate(context, 'discover'),
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
