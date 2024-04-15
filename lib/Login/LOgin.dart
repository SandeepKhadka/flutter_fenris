import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Login/Signup.dart';
import 'package:keyboard/controller/authentication_controller.dart';
import 'package:keyboard/newAdded/CustomValidator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blueAccent,
                Colors.blue,
                Colors.indigo,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            validator: (value) =>
                                Validator.validateEmail(value!),
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your email",
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter your password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
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
                          ElevatedButton(
                            onPressed: () {
                              var isValid = formKey.currentState!.validate();
                              if (isValid) {
                                var data = {
                                  'email': emailController.text,
                                  'password': passwordController.text
                                };

                                Get.find<AuthenticationController>()
                                    .signIn(data, context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                            ),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // TextButton(
                          //   onPressed: () {
                          //     Get.to(ForgotPassword());
                          //   },
                          //   child: Text(
                          //     "Forgot Password?",
                          //     style: TextStyle(
                          //       color: Colors.blue,
                          //       fontSize: 16,
                          //     ),
                          //   ),
                          // )

                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  Get.to(SignupPage());
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
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
