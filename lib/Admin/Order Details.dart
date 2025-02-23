import 'package:flutter/material.dart';
import 'package:garments/Snackbar.dart';
import 'package:garments/common/common%20Size.dart';
import 'package:garments/dbhelper2/userService2.dart';

import '../Common/Common Textstyle.dart';
import '../dbhelper2/User2.dart';

class Orderdetailsscreen extends StatefulWidget {
  const Orderdetailsscreen({super.key});

  @override
  State<Orderdetailsscreen> createState() => _OrderdetailsscreenState();
}

class _OrderdetailsscreenState extends State<Orderdetailsscreen> {

  var userservice2=UserService2();
  List<User2>_userlist=[];

  getallpaymentdetails()async{

    var users=await userservice2.readAllUsers();
    _userlist=<User2>[];
    users.forEach((user) {
      setState(() {
        var userModel = User2();
        userModel.id = user['id'];
        userModel.fullname = user['fullname'];
        userModel.jobtitle = user['jobtitle'];
        userModel.skills = user['skills'];
        userModel.experience = user['experience'];
        userModel.city = user['city'];
        userModel.number=user['number'];
        userModel.gender=user['gender'];
        userModel.costdays=user['costdays'];
        _userlist.add(userModel);
      });
    });
  }

  @override
  void initState(){
    getallpaymentdetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SizedBox(
        height: displayheight(context)*0.89,
        width: double.infinity,
        child: ListView.builder(
            itemCount: _userlist.length,
            itemBuilder: (BuildContext context,int index){
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              surfaceTintColor: Colors.transparent,
              elevation: 1,
              shadowColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order ID :",style: pricetxt,),
                              Text("Customer Name :",style: pricetxt,),
                              Text("Email ID :",style: pricetxt,),
                              Text("Mobile Number :",style: pricetxt,),
                              Text("Building No:",style: pricetxt,),
                              Text("City :",style: pricetxt,),
                              Text("State :",style: pricetxt,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${_userlist[index].id}", style: pricetxt,),
                              Text("${_userlist[index].fullname}", style: producttxt,),
                              Text("${_userlist[index].jobtitle}", style: producttxt,),
                              Text("${_userlist[index].skills}", style: producttxt,),
                              Text("${_userlist[index].experience}", style: producttxt,),
                              Text("${_userlist[index].city}", style: producttxt,),
                              Text("${_userlist[index].number}", style: producttxt,),
                            ],
                          ),
                        )

                      ],
                    ),
                    Text("Order Date & Time:",style: pricetxt,),
                    Text("${_userlist[index].gender}", style: producttxt,),
                    Text("Transaction ID:",style: pricetxt,),
                    Text("${_userlist[index].costdays}", style: producttxt,),

                    Center(child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black26,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            )
                          ),
                          onPressed: ()async{
                            StackDialog.show("Style Mix", "Order Delivered Successfully", Icons.verified, Colors.green);
                            var result=await userservice2.deleteUser(_userlist[index].id);
                            print(result);
                          }, child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Order Deliveryed",style: producttxtwhite,),
                          )),
                    ))
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
