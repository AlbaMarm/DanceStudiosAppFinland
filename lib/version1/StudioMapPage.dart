import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'StudioInfoPage.dart';

class StudioMapPage extends StatelessWidget {
  final List<Map<String, dynamic>> studios = [
    {
      "name": "Studio Helsinki",
      "address": "Kallio, Helsinki, Finland",
      "description": "Offers a variety of dance classes including contemporary and hip-hop.",
      "location": LatLng(60.1699, 24.9384),
    },
    {
      "name": "Studio Forssa",
      "address": "Forssa, Finland",
      "description": "Specializes in traditional Finnish dance and folk.",
      "location": LatLng(60.8008, 23.5924),
    },
    {
      "name": "Studio Turku",
      "address": "Turku, Finland",
      "description": "Focuses on ballet and jazz dance.",
      "location": LatLng(60.4518, 22.2666),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Studio Map',
          style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple[700],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(60.1699, 24.9384),
          zoom: 12,
        ),
        markers: studios.map((studio) {
          return Marker(
            markerId: MarkerId(studio["name"]),
            position: studio["location"],
            infoWindow: InfoWindow(
              title: studio["name"],
              snippet: studio["address"],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudioInfoPage(
                      name: studio["name"],
                      address: studio["address"],
                      description: studio["description"],
                    ),
                  ),
                );
              },
            ),
          );
        }).toSet(),
      ),
    );
  }
}
