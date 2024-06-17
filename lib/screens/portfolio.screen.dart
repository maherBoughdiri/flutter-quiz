import 'package:flutter/material.dart';
import 'package:skills_app/constants/localisation.constant.dart';

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'portfolio_title')),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: cvProjects.length,
        itemBuilder: (context, index) {
          String skill = cvProjects[index]['skill'];
          List<Map<String, String>> projects = cvProjects[index]['projects'];

          return _buildSkillGroup(skill, projects, context);
        },
      ),
    );
  }

  Widget _buildSkillGroup(
      String skill, List<Map<String, String>> projects, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            skill,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: projects
                .map((project) => _buildProjectCard(
                      project['nameKey'] ?? '',
                      project['descriptionKey'] ?? '',
                      'assets/images/portfolio_image.jpg', // replace with actual image path
                      context,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectCard(String nameKey, String descriptionKey,
      String imagePath, BuildContext context) {
    String projectName = getTranslate(context, nameKey);
    String projectDescription = getTranslate(context, descriptionKey);

    return Container(
      width: 300,
      margin: EdgeInsets.only(right: 16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.asset(
                imagePath,
                width: 300,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projectName,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    projectDescription,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Replace with actual data from your CV
  List<Map<String, dynamic>> cvProjects = [
    {
      'skill': 'Laravel',
      'projects': [
        {
          'nameKey': 'laravel_project_1_name',
          'descriptionKey': 'laravel_project_1_description',
        },
        {
          'nameKey': 'laravel_project_2_name',
          'descriptionKey': 'laravel_project_2_description',
        },
      ],
    },
    {
      'skill': 'Vue.js',
      'projects': [
        {
          'nameKey': 'vue_project_name',
          'descriptionKey': 'vue_project_description',
        },
      ],
    },
    {
      'skill': 'Angular',
      'projects': [
        {
          'nameKey': 'angular_project_name',
          'descriptionKey': 'angular_project_description',
        },
      ],
    },
    {
      'skill': 'Ionic',
      'projects': [
        {
          'nameKey': 'ionic_project_name',
          'descriptionKey': 'ionic_project_description',
        },
      ],
    },
    {
      'skill': 'Flutter',
      'projects': [
        {
          'nameKey': 'flutter_project_name',
          'descriptionKey': 'flutter_project_description',
        },
      ],
    },
    {
      'skill': 'Python',
      'projects': [
        {
          'nameKey': 'python_project_name',
          'descriptionKey': 'python_project_description',
        },
      ],
    },
  ];
}
