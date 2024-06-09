import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ProfessionalAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Address'),
      ),
      body: Column(children: [
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(51.5,
                  -0.09), // Replace with your professional address coordinates
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
      ]),
    );
  }
}
