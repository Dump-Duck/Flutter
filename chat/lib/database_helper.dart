import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'note.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE notes (
      id $idType,
      title $textType,
      content $textType
    )
    ''');
  }

  Future<void> insert(Note note) async {
    final db = await instance.database;

    await db.insert('notes', note.toMap());
  }

  Future<List<Note>> getNotes() async {
    final db = await instance.database;

    final maps = await db.query('notes');

    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  Future<void> update(Note note) async {
    final db = await instance.database;

    await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await instance.database;

    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
