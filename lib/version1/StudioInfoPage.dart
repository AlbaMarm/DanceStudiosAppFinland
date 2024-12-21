import 'package:flutter/material.dart';

class StudioInfoPage extends StatelessWidget {
  final String name;
  final String address;
  final String description;

  StudioInfoPage({
    required this.name,
    required this.address,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            name,
            style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[700],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 24, color: Colors.purple[500],fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              address,
              style: TextStyle(fontSize: 16, color: Colors.purple[300]),
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
