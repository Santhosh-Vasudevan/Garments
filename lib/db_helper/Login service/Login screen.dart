import 'package:flutter/material.dart';
import 'package:garments/Admin/Adminscreen.dart';
import 'package:garments/Common/Common%20Textstyle.dart';
import 'package:garments/Snackbar.dart';
import 'package:garments/common/common%20Size.dart';
import 'package:get/get.dart';
import 'Login split.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final String adminemaillogin = "admin@123456.com";
  final String adminpasswordlogin = "123456";
  TextEditingController adminemail = TextEditingController();
  TextEditingController adminpassword = TextEditingController();

  bool toggle = false;
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
                      "Welcome Back To Admin Login",
                      style: producttxt,
                    ),
                  ),
                ),
              ),
              admin(),

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

  Widget admin() {
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
            Text("Admin Login", style: producttxt),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: adminemail,
                cursorColor: Colors.white,
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
                controller: adminpassword,
                keyboardType: TextInputType.text,
                cursorColor: Colors.white,
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
                  onPressed: () async {
                    if (adminemail.text.isEmpty) {
                      StackDialog.show(
                        "Style Mix",
                        "Please Enter Email",
                        Icons.email,
                        Colors.black,
                      );
                    } else if (adminpassword.text.isEmpty) {
                      StackDialog.show(
                        "Style Mix",
                        "Please Enter Password",
                        Icons.password,
                        Colors.black,
                      );
                    } else if (adminemail.text == adminemaillogin &&
                        adminpassword.text == adminpasswordlogin) {
                      StackDialog.show(
                        "Style Mix",
                        "Login Sucessfully",
                        Icons.verified,
                        Colors.black,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Adminscreen()),
                      );

                      // var shref=await SharedPreferences.getInstance();
                      // shref.setBool('admin',true);
                    } else {
                      StackDialog.show(
                        "Style Mix",
                        "Incorrect Email and Password ",
                        Icons.verified,
                        Colors.black,
                      );
                    }
                  },
                  child: Center(child: Text("Login", style: producttxt)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
