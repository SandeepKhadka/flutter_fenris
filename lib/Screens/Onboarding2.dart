import 'package:flutter/material.dart';
import 'package:keyboard/Screens/Onboarding3.dart';
import 'package:keyboard/Screens/Onboarding4.dart';

class Onboarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Image.asset(
                  'assets/ob2.png', // Update with your image file path
                  height: 400, // Adjust the height as needed
                  width: 500, // Adjust the width as needed
                ),
              ),
              SizedBox(height: 0.5),
              Text(
                "Grocery In Your Mobile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Shop For Groceries On Your Phone",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                textHeightBehavior: TextHeightBehavior(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Positioned(
            top: 30.0,
            right: 10.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Onboarding4()),
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
