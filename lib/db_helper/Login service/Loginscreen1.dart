import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garments/Firebase%20Auth.dart';
import 'package:garments/Homescreen.dart';
import 'package:garments/Snackbar.dart';
import 'package:garments/common/common%20Size.dart';
import 'package:garments/common/common%20Textstyle.dart';
import 'package:get/get.dart';
import 'Login split.dart';

class Loginscreen1 extends StatefulWidget {
  const Loginscreen1({super.key});

  @override
  State<Loginscreen1> createState() => _Loginscreen1State();
}

class _Loginscreen1State extends State<Loginscreen1> {
  final FirebaseAuthservice _auth = FirebaseAuthservice();

  TextEditingController useremail = TextEditingController();
  TextEditingController userpassword = TextEditingController();
  TextEditingController userregisteremail = TextEditingController();
  TextEditingController userregisterpassword = TextEditingController();
  TextEditingController userregisternumber = TextEditingController();
  TextEditingController userregistername = TextEditingController();
  int container = 0;
  bool toggle = false;
  bool issign = false;
  bool issignup = false;

  @override
  void dispose() {
    useremail.dispose();
    userpassword.dispose();
    userregistername.dispose();
    userregisterpassword.dispose();
    userregisteremail.dispose();
    userregisternumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/garments.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: displayheight(context) * 0.20,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      container == 0
                          ? "Welcome Back To  Login"
                          : "Welcome To Registration",
                      style: producttxt,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: displayheight(context) * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            container = 0;
                          });
                        },
                        child: Container(
                          height: displayheight(context) * 0.07,
                          width: displaywidth(context) * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: container == 0 ? Colors.grey : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "User Login",
                              style:
                                  container == 0 ? producttxtwhite : producttxt,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            container = 1;
                          });
                        },
                        child: Container(
                          height: displayheight(context) * 0.07,
                          width: displaywidth(context) * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: container == 1 ? Colors.grey : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "User Registeration",
                              style:
                                  container == 1 ? producttxtwhite : producttxt,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (container == 0) user() else userregister(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                  onPressed: () {
                    Get.to(const Loginsplit());
                  },
                  child: Center(child: Text("Back To Home", style: producttxt)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget user() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: displayheight(context) * 0.45,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey.withOpacity(0.5),
              Colors.grey.withOpacity(0.5),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("User Login", style: producttxt),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: useremail,
                cursorColor: Colors.black,
                style: producttxt,
                decoration: InputDecoration(
                  labelText: "Email Id",
                  labelStyle: producttxt,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: userpassword,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                obscureText: toggle ? true : false,
                onTap: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
                style: producttxt,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: producttxt,
                  suffixIcon: Icon(
                    toggle ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                height: 40,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: signIn,
                  // (){
                  // if(useremail.text.isEmpty){
                  //   StackDialog.show("Besolve Services", "Please Enter Email", Icons.email, Colors.black);
                  // }
                  // else if(userpassword.text.isEmpty){
                  //   StackDialog.show("Besolve Services", "Please Enter Password", Icons.password, Colors.black);
                  // }
                  // else{
                  //   StackDialog.show("Besolve Services", "Incorrect Email and Password ", Icons.verified, Colors.black);
                  // }
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Userscreen()));
                  // }
                  child: Center(child: Text("Login", style: producttxt)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userregister() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
      child: Container(
        height: displayheight(context) * 0.55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey.withOpacity(0.5),
              Colors.grey.withOpacity(0.5),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Registration", style: producttxt),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: userregistername,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                style: producttxt,
                decoration: InputDecoration(
                  labelText: "Customer ID",
                  labelStyle: producttxt,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: userregisteremail,
                cursorColor: Colors.black,
                style: producttxt,
                decoration: InputDecoration(
                  labelText: "Email Id",
                  labelStyle: producttxt,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: userregisterpassword,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                obscureText: toggle ? true : false,
                onTap: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
                style: producttxt,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: producttxt,
                  suffixIcon: Icon(
                    toggle ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: userregisternumber,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                style: producttxt,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  labelStyle: producttxt,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: signup,
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Woregisterscreen()));
                  child: Center(child: Text("Register", style: producttxt)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signup() async {
    String email = userregisteremail.text;
    String password = userregisterpassword.text;

    User? user = await _auth.signinwithEmailandPassword(email, password);

    if (user == null) {
      StackDialog.show(
        "Style Mix",
        "Required Field is Empty",
        Icons.person,
        Colors.black,
      );
    } else {
      StackDialog.show(
        "Style Mix",
        "Account Has Been Sucessfully Created",
        Icons.verified_outlined,
        Colors.black,
      );
      userregistername.text = '';
      userregisteremail.text = '';
      userregisterpassword.text = '';
      userregisternumber.text = '';
    }
  }

  void signIn() async {
    String email = useremail.text;
    String password = userpassword.text;

    User? user = await _auth.signUpwithEmailandPassword(email, password);

    if (user == null) {
      print("somehing error");
      StackDialog.show(
        "Style Mix",
        "Incorrect Email and Password",
        Icons.verified_outlined,
        Colors.black,
      );
    } else {
      StackDialog.show(
        "Style Mix",
        "Sucessfully Logged In",
        Icons.verified_outlined,
        Colors.black,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
      print("User is created");
    }
  }
}
