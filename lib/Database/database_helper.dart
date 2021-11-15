import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _dbName = 'myDatabase.db';
  static final _dbversion = 1;
  static final _tablename = 'myTable';

  static final columnId = '_id';
  static final columnName = 'name';

  // making it a singleton class
  static final DatabaseHelper instance = DatabaseHelper();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_tablename(
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL)
      ''');
  }

// execute in Database [ it will return the data into map  like "_id":12,"name":"Saheb"]



Future<int> insert(Map<String,dynamic> row) async {
Database db = await instance.database;
return await db.insert(_tablename,row);
}

Future<List<Map<String,dynamic>>> queryAll()async{
Database db = await instance.database;
return await db.query(_tablename);
}

Future<int> update(Map<String,dynamic> row) async{
Database db = await instance.database;
int id = row[columnId];
return await db.update(_tablename,row,where: '$columnId=? ',whereArgs:[id]);
}

Future<int> delete(int id) async{
Database db = await instance.database;
return await db.delete(_tablename,where: '$columnId',whereArgs: [id]);
}



}
