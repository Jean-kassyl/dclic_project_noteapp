import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class User {
  final int? id ;
  final String username;
  final String password;

  User({this.id, required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password
    };
  }
}


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

  factory Note fromMap(Map<String, dynamic> map){
    return Note(
      id: map['id'],
      titre: map['titre'],
      note: map['note']
    );
  }
}

class DatabaseManager {
  final Database? _db;

  Future<Database> get database() async{
    if(_db != null) return _db;
    Database db = await initDb();
    return db;
  }

  Future<Database> initDb() async{
    return await openDatabase(
      join(await getDatabasesPath(), 'users_database.db'),
      
      version: 1,
      onCreate: (db, version){
        await db.create()
      } 
    );
    

  }
}