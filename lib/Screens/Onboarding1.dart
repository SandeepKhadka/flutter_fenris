import 'package:flutter/material.dart';
import 'package:keyboard/Screens/Onboarding4.dart';

class Onboarding1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.lightBlue,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ), // Adjust top padding as needed
                  child: Image.asset(
                    'assets/o1.png', // Update with your image file path
                    height:
                        screenSize.height * 0.4, // Adjust the height as needed
                    width: screenSize.width * 0.8, // Adjust the width as needed
                  ),
                ),
              ),
              SizedBox(height: 10), // Adjust the height as needed
              Text(
                "Welcome To Fresh Picks",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Fresh Grocery and Dairy products",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                textHeightBehavior: TextHeightBehavior(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Positioned(
            top: 40.0,
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
