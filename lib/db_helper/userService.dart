
import 'User.dart';
import 'repository.dart';

class UserService{
  late Respository _respository;

  UserService(){
    _respository=Respository();
  }
  SaveUser(User user)async{
    return await _respository.insertData('users', user.userMap());
  }

  //Read all users
readAllUsers()async{
    return await _respository.readdata('users');
}
//delete item
  deleteUser(userId) async{
    return await _respository.deleteDataById('users', userId);
  }

  //update user
updateuser(User user)async{
    return await _respository.updateData('users', user.userMap());
}
}