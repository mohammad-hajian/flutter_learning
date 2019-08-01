import 'dart:async';
import 'dart:io';
import 'package:flutter_app/models/noToDoItem_11.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  static final DatabaseClient _instance = new DatabaseClient.internal();

  factory DatabaseClient() => _instance;
  final String tableItem = 'tableItem';
  final String columnId = 'id';
  final String columnItemName = 'itemName';
  final String columnDateCreate = 'dateCreate';

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseClient.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(
        documentDirectory.path, "todo_db.db"); //home://directory/files/todo_db.db

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }
  
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableItem($columnId INTEGER PRIMARY KEY, $columnItemName TEXT, $columnDateCreate TEXT)");
  }

  //CRUD -CREATE, READ, UPDATE, DELETE

  //insert NoToDoItem
  Future<int> saveNoToDoItem(NoToDoItem item) async {
    Database dbClient = await db;
    int res = await dbClient.insert('$tableItem', item.toMap());
    return res;
  }

  //get NoToDoItem
  Future<List> getAllItems() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery('SELECT * FROM $tableItem');
    return res.toList(); //تو لیست، برای اطمینان است
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableItem'));
  }

  Future<NoToDoItem> getItem(int id) async{
    var dbClient = await db;
    var res = await dbClient.rawQuery('SELECT * FROM $tableItem WHERE $columnId = $id');
    if (res.length == 0) return null;
    return new NoToDoItem.fromMap(res.first);
  }

  Future<int> deleteItem(int id) async{
    var dbClient = await db;
    return await dbClient.delete('$tableItem', where:'$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateItem(NoToDoItem item) async {
    var dbClient = await db;
    return await dbClient.update('$tableItem', item.toMap(), where: "$columnId = ?", whereArgs: [item.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
