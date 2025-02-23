import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection{

  Future<Database> setDatabase()async{
    var directory=await getApplicationDocumentsDirectory();
    var path=join(directory.path,'db_crud');

    var database=await openDatabase(path,version: 1,onCreate:_createDatabase );
    return database;
  }

  Future<void> _createDatabase(Database database,int version)async{

    String sql="CREATE TABLE users(id INTEGER PRIMARY KEY,fullname TEXT,jobtitle TEXT,skills TEXT,experience TEXT,city TEXT,number TEXT,gender TEXT,costdays TEXT)";
    await database.execute(sql);
  }
}