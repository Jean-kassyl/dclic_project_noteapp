import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Note {
  final int? id;
  final String titre;
  final String note;
  final int? userId;

  Note({this.id,this.userId, required this.titre, required this.note, });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'note': note,
      'userId': userId
    };
  }

  factory Note.fromMap(Map<String, dynamic> map){
    return Note(
      id: map['id'],
      titre: map['titre'],
      note: map['note'],
      userId: map['userId']
    );
  }
}


class NoteDatabaseManager {
  Database? _db;

  Future<Database> get db async{
    if(_db != null) return _db!;
    return await initDb();
    
  }


  Future<Database> initDb() async{
    return openDatabase(
      join(await getDatabasesPath(), 'notes_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          """ 
            CREATE TABLE notes (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              titre TEXT,
              note TEXT,
              userId INTEGER,
              FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
            )
          """
          
        );
      }
    );
  }

  Future<void> deleteMyDb() async{
    final path = join(await getDatabasesPath(), 'notes_database.db');
    await deleteDatabase(path);
  }

  Future<List<Note>> getAllNotes(int? usrId) async{
    Database dbase = await db;
    List<Map<String, dynamic>> maps = await dbase.rawQuery(
     ''' 
      SELECT * FROM notes WHERE userId = $usrId
     '''
    );
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  Future<void> insertNote(Note note) async{
    Database dbase = await db;
    await dbase.insert('notes', note.toMap());
  }

  Future<void> updateNote(Note note) async {
    Database dbase = await db;
    await dbase.update('notes',note.toMap(), where: 'id = ?', whereArgs: [note.id] );
  }

  Future<void> deleteNote(int? id) async{
    Database dbase = await db;
    dbase.delete('notes', where: 'id = ?', whereArgs: [id]);
  }


}