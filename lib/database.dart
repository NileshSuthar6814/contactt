import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:contact/contact.dart';
class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();
  static Database? _database;

  Future<Database> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final Database db =
    await openDatabase(join(await getDatabasesPath(), 'contact_app.db'),
        onCreate: (Database db, int version) {
          db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        body INT,
        creationDate INT
      );
      ''');
        }, version: 1);
    return db;
  }

  Future<void> addNewNote(NoteModel note) async {
    final Database db = await database;
    db.insert('notes', note.map(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, Object?>>?> getNotes() async {
    final Database db = await database;
    final List<Map<String, Object?>> res = await db.query('notes');
    if (res.isEmpty) {
      return null;
    } else {
      final List<Map<String, Object?>> resultMap = res.toList();
      return resultMap.isNotEmpty ? resultMap : null;
    }
  }
}
