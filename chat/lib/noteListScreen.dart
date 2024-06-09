import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'noteProvider.dart';
import 'noteDetailScreen.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Color.fromARGB(255, 217, 198, 105),
      ),
      body: noteProvider.notes.isEmpty 
      ? const Center(
        child: Text('Your List Notes Are Empty',
        style: TextStyle(fontStyle: FontStyle.italic)
        ),
      )
      : ListView.separated(
        itemCount: noteProvider.notes.length,
        itemBuilder: (context, index) {
          final title = noteProvider.notes[index].title.isNotEmpty ? noteProvider.notes[index].title : "Không có tiêu đề";
          return ListTile(
            title: Text(title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NoteDetailScreen(note: noteProvider.notes[index]),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteDetailScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
