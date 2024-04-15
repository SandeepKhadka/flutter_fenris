import 'package:flutter/material.dart';
import 'package:keyboard/Login/otp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.green[300] ?? Colors.green,
                Colors.green[600] ?? Colors.green,
                Colors.green[900] ?? Colors.green,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 70,
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Don't worry it happens. Please enter your email address associated with your account",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Enter Your Email",
                            hintText: "@gmail.com",
                            prefixIcon: Icon(Icons.email_outlined,
                                semanticLabel: "Email"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => Otp()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[400],
                              elevation: 20,
                              shadowColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
