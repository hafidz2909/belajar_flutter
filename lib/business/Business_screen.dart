import 'package:flutter/material.dart';
import '../data/map_nama.dart'; // Import the map_nama.dart file

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override


 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Business')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: mapNama.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mapNama[index]['name']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Location: ${mapNama[index]['location']}'),
                Text('Principal: ${mapNama[index]['principal']}'),
                Text('Students: ${mapNama[index]['students']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}