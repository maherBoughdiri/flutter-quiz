import 'package:flutter/material.dart';
import 'package:skills_app/constants/localisation.constant.dart';

class PersonalInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslate(context, 'personal_information')),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/images/my_img.jpg'), // Replace with your asset image
            ),
            SizedBox(height: 16.0),
            Text(
              'Maher Boughdiri',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'maher.boughdiri@softtodo.com',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              getTranslate(context, 'full_address'),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            _buildInfoRow(Icons.cake, getTranslate(context, 'date_of_birth'),
                'June 15, 1994'),
            _buildInfoRow(
                Icons.phone, getTranslate(context, 'phone'), '25458799'),
            _buildInfoRow(
                Icons.location_city,
                getTranslate(context, 'place_of_birth'),
                getTranslate(context, 'place_of_birth_value')),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            _buildSectionHeader(getTranslate(context, 'about_me')),
            Text(
              getTranslate(context, 'about_me_content'),
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

  Widget _buildGoogleMapPlaceholder(context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          getTranslate(context, 'google_map_placeholder'),
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}
