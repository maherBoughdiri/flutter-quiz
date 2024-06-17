import 'package:flutter/material.dart';
import 'package:skills_app/constants/localisation.constant.dart';

class SkillsCertificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'skills_certifications')),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(getTranslate(context, 'skills_section_title')),
          _buildSkillItem(context, 'laravel'),
          _buildSkillItem(context, 'php'),
          _buildSkillItem(context, 'vuejs'),
          _buildSkillItem(context, 'angular'),
          _buildSkillItem(context, 'css'),
          _buildSkillItem(context, 'javascript'),
          _buildSkillItem(context, 'ionic'),
          _buildSkillItem(context, 'nodejs'),
          _buildSkillItem(context, 'symfony'),
          _buildSkillItem(context, 'reactjs'),
          _buildSkillItem(context, 'react_native'),
          _buildSkillItem(context, 'python'),
          _buildSkillItem(context, 'nuxtjs'),
          _buildSkillItem(context, 'typescript'),
          _buildSkillItem(context, 'git'),
          SizedBox(height: 20),
          _buildSectionTitle(
              getTranslate(context, 'certifications_section_title')),
          _buildCertificationItem(context, 'flutter_certified_developer'),
          _buildCertificationItem(context, 'java_programming_certification'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSkillItem(BuildContext context, String skillKey) {
    String skill = getTranslate(context, skillKey);
    return ListTile(
      title: Text(skill),
      leading: Icon(Icons.star),
    );
  }

  Widget _buildCertificationItem(
      BuildContext context, String certificationKey) {
    String certification = getTranslate(context, certificationKey);
    return ListTile(
      title: Text(certification),
      leading: Icon(Icons.check_circle),
    );
  }
}
