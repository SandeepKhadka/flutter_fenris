// import 'package:go_freshup/webadmin/webwidgets/SiteLayout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/services/auth_service.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    super.initState();
    checkIfLoggedIn();
  }

  checkIfLoggedIn() async {
    AuthService authService = AuthService();
    var token = await authService.getToken();

    if (token != null) {
      var role = await authService.getRole();

      // switch (role) {
      //   case 'merchant':
      //     Get.offAll(() => VendorSiteLayout());
      //     break;
      //   case 'admin':
      //     Get.offAll(() => SiteLayout());
      //     break;
      //   default:
      //     Get.offAll(() => MyHomePage());
      // }
    } else {
      // Get.offAll(SignIn());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
