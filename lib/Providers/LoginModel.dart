import 'package:flutter/cupertino.dart';

class LoginModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obsecureText = true;

  void tooglePasswordVisibilityoff() {
    obsecureText = !obsecureText;
    notifyListeners();
  }
}
