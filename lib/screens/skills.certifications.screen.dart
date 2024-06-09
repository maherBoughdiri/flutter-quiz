import 'package:flutter/material.dart';

class SkillsCertificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills & Certifications'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Skills'),
          _buildSkillItem('Flutter'),
          _buildSkillItem('Dart'),
          _buildSkillItem('Java'),
          _buildSkillItem('Python'),
          _buildSkillItem('HTML/CSS'),
          _buildSkillItem('JavaScript'),
          SizedBox(height: 20),
          _buildSectionTitle('Certifications'),
          _buildCertificationItem('Flutter Certified Developer'),
          _buildCertificationItem('Java Programming Certification'),
          _buildCertificationItem('AWS Certified Developer'),
          _buildCertificationItem('Google Cloud Associate Engineer'),
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

  Widget _buildSkillItem(String skill) {
    return ListTile(
      title: Text(skill),
      leading: Icon(Icons.star),
    );
  }

  Widget _buildCertificationItem(String certification) {
    return ListTile(
      title: Text(certification),
      leading: Icon(Icons.check_circle),
    );
  }
}
