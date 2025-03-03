import 'package:first/data/grid_data.dart';
import 'package:flutter/material.dart';
import '../model/grid_model.dart';

 // Import the list_nama.dart file
class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Profile')),
      body:GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8
        ),
        itemCount: gridData.length,
        itemBuilder: (BuildContext context, int index) {
          final data = gridData[index];
          return Container(
            // image: DecorationImage(
            //   image: AssetImage(data.image),
            //   fit: BoxFit.cover
            // ),
            color: data.color,
            child: Text(data.name, style: TextStyle(fontSize: 20),),
          );
        },
      ), 
    );
  }
}