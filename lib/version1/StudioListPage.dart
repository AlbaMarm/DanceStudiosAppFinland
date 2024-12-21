import 'package:flutter/material.dart';
import 'package:prueba1app/version1/StudioInfoPage.dart';

class StudioListPage extends StatefulWidget {
  @override
  _StudioListPageState createState() => _StudioListPageState();
}

class _StudioListPageState extends State<StudioListPage> {
  final List<Map<String, String>> allStudios = [
    {
      "name": "Studio Helsinki",
      "address": "Kallio, Helsinki",
      "description": "Offers contemporary dance and urban dance classes.",
      "style": "Contemporary",
    },
    {
      "name": "Studio Forssa",
      "address": "Forssa, Finland",
      "description": "Specializes in traditional Finnish dance and folk.",
      "style": "Folk",
    },
    {
      "name": "Studio Turku",
      "address": "Turku, Finland",
      "description": "Focuses on ballet and jazz dance for all levels.",
      "style": "Ballet",
    },
  ];

  String searchQuery = "";
  String selectedStyle = "All";
  List<Map<String, String>> displayedStudios = [];

  @override
  void initState() {
    super.initState();
    // Everything is displayed first
    displayedStudios = allStudios;
  }

  void filterStudios() {
    setState(() {
      displayedStudios = allStudios.where((studio) {
        bool matchesSearchQuery = studio["name"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            studio["address"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            studio["description"]!.toLowerCase().contains(searchQuery.toLowerCase());

        bool matchesStyle = selectedStyle == "All" || studio["style"] == selectedStyle;
        return matchesSearchQuery && matchesStyle;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dance Studios',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[700],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Studios...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                  filterStudios();
                });
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedStyle,
              onChanged: (newStyle) {
                setState(() {
                  selectedStyle = newStyle!;
                  filterStudios();
                });
              },
              items: ["All", "Contemporary", "Folk", "Ballet", "Salsa", "Hip-Hop"]
                  .map<DropdownMenuItem<String>>((String style) {
                return DropdownMenuItem<String>(
                  value: style,
                  child: Text(style),
                );
              }).toList(),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: displayedStudios.length,
              itemBuilder: (context, index) {
                final studio = displayedStudios[index];
                return ListTile(
                  title: Text(
                    studio["name"]!,
                    style: TextStyle(color: Colors.purple[800], fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(studio["address"]!),
                  tileColor: Colors.purple[50],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudioInfoPage(
                          name: studio["name"]!,
                          address: studio["address"]!,
                          description: studio["description"]!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
