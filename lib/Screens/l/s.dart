import 'package:flutter/material.dart';
import 'package:keyboard/Login/Login.dart';
import 'package:keyboard/Login/Signup.dart';
import 'package:keyboard/Providers/LoginModel.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var loginModel = Provider.of<LoginModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.srcOver,
            ),
            child: Image.asset(
              "assets/p.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    textStyle: TextStyle(fontSize: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text("Signup"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    textStyle: TextStyle(fontSize: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
