import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:keyboard/Login/LOgin.dart';
import 'package:keyboard/checkout/final_order.dart';
import 'package:keyboard/controller/user_Controller.dart';

import 'package:keyboard/drawerwidget/details.dart';
import 'package:keyboard/drawerwidget/location.dart';
import 'package:keyboard/drawerwidget/orders.dart';
import 'package:keyboard/model/getCategory.dart';
import 'package:keyboard/model/userDetails.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    Get.find<UserController>().userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Details"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyDetails()),
                );
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage("assets/order.png"),
              ),
              title: Text("My Orders"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Orders()));
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("My Address"),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => AddressWidget()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("My Payment"),
              onTap: () {
                // Add your payment method logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text("Coupon Code"),
              onTap: () {
                // Add your promo code logic here
              },
            ),

            // ListTile(
            //   leading: Icon(Icons.help),
            //   title: Text("Help"),
            //   onTap: () => Get.to(HelpPage()),
            // ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPage()));
                          },
                          child: Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
