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
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(34.750918, 10.729254),
                initialZoom: 13.0,
                minZoom: 5.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 100.0,
                      height: 136.0,
                      point: LatLng(34.750918,
                          10.729254), // Replace with your professional address coordinates
                      child: Container(
                        child: Image.asset(
                          'assets/images/location_pin.png', // Replace with your asset path
                          width: 404.0,
                          height: 548.0,
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
