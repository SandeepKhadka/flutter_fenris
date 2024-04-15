import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/controller/user_Controller.dart';
import 'package:keyboard/drawerwidget/location.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            CircleAvatar(
                radius: 70,
                backgroundColor: Colors.blueGrey,
                child:
                    Image(image: AssetImage("assets/images/user-avatar.png"))),
            SizedBox(height: 30),
            _buildProfileItem(
              icon: Icons.person,
              title: "Name",
              subtitle: Get.find<UserController>().userName,
            ),
            SizedBox(height: 15),
            _buildProfileItem(
              icon: Icons.email,
              title: "Email Address",
              subtitle: Get.find<UserController>().email,
            ),
            SizedBox(height: 15),
            _buildProfileItem(
              icon: Icons.phone,
              title: "Phone Number",
              subtitle: Get.find<UserController>().phone,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.to(UpdateProfile()),
              child: Text(
                "Edit Profile",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.blueGrey),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }
}

// class UpdateProfile extends StatelessWidget {
//   const UpdateProfile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Update Profile"),
//       ),
//       body: Center(
//         child: Text(
//           "This is the update profile screen.",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
