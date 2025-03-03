import 'package:flutter/material.dart';
import 'package:first/data/model_nama.dart';

  class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman School')),
body: ListView.builder(
        itemCount: listNameModelData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(listNameModelData[index].nameSchool),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listNameModelData[index].address),
                Text(listNameModelData[index].principal),
              ],
            ),
          );
        },
      ),
    );
    
  }
}


