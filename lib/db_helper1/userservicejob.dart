import 'package:garments/db_helper1/repository_job.dart';
import 'User1.dart';

class Userservicejob{
  late Repositoryjob repositoryjob;

  Userservicejob(){
    repositoryjob=Repositoryjob();
  }
//save user
  SaveUser(Userjob userjob)async{
    return await repositoryjob.insertData("users1", userjob.userMap());
  }

  //read all users
 readaallusers()async{
    return await repositoryjob.readdata('users1');
}

//delete user
  deleteUser(userId) async{
    return await repositoryjob.deleteDataById('users1', userId);
  }
}