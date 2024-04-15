import 'package:flutter/material.dart';
import 'package:keyboard/Login/Reset.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green[300] ?? Colors.green,
                Colors.green[600] ?? Colors.green,
                Colors.green[900] ?? Colors.green,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60,
                                child: Text(
                                  "Verification Code",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                              "A 4 digit code has been sent to +977 97******25"),
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 4; i++) _buildOtpTextField(i),
                          ],
                        ),
                        SizedBox(height: 80),
                        _buildSubmitButton(),
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

  Widget _buildOtpTextField(int index) {
    return Container(
      width: 50,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextFormField(
          controller: _controllers[index],
          autofocus: index == 0,
          onChanged: (value) {
            if (value.length == 1) {
              if (index < 3) {
                // Move focus to the next TextField when a digit is entered
                FocusScope.of(context).nextFocus();
              } else {
                // The last digit is entered, submit the form
                _submitForm();
              }
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.green),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a digit';
            } else if (value.length != 1) {
              return 'Invalid digit format';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // All OTP fields are filled, navigate to ResetPassword screen
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ResetPassword()));
        } else {
          // Show error message if OTP fields are not filled
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please enter the complete OTP'),
            ),
          );
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
        "Verify",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // All OTP fields are filled, you can perform your verification logic here
      // For example, you can concatenate the OTP and compare it with the expected value
      String otp = _controllers.map((controller) => controller.text).join();
      print('Entered OTP: $otp');
    }
  }
}
