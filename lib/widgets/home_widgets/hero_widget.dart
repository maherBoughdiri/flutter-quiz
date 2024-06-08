import 'package:flutter/material.dart';
import 'package:skills_app/constants/localisation.constant.dart';
import 'package:skills_app/constants/styles.constant.dart';
import 'package:skills_app/core/localization/app_localizations.dart';

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
      height: 300,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        // image: DecorationImage(
        //   image: AssetImage('images/portfolio_image.jpg'),
        //   fit: BoxFit.cover,
        // ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'welcome'),
            style: headingS48_fwB_CW,
          ),
          SizedBox(height: 8.0),
          Text(
            getTranslate(context, 'discover'),
            style: subheadingS28_fwN_CW,
          )
        ],
      ),
    );
  }
}
