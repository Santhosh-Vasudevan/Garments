import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection2{

  Future<Database> setDatabase()async{
    var directory=await getApplicationDocumentsDirectory();
    var path=join(directory.path,'db_crud1');

    var database=await openDatabase(path,version: 1,onCreate:_createDatabase );
    return database;
  }

  Future<void> _createDatabase(Database database,int version)async{

    String sql="CREATE TABLE students(id INTEGER PRIMARY KEY,fullname TEXT,jobtitle TEXT,skills TEXT,experience TEXT,city TEXT,number TEXT,gender TEXT,costdays TEXT)";
    await database.execute(sql);
  }
}