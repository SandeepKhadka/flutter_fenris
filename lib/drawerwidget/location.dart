import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:keyboard/Pages/homepage.dart';
import 'package:keyboard/controller/update_profile_Controller.dart';
import 'package:keyboard/controller/user_Controller.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    nameController.text = Get.find<UserController>().userName;
    emailController.text = Get.find<UserController>().email;
    phoneController.text = Get.find<UserController>().phone;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Your Profile"),
        backgroundColor:
            Colors.white, // Change app bar background color if needed
        // You can customize the app bar further here
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Name"),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                Text("Email"),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                Text("Phone"),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // TextFormField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: "Address",
                //   ),
                // ),
                // SizedBox(height: 20),
                // TextFormField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: "City",
                //   ),
                // ),
                // SizedBox(height: 20),
                // TextFormField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: "State/Province/Region",
                //   ),
                // ),
                SizedBox(height: 20),
                // TextFormField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: "Zip Code (Postal Code)",
                //   ),
                // ),
                SizedBox(height: 60),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      var data = {
                        'name': nameController.text,
                        'email': emailController.text,
                        'contactno': phoneController.text,
                      };
                      Get.find<UpdateProfileController>()
                          .updateYourProfile(data, context);
                      // Get.put(UpdateProfileController()
                      //     .updateYourProfile(data, context));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      textStyle: TextStyle(fontSize: 20),
                      elevation: 20,
                      shadowColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    child: Text(
                      "Update Profile",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
