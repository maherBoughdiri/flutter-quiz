import 'package:flutter/material.dart';

class PersonalInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/avatar.jpg'), // Replace with your asset image
            ),
            SizedBox(height: 16.0),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'john.doe@example.com',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '1234 Elm Street, Springfield, USA',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            _buildInfoRow(Icons.cake, 'Date of Birth', 'January 1, 1990'),
            _buildInfoRow(Icons.phone, 'Phone', '+1 (555) 555-5555'),
            _buildInfoRow(
                Icons.location_city, 'Place of Birth', 'Springfield, USA'),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            _buildSectionHeader('Professional Address'),
            _buildGoogleMapPlaceholder(),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            _buildSectionHeader('About Me'),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Praesent bibendum, neque sit amet facilisis malesuada, '
              'libero velit lacinia dui, a sollicitudin velit justo eu nisl. '
              'Maecenas interdum sapien nec arcu suscipit ultricies.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          SizedBox(width: 16.0),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildGoogleMapPlaceholder() {
    return Container(
      width: double.infinity,
      height: 200.0,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          'Google Map Placeholder',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}
