
import 'package:sqflite/sqflite.dart';
import 'database_connection.dart';

class Respository{
  late DatabaseConnection _databaseConnection;

  Respository(){
    _databaseConnection=DatabaseConnection();
  }
  static Database ? _database;
  Future<Database?> get database async{
    if(_database !=null){
      return _database;
    }else{
      _database=await _databaseConnection.setDatabase();
      return _database;
    }
  }

  ///insert user
insertData(table,data)async{
    var connection=await database;
    return await connection?.insert(table, data);
}

///read data
readdata(table)async{
    var connection=await database;
    return await connection?.query(table);
}

///update user
updateData(table,data) async{
    var connection=await database;
    return await connection?.update(table, data,where: 'id=?',whereArgs: [data['id']]);
}

///delete user
deleteDataById(table,itemId)async{
    var connection=await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
}
}