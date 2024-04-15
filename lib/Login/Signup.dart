import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Login/LOgin.dart';
import 'package:keyboard/controller/authentication_controller.dart';
import 'package:keyboard/newAdded/CustomValidator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  bool passwordError = false;
  bool obscureText = false;
  late Timer _visibilityTimer =
      Timer(Duration(seconds: 0), () {}); // Initialize with a default value

  @override
  void dispose() {
    _visibilityTimer.cancel();
    super.dispose();
  }

  //password visiblity
  void _toggleVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  //password visibility timer
  void _startVisibilityTimer() {
    _visibilityTimer = Timer(Duration(seconds: 2), () {
      setState(() {
        obscureText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: ClipPath(
          clipper: ClippingClass(),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue[300] ?? Colors.blue,
                  Colors.blue[600] ?? Colors.blue,
                  Colors.blue[900] ?? Colors.blue,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Enter your email",
                                  hintText: "@gmail.com",
                                  prefixIcon: Icon(Icons.email_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                validator: (value) =>
                                    Validator.validateEmail(value!),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: "Enter your Full Name",
                                  hintText: "Name",
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                validator: (value) =>
                                    Validator.validateName(value!),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  labelText: "Enter your Phone Number",
                                  hintText: "Mobile",
                                  prefixIcon: Icon(
                                    Icons.phone_iphone_rounded,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    Validator.validateMobile(value!),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: obscureText,
                                decoration: InputDecoration(
                                  labelText: "Enter your password",
                                  hintText: "******",
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
                                validator: (value) =>
                                    Validator.validatePasswordLength(value!),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: newpasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Enter re-enter your password",
                                  hintText: "******",
                                  prefixIcon: Icon(Icons.lock),
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
                                  if (value != passwordController.text) {
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
                              SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "By signing up, you've agreed to our",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Text(
                                      " terms and conditions",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      var data = {
                                        'email': emailController.text,
                                        'password': passwordController.text,
                                        'name': nameController.text,
                                        'phone': phoneController.text
                                      };
                                      print(data);
                                      Get.find<AuthenticationController>()
                                          .signUp(data, context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 15),
                                  ),
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an Account?"),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                      child: Text("Login"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset:
          true, // This line ensures the page resizes to avoid bottom overflow
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
