import 'package:flutter/material.dart';
import 'package:keyboard/Screens/Onboarding3.dart';
import 'package:keyboard/Screens/Onboarding4.dart';

class Onboarding3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/ob3.png', // Update with your image file path
                  height: 400, // Adjust the height as needed
                  width: 500, // Adjust the width as needed
                ),
              ),
              SizedBox(height: 0.5),
              Text(
                "Fast Delivery",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Delivery in your door step",
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
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
          ),
        ],
      ),
    );
  }
}
