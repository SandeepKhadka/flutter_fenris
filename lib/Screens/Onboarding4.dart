import 'package:flutter/material.dart';
import 'package:keyboard/Screens/l/s.dart';

class Onboarding4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 90),
          ),
          Image.asset(
            "assets/ob3.png",
            height: 350,
            width: 350,
          ),
          SizedBox(
            height: 200,
            width: 150,
          ),
          Align(
            alignment: Alignment.center,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            child: Text("Get Started"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(left: 50, right: 50),
              textStyle: TextStyle(fontSize: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000)),
            ),
          ),
        ],
      ),
      // child: Image.asset("bg.png"),
    );
  }
}
