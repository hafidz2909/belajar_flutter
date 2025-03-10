import 'package:flutter/material.dart';
import '../model/note.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  NoteDetailScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(note.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Dibuat pada: ${note.date}",
                style: TextStyle(color: Colors.grey),
              ),
              Divider(),
              SizedBox(height: 10),
              Text(note.content, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
