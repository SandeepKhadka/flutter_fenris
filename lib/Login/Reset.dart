import 'dart:async';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key});

  @override
  State<ResetPassword> createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool passwordError = false;
  bool obscureText = false;
  late Timer _visibilityTimer;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _visibilityTimer.cancel();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _startVisibilityTimer() {
    _visibilityTimer = Timer(Duration(seconds: 2), () {
      setState(() {
        obscureText = true;
      });
    });
  }

  void _submitForm() {
    // Validate the form
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, you can proceed with your logic
      // For example, updating the password
    }
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
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: Form(
                    key: _formKey,
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
                                  "Reset password",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              TextFormField(
                                controller: newpasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Enter Your New Password",
                                  hintText: "******",
                                  prefixIcon: Icon(Icons.lock_outline,
                                      semanticLabel: "Password"),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: confirmpasswordController,
                                obscureText: obscureText,
                                decoration: InputDecoration(
                                  labelText: "Enter your password",
                                  hintText: "your password",
                                  errorText: passwordError
                                      ? "Password doesn't Match"
                                      : null,
                                  prefixIcon: Icon(Icons.lock,
                                      semanticLabel: 'Password'),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _toggleVisibility();
                                        _startVisibilityTimer();
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  if (value != newpasswordController.text) {
                                    setState(() {
                                      passwordError = true;
                                    });
                                    return 'Password doesn\'t match';
                                  }
                                  setState(() {
                                    passwordError = false;
                                  });
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            // Check if the form is valid before navigating
                            if (_formKey.currentState?.validate() ?? false) {
                              // Navigate to the new screen
                              Navigator.pushNamed(context, '/success');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[400],
                            padding: EdgeInsets.only(left: 100, right: 100),
                            textStyle: TextStyle(fontSize: 20),
                            elevation: 20,
                            shadowColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          child: Text(
                            "Reset",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
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
