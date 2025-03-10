import 'package:first/model/note.dart';
import 'package:first/todo/database_helper.dart';
import 'package:first/todo/note_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final DBHelper dbHelper = DBHelper();
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    List<Note> data = await dbHelper.getNotes();
    setState(() {
      notes = data;
    });
  }

  void _showForm({Note? note}) {
    TextEditingController titleController = TextEditingController(
      text: note?.title ?? '',
    );
    TextEditingController contentController = TextEditingController(
      text: note?.content ?? '',
    );
    String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(note == null ? 'Tambah Catatan' : 'Edit Catatan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Judul'),
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(labelText: 'Isi Catatan'),
                maxLines: 4,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                String title = titleController.text;
                String content = contentController.text;

                if (title.isNotEmpty && content.isNotEmpty) {
                  if (note == null) {
                    await dbHelper.insertNote(
                      Note(title: title, content: content, date: date),
                    );
                  } else {
                    await dbHelper.updateNote(
                      Note(
                        id: note.id,
                        title: title,
                        content: content,
                        date: date,
                      ),
                    );
                  }
                  _loadNotes();
                  Navigator.pop(context);
                }
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _deleteNote(int id) async {
    await dbHelper.deleteNote(id);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catatan')),
      body:
          notes.isEmpty
              ? Center(child: Text('Tidak ada catatan'))
              : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(
                        '${note.date}\n${note.content}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      isThreeLine: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteDetailScreen(note: note),
                          ),
                        );
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _showForm(note: note),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteNote(note.id!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showForm(),
      ),
    );
  }
}
