import 'package:flutter/material.dart';
import 'package:garments/common/common%20Size.dart';
import 'package:garments/common/common%20Textstyle.dart';
import 'package:get/get.dart';
import 'Login screen.dart';
import 'Loginscreen1.dart';

class Loginsplit extends StatefulWidget {
  const Loginsplit({super.key});

  @override
  State<Loginsplit> createState() => _LoginsplitState();
}

class _LoginsplitState extends State<Loginsplit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.brown.shade700,
                Colors.brown.shade500,
                Colors.brown.shade300,
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: displayheight(context) * 0.30,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 120,
                    backgroundImage: AssetImage("assets/icon1.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("Welcome To Style Mix", style: producttxtwhite),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            // Get.to(Adminscreen());
                            Get.to(const Loginscreen());
                          },
                          child: Container(
                            height: displayheight(context) * 0.25,
                            width: displaywidth(context) * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: AssetImage(
                                  "assets/profile.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Text("Admin Login", style: producttxtwhite),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            // Get.to(Homescreen());
                            Get.to(Loginscreen1());
                          },
                          child: Container(
                            height: displayheight(context) * 0.25,
                            width: displaywidth(context) * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: AssetImage(
                                  "assets/profile.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Text("Users Login", style: producttxtwhite),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
