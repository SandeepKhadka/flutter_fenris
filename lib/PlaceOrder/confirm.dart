import 'package:flutter/material.dart';
import 'package:keyboard/Pages/homepage.dart';

class OrderSuccessful extends StatelessWidget {
  const OrderSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: Image.asset(
              "assets/done.png",
              height: MediaQuery.of(context).size.height * 0.5, // 50%
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: const Text(
              "Order Successful",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '''Your Order has Been Placed Successfully''',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                padding: EdgeInsets.only(left: 100, right: 100),
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Text(
                "Back to home",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
