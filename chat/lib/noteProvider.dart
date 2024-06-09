import 'package:flutter/material.dart';
import 'note.dart';
import 'database_helper.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  NoteProvider() {
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await DatabaseHelper.instance.getNotes();
    _notes = notes;
    notifyListeners();
  }

  void addNote(String title, String content) async {
    final note = Note(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      content: content,
    );
    await DatabaseHelper.instance.insert(note);
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(int id, String title, String content) async {
    final note = Note(
      id: id,
      title: title,
      content: content,
    );
    await DatabaseHelper.instance.update(note);
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index] = note;
      notifyListeners();
    }
  }

  void deleteNote(int id) async {
    await DatabaseHelper.instance.delete(id);
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}
