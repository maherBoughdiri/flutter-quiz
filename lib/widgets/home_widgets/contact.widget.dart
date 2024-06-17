import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildActionWidget(
          'Call Now',
          Icons.phone,
          () => _launchURL('tel:+25458799'),
        ),
        _buildActionWidget(
          'Send Email',
          Icons.email,
          () => _launchURL('mailto:mboughdiri4@gmail.com'),
        ),
        _buildActionWidget(
          'Go to Facebook',
          Icons.facebook,
          () => _launchURL('https://www.facebook.com/your-profile'),
        ),
        _buildActionWidget(
          'Go to Instagram',
          Icons.camera_alt,
          () => _launchURL('https://www.instagram.com/your-profile'),
        ),
        _buildActionWidget(
          'Open Maps',
          Icons.map,
          () => _launchURL('https://maps.google.com'),
        ),
        _buildActionWidget(
          'PDF Preview',
          Icons.picture_as_pdf,
          () => _launchPDF('https://example.com/sample.pdf', context),
        ),
        _buildActionWidget(
          'CV Information',
          Icons.info,
          () => _showCVInformation(context),
        ),
      ],
    );
  }

  Widget _buildActionWidget(
      String title, IconData iconData, Function() onPressed) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: ListTile(
          leading: Icon(iconData),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchPDF(String url, BuildContext context) async {
    // Example of using a PDF viewer plugin or launching a URL directly
    // Replace with your preferred method to view PDFs in your app
    _launchURL(url);
  }

  void _showCVInformation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(getTranslate(context, 'cv_information')),
        content: Text(getTranslate(context, 'cv_information_details')),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(getTranslate(context, 'close')),
          ),
        ],
      ),
    );
  }
}

// Replace with actual implementation of getTranslate function or localization logic
String getTranslate(BuildContext context, String key) {
  // Implement your localization logic here
  // Example: return AppLocalizations.of(context).translate(key);
  return key; // Default implementation for demonstration
}
