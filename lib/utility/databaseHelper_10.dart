import 'dart:async';
import 'dart:io';
import 'package:flutter_app/models/User_10.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  final String tableUser = 'userTable';
  final String columnId = 'id';
  final String columnUsername = 'username';
  final String columnPassword = 'password';

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(
        documentDirectory.path, "maindb.db"); //home://directory/files/maindb.db

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  /*
        id |   username   | password
        ----------------------------
        1  |  mohammad | salam
        2  |     mahdi      | aliali
  */
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableUser($columnId INTEGER PRIMARY KEY, $columnUsername TEXT, $columnPassword TEXT)");
  }

  //CRUD -CREATE, READ, UPDATE, DELETE

  //insert user
  Future<int> saveUser(User user) async {
    Database dbClient = await db;
    int res = await dbClient.insert('$tableUser', user.toMap());
    return res;
  }

  //get user
  Future<List> getAllUsers() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery('SELECT * FROM $tableUser');
      return res.toList(); //تو لیست، برای اطمینان است
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableUser'));
  }

  Future<User> getUser(int id) async{
    var dbClient = await db;
    var res = await dbClient.rawQuery('SELECT * FROM $tableUser WHERE $columnId = $id');
    if (res.length == 0) return null;
    return new User.fromMap(res.first);
  }

  Future<int> deleteUser(int id) async{
    var dbClient = await db;
    return await dbClient.delete('$tableUser', where:'$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
    var dbClient = await db;
    return await dbClient.update('$tableUser', user.toMap(), where: "$columnId = ?", whereArgs: [user.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
