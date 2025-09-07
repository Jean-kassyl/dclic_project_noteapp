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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password']
    );
  }

  bool checkPassword(String pw) {
    return password == pw;
  }
}



class UserDatabaseManager {
  Database? _db;

  Future<Database> get database async{
    if(_db != null) return _db!;
    Database db = await initDb();
    return db;
  }

  Future<Database> initDb() async{
    return await openDatabase(
      join(await getDatabasesPath(), 'users_database.db'),
      version: 1,
      onCreate: (db, version){
        return db.execute(
          """ 
            CREATE TABLE users (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              username TEXT,
              password TEXT
            );
          """
        );
      } 
    );
  }

  Future<void> insertUser(User user) async{
    Database db = await database;
    await db.insert(
      'users',
      user.toMap()
    );
   }

  Future<void> deleteUser(int? id) async{
    Database db = await database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id]

    );
  }

  Future<List<User>> getAllUsers() async{
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(
      maps.length,
      (i) => User.fromMap(maps[i])
    );
   
  }

  Future<int?> getIdByName(String username) async{
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.rawQuery(
      ''' 
        SELECT * FROM users WHERE username = '$username' LIMIT 1;
      '''
    );
    List<User> users = List.generate(maps.length, (i) => User.fromMap(maps[i]));
    if(users != []) return users[0].id;
    return null;
  }

}