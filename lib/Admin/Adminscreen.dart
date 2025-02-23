import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:garments/Admin/Order%20Details.dart';
import 'package:garments/Admin/Productlist.dart';
import 'package:garments/common/Common%20color.dart';
import 'package:garments/common/common%20Textstyle.dart';
import 'package:garments/db_helper/User.dart';
import 'package:garments/db_helper/userService.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../db_helper/Login service/Login split.dart';

class Adminscreen extends StatefulWidget {
  const Adminscreen({Key? key}) : super(key: key);

  @override
  State<Adminscreen> createState() => _AdminscreenState();
}

class _AdminscreenState extends State<Adminscreen> {
  File? selectedImage;
  String? base64String;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? selectedProductName;
  final List<String> productList = ['child', 'male', 'female'];

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage == null) return;
    setState(() {
      selectedImage = File(pickedImage.path);
    });
    final imageBytes = await File(pickedImage.path).readAsBytes();
    base64String = base64Encode(imageBytes);
    print(base64String);
  }

  final _userService = UserService();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                logout();
              },
              icon: const Icon(Icons.logout, color: Colors.black),
            )
          ],
          title: Text(
            _currentIndex == 0 ? "Add Product" : _currentIndex == 1 ? "Order Details" : "Product List",
            style: appbartxt,
          ),
        ),
        body: _currentIndex == 0 ? home(context) : _currentIndex == 1 ? const Orderdetailsscreen() : const Productscreen(),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.add),
              title: const Text("Add Product"),
              selectedColor: primarycolor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.production_quantity_limits),
              title: const Text("Order List"),
              selectedColor: primarycolor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.production_quantity_limits),
              title: const Text("Product List"),
              selectedColor: primarycolor,
            ),
          ],
        ),
      ),
    );
  }

  Widget home(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Product Brand:", style: producttxt),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "example: Adidas",
                  hintStyle: producttxt,
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Product Name:", style: producttxt),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "example: shoes",
                  hintStyle: producttxt,
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Product Price:", style: producttxt),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  hintText: "example: 1000",
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  hintStyle: producttxt,
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Select Department", style: producttxt),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: SizedBox(
                height: 60,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Select Product Group",
                    hintStyle: producttxt,
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  value: selectedProductName,
                  onChanged: (newValue) {
                    setState(() {
                      selectedProductName = newValue;
                    });
                  },
                  items: productList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item, style: producttxt),
                    );
                  }).toList(),
                  dropdownColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Add Image:", style: producttxt),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    color: Colors.grey.shade300,
                  ),
                  child: selectedImage != null ? Image.file(selectedImage!, fit: BoxFit.cover) :  Center(child: Text("No image", style: producttxt)),
                ),
                const SizedBox(width: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(onPressed: () => pickImage(ImageSource.gallery), icon: const Icon(Icons.photo, color: Colors.black, size: 50)),
                      const SizedBox(height: 30),
                      IconButton(onPressed: () => pickImage(ImageSource.camera), icon: const Icon(Icons.camera_alt, color: Colors.black, size: 50)),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () async {
                      var user1 = User();
                      user1.fullname = _nameController.text;
                      user1.jobtitle = _titleController.text;
                      user1.skills = _priceController.text;
                      user1.experience = base64String.toString();
                      user1.city = selectedProductName.toString();
                      var result = await _userService.SaveUser(user1);
                      print(result);
                      _nameController.text = '';
                      _priceController.text = '';
                      _titleController.text = '';
                    },
                    child: Text("ADD DETAILS", style: producttxtwhite),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  logout() {
    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child:  Text("No", style: producttxt),
            ),
            TextButton(
              onPressed: () {
                Get.to(const Loginsplit());
              },
              child:  Text("Yes", style: producttxt),
            )
          ],
          title:  Text("Are you sure you want to Exit the Admin Page!", style: producttxt),
        );
      },
    );
  }
}
