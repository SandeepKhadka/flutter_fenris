import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/PlaceOrder/confirm.dart';

class FinalOrder extends StatefulWidget {
  final String selectedLocation;

  const FinalOrder({Key? key, required this.selectedLocation});

  @override
  State<FinalOrder> createState() => _FinalOrderState();
}

class _FinalOrderState extends State<FinalOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
          ),
        ),
        title: Text("Your Order"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    title: Text(
                      "Deliver To: ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Prajal Jung Kunwar",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Delivery",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget
                              .selectedLocation, // Display selected location here
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Payment",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Khalti",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Phone Number",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "9856012549",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderSuccessful()));
                },
                child: Text('Confirm Order'))
          ],
        ),
      ),
    );
  }
}
