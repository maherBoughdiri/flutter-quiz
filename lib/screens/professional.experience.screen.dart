import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
            _buildTimelineHeader('Professional Experience Timeline'),
            _buildTimelineItem(
              context,
              position: 'Software Engineer',
              company: 'Tech Solutions Inc.',
              year: '2020 - Present',
              description:
                  'Working on developing scalable web applications and APIs. Led a team of developers in various projects, focusing on improving code quality and performance.',
              isFirst: true,
            ),
            _buildTimelineItemWithMap(
              context,
              position: 'Junior Developer',
              company: 'Innovative Apps Ltd.',
              year: '2018 - 2020',
              description:
                  'Assisted in the development of mobile applications. Gained experience in full-stack development and collaborated with cross-functional teams.',
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
                child: Icon(Icons.work, color: Colors.white),
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
                        position,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        company,
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

  Widget _buildTimelineItemWithMap(
    BuildContext context, {
    required String position,
    required String company,
    required String year,
    required String description,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Column(
      children: [
        _buildTimelineItem(
          context,
          position: position,
          company: company,
          year: year,
          description: description,
          isFirst: isFirst,
          isLast: isLast,
        ),
        SizedBox(height: 16),
        Container(
          height: 200,
          child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(51.5, -0.09),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
