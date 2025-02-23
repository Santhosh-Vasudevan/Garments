import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';



class DatabaseConnectionjob{

  Future<Database>setDatabase()async{
    var directory=await getApplicationDocumentsDirectory();
    var path = join(directory.path,'db_crud2');
    var database=await openDatabase(path,version: 1,onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database,int version)async{

    String sql="CREATE TABLE users1(id INTEGER PRIMARY KEY,name TEXT,number TEXT,email TEXT,skills TEXT,qualification TEXT,city TEXT,state TEXT)";

    await database.execute(sql);
  }
}