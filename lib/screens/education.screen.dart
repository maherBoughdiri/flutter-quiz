import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTimelineHeader('Education Timeline'),
            _buildTimelineItem(
              context,
              degree: 'Bachelor of Science in Computer Science',
              institution: 'Springfield University',
              year: '2015 - 2019',
              description:
                  'Studied various aspects of computer science including algorithms, data structures, and software engineering. Graduated with honors.',
              isFirst: true,
            ),
            _buildTimelineItem(
              context,
              degree: 'High School Diploma',
              institution: 'Springfield High School',
              year: '2011 - 2015',
              description:
                  'Focused on science and mathematics, participating in various extracurricular activities such as the coding club and math olympiad.',
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required String degree,
    required String institution,
    required String year,
    required String description,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          top: 0,
          bottom: isLast ? 20 : 0,
          child: Container(
            width: 2,
            color: Colors.blueAccent,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.school, color: Colors.white),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        degree,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        institution,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        year,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        description,
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
