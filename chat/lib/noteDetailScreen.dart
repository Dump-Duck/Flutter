import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'noteProvider.dart';
import 'note.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note? note;

  NoteDetailScreen({this.note});

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
        backgroundColor: Color.fromARGB(255, 217, 198, 105),
        actions: [
          if (widget.note != null)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _confirmDelete(context), // Gọi hàm xác nhận xóa
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
                maxLines: null,
                expands: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final title = _titleController.text;
          final content = _contentController.text;
          if (widget.note == null) {
            Provider.of<NoteProvider>(context, listen: false).addNote(title, content);
          } else {
            Provider.of<NoteProvider>(context, listen: false).updateNote(widget.note!.id, title, content);
          }
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng hộp thoại mà không làm gì
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Provider.of<NoteProvider>(context, listen: false).deleteNote(widget.note!.id); // Xóa ghi chú
                Navigator.of(context).pop(); // Đóng hộp thoại xác nhận
                Navigator.of(context).pop(); // Quay lại màn hình trước đó
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
