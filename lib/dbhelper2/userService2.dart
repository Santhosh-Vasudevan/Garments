
import 'package:garments/dbhelper2/repository2.dart';

import 'User2.dart';

class UserService2{
  late Respository2 _respository2;

  UserService2(){
    _respository2=Respository2();
  }
  SaveUser(User2 user)async{
    return await _respository2.insertData('students', user.userMap2());
  }

  //Read all users
  readAllUsers()async{
    return await _respository2.readdata('students');
  }
//delete item
  deleteUser(userId) async{
    return await _respository2.deleteDataById('students', userId);
  }

  //update user
  updateuser(User2 user)async{
    return await _respository2.updateData('students', user.userMap2());
  }
}