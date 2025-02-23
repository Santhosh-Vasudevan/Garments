
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:garments/Snackbar.dart';
import 'package:garments/common/common%20Size.dart';
import 'package:garments/common/common%20Textstyle.dart';
import 'package:garments/db_helper/User.dart';
import 'package:garments/db_helper/userService.dart';
import 'package:get/get.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({Key? key}) : super(key: key);

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {

  final _userService = UserService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: getAllUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<User>? _userList = snapshot.data;
            if (_userList == null || _userList.isEmpty) {
              return const Center(child: Text('No product found.'));
            }
            return SingleChildScrollView(
              child: SizedBox(
                height: displayheight(context) * 0.80,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildUserItem(_userList[index]);
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildUserItem(User user) {
    String encodedImage = "${user.experience}";
    Uint8List bytes = base64Decode(encodedImage.split(',').last);
    Uint8List? _decodedImage = bytes.isNotEmpty ? bytes : null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            height: displayheight(context) * 0.20,
            width: displaywidth(context) * 0.40,
            child: _decodedImage == null
                ? Icon(Icons.image)
                : ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.memory(_decodedImage, fit: BoxFit.cover),
            ),
          ),
          Column(
            children: [
              Text("${user.id}", style: pricetxt),
              Text("${user.fullname}", style: producttxt),
              Text("${user.jobtitle}", style: producttxt),
              Text("${user.skills}", style: producttxt),
            ],
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                onTap: () {
                  _deletedialog(context, user.id);
                },
                child: Text("Delete", style: producttxt),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<List<User>> getAllUserDetails() async {
    var users = await _userService.readAllUsers();
    List<User> _userList = [];
    users.forEach((user) {
      var userModel = User();
      userModel.id = user['id'];
      userModel.fullname = user['fullname'];
      userModel.jobtitle = user['jobtitle'];
      userModel.skills = user['skills'];
      userModel.experience = user['experience'];
      userModel.city = user['city'];
      _userList.add(userModel);
    });
    return _userList;
  }

  _deletedialog(BuildContext context, userId) {
    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "No",
                style: producttxt,
              ),
            ),
            TextButton(
              onPressed: () async {
                var result = await _userService.deleteUser(userId);
                if (result != null) {
                  setState(() {}); // Trigger rebuild after deletion
                }
                Get.back();
              },
              child: Text(
                "Yes",
                style: producttxt,
              ),
            )
          ],
          title: Text(
            "Are you sure you want to Delete!",
            style: producttxt,
          ),
        );
      },
    );
  }
}

// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:garments/Snackbar.dart';
// import 'package:garments/common/common%20Size.dart';
// import 'package:garments/common/common%20Textstyle.dart';
// import 'package:garments/db_helper/User.dart';
// import 'package:garments/db_helper/userService.dart';
// import 'package:get/get.dart';
//
// class Productscreen extends StatefulWidget {
//   const Productscreen({super.key});
//
//   @override
//   State<Productscreen> createState() => _ProductscreenState();
// }
//
// class _ProductscreenState extends State<Productscreen> {
//
//   List<User>_userList = [];
//   final _userService = UserService();
//
//
//   Uint8List ?_decodedImage;
//   String ?encodedImage;
//
//   getAllUserDetails() async {
//     var users = await _userService.readAllUsers();
//     _userList = <User>[];
//     users.forEach((user) {
//       setState(() {
//         var userModel = User();
//         userModel.id = user['id'];
//         userModel.fullname = user['fullname'];
//         userModel.jobtitle = user['jobtitle'];
//         userModel.skills = user['skills'];
//         userModel.experience = user['experience'];
//         userModel.city = user['city'];
//         _userList.add(userModel);
//       });
//     });
//   }
//
//
//
//   @override
//   void initState() {
//     getAllUserDetails();
//     super.initState();
//   }
//   _deletedialog(BuildContext context,userId){
//     return showDialog(context: context, builder: (param){
//       return AlertDialog(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30)
//         ),
//         actions: [
//           TextButton(onPressed: (){
//             Get.back();}, child: Text("No",style:producttxt),
//           ),
//           TextButton(onPressed: ()async{
//             var result=await _userService.deleteUser(userId);
//             if(result !=null){
//               getAllUserDetails();
//             }
//             Get.back();
//
//           },
//             child: Text("Yes",style:producttxt ,),
//           )
//         ],
//         title: Text("Are you sure you want to Delete!",style: producttxt,),
//       );
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: displayheight(context) * 0.80,
//           width: double.infinity,
//           child: _userList.isEmpty?const Center(child:CircularProgressIndicator(),):ListView.builder(
//               itemCount: _userList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 encodedImage="${_userList[index].experience}";
//                 Uint8List bytes = base64Decode(encodedImage!.split(',').last);
//                   _decodedImage = bytes;
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                           height: displayheight(context)*0.20,
//                           width: displaywidth(context)*0.40,
//                           child: _decodedImage==null?const Icon(Icons.image):ClipRRect(borderRadius:BorderRadius.circular(30),child: Image.memory(_decodedImage!,fit: BoxFit.cover,))),
//                       Column(
//                         children: [
//                           Text("${_userList[index].id}", style: pricetxt,),
//                           Text("${_userList[index].fullname}", style: producttxt,),
//                           Text("${_userList[index].jobtitle}", style: producttxt,),
//                           Text("${_userList[index].skills}", style: producttxt,),
//
//                         ],
//                       ),
//
//                       PopupMenuButton(
//                           itemBuilder: (BuildContext context)=>[
//                             PopupMenuItem(
//                                 onTap:(){_deletedialog(context, _userList[index].id);},
//                                 child:Text("Delete",style: producttxt,)),
//                             // PopupMenuItem(child:Text("update",style: producttxt,))
//                           ])
//
//                     ],
//                   ),
//                 );
//
//               }),
//         ),
//       ),
//     );
//   }
//
// }