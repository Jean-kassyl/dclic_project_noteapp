import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Note {
  final int? id;
  final String titre;
  final String note;

  Note({required this.id, required this.titre, required this.note});
  Note.sansId({this.id, required this.titre, required this.note});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'note': note
    };
  }

  factory Note.fromMap(Map<String, dynamic> map){
    return Note(
      id: map['id'],
      titre: map['titre'],
      note: map['note']
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
              note Text
            )
          """
          
        );
      }
    );
  }
}