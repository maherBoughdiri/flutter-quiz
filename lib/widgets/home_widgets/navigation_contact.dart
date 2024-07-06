import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skills_app/constants/localisation.constant.dart';
import 'package:skills_app/widgets/home_widgets/title_section.widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class NavigationContactWidget extends StatefulWidget {
  const NavigationContactWidget({super.key});

  @override
  State<NavigationContactWidget> createState() => _NavigationCardsWidgetState();
}

class _NavigationCardsWidgetState extends State<NavigationContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: getTranslate(context, 'contact'),
        ),
        Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              top: 2.0,
              right: 16.0,
              bottom: 2.0,
            ),
            child: Wrap(
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
                  () => _launchURL('https://www.facebook.com/'),
                ),
                _buildActionWidget(
                  'Go to Instagram',
                  Icons.camera_alt,
                  () => _launchURL('https://www.instagram.com/'),
                ),
                _buildActionWidget(
                  'Open Maps',
                  Icons.map,
                  () => _launchURL(
                      'https://www.google.tn/maps/place/Softtodo/@34.7498457,10.7260676,17z/data=!3m1!4b1!4m6!3m5!1s0x1301d348ed6f0101:0x4366d9be4276b555!8m2!3d34.7498413!4d10.7286425!16s%2Fg%2F11d_y5blmp?hl=fr&entry=ttu'),
                ),
                _buildActionWidget(
                  'Download CV',
                  Icons.picture_as_pdf,
                  () => _downloadLocalPDF(context),
                ),
                // _buildActionWidget(
                //   'CV Information',
                //   Icons.info,
                //   () => _showCVInformation(context),
                // ),
              ],
            )),
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
    print('launch ==> $url');
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
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

  Future<void> _downloadLocalPDF(BuildContext context) async {
    try {
      final directory = await getExternalStorageDirectory();
      final downloadsDirectory = Directory('${directory!.path}/Download');
      if (!await downloadsDirectory.exists()) {
        await downloadsDirectory.create(recursive: true);
      }

      final filePath = '${downloadsDirectory.path}/sample.pdf';
      final byteData =
          await DefaultAssetBundle.of(context).load('assets/images/mt_cv.pdf');
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF Progress downloaded to $filePath')),
      );

      // Use flutter_file_downloader to handle the download process
      await FileDownloader.downloadFile(
        url: file.path,
        name: 'sample.pdf',
        onProgress: (String? fileName, double progress) {
          print('FILE $fileName HAS PROGRESS $progress');
        },
        onDownloadCompleted: (String path) {
          print('FILE DOWNLOADED TO PATH: $path');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('PDF downloaded to $path')),
          );
        },
        onDownloadError: (String error) {
          print('DOWNLOAD ERROR: $error');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error downloading PDF: $error')),
          );
        },
      );
    } catch (e) {
      print('Error downloading PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading PDF: $e')),
      );
    }
  }
}
