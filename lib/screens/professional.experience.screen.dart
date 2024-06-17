import 'package:flutter/material.dart';
import 'package:skills_app/constants/localisation.constant.dart';

class ProfessionalExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Experience'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTimelineHeader(getTranslate(context, 'timeline_header')),
            SizedBox(height: 16.0),
            _buildTimelineItem(
              context,
              position: 'software_engineer_position',
              company: 'tech_solutions_company',
              year: 'current_job_duration',
              description: 'current_job_description',
              isFirst: true,
            ),
            SizedBox(height: 16.0),
            _buildTimelineItem(
              context,
              position: 'full_stack_developer_position',
              company: 'navicom_company',
              year: 'navicom_job_duration',
              description: 'navicom_job_description',
              isLast: true,
            ),
            SizedBox(height: 16.0),
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
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.blueAccent.withOpacity(0.5),
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required String position,
    required String company,
    required String year,
    required String description,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Stack(
      children: [
        Positioned(
          left: 30,
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
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFCA311), Theme.of(context).primaryColor],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(Icons.work, color: Colors.white),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslate(context, position),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        getTranslate(context, company),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueAccent,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        getTranslate(context, year),
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        getTranslate(context, description),
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
