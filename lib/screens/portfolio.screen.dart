import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSkillGroup('Flutter', [
            _buildProjectCard(
              'Project 1',
              'Description of Project 1',
              'assets/images/portfolio_image.jpg',
            ),
            _buildProjectCard(
              'Project 2',
              'Description of Project 2',
              'assets/images/portfolio_image.jpg',
            ),
            _buildProjectCard(
              'Project 3',
              'Description of Project 3',
              'assets/images/portfolio_image.jpg',
            ),
          ]),
          SizedBox(height: 20),
          _buildSkillGroup('Dart', [
            _buildProjectCard(
              'Project 4',
              'Description of Project 4',
              'assets/images/portfolio_image.jpg',
            ),
            _buildProjectCard(
              'Project 5',
              'Description of Project 5',
              'assets/images/portfolio_image.jpg',
            ),
          ]),
          SizedBox(height: 20),
          _buildSkillGroup('Java', [
            _buildProjectCard(
              'Project 6',
              'Description of Project 6',
              'assets/images/portfolio_image.jpg',
            ),
            _buildProjectCard(
              'Project 7',
              'Description of Project 7',
              'assets/images/portfolio_image.jpg',
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSkillGroup(String skill, List<Widget> projects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: projects,
          ),
        ),
      ],
    );
  }

  Widget _buildProjectCard(String name, String description, String imagePath) {
    return Container(
      width: 200,
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
                width: 200,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
