import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:keyboard/Pages/homepage.dart';
import 'package:keyboard/controller/user_Controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import 'package:keyboard/newAdded/loading_dialog.dart';
import 'package:keyboard/newAdded/snackbar.dart';
import 'package:keyboard/newAdded/toast.dart';
import 'package:keyboard/services/auth_service.dart';

import '../services/auth_checker.dart';

class AuthenticationController extends GetxController {
  AuthService authService = AuthService();

  void signUp(data, BuildContext context) async {
    try {
      showLoadingDialog(context);

      var url = Uri.parse(SIGNUP_API);
      var response =
          await http.post(url, body: data).timeout(Duration(seconds: 10));

      var result = jsonDecode(response.body);

      print(result);

      bool status = result['status'];

      if (status) {
        hideLoadingDialog(context);
        AppSnackbar.showSuccess(context: context, message: result['message']);
        Get.back();
      } else {
        hideLoadingDialog(context);

        print(result['message']);
        AppSnackbar.showError(context: context, message: result['message']);
      }
    } on TimeoutException {
      hideLoadingDialog(context);
      AppSnackbar.showError(
          context: context,
          message: 'Request timeout. Please try again later.');
    } on SocketException catch (_) {
      hideLoadingDialog(context);
      AppSnackbar.showError(
          context: context,
          message: 'No internet connection. Please check your connection.');
    } on HttpException catch (e) {
      hideLoadingDialog(context);
      AppSnackbar.showError(
          context: context, message: 'Failed to load data: ${e.message}');
    } on FormatException catch (e) {
      hideLoadingDialog(context);
      AppSnackbar.showError(
          context: context, message: 'Invalid response: ${e.message}');
    } catch (e) {
      hideLoadingDialog(context);
      print('Error: $e');
      AppSnackbar.showError(
          context: context,
          message: 'An unexpected error occurred. Please try again later.');
    }
  }

  // signUp(data, BuildContext buildContext) async {
  //   var url = Uri.parse(SIGNUP_API);
  //   var response = await http.post(url, body: data);
  //   var result = jsonDecode(response.body);
  //   var success = result['status'];
  //   if (success) {
  //     Get.snackbar("Success", result['message'], backgroundColor: Colors.green);
  //   } else {
  //     Get.snackbar("Error", result['message'], backgroundColor: Colors.red);
  //   }
  // }

  // Future<void> signIn(data, BuildContext context) async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   // if (connectivityResult == ConnectivityResult.none) {
  //   //   print("No internet connection");
  //   //   return;
  //   // }

  //   var url = Uri.parse("http://gameon.ableinnovation.com.np/api/login");
  //   var response = await http.post(url, body: data);
  //   var result = jsonDecode(response.body);

  //   bool status = result['status'];
  //   String message = result['message'];

  //   if (status) {
  //     print(message);
  //     // You can perform additional actions here if needed
  //   } else {
  //     print(message);
  //   }
  // }

  void signIn(data, BuildContext context) async {
    try {
      showLoadingDialog(context);

      var url = Uri.parse(LOGIN_API);
      var response =
          await http.post(url, body: data).timeout(Duration(seconds: 10));
      var result = jsonDecode(response.body);

      bool status = result['status'];

      if (status) {
        hideLoadingDialog(context);

        // Extract user data
        var userData = result['user'];

        // Initialize UserController and set user data
        UserController userController =
            Get.put<UserController>(UserController());
        await userController.setUser(userData);

        AppSnackbar.showSuccess(context: context, message: result['message']);
        Get.to(const HomePage());

        print("SUCCESS");
      } else {
        print(result['message']);
        AppSnackbar.showError(context: context, message: result['message']);
        hideLoadingDialog(context);
      }
    } on TimeoutException {
      hideLoadingDialog(context);
      AppSnackbar.showError(
          context: context,
          message: 'Request timeout. Please try again later.');
    } on SocketException catch (_) {
      hideLoadingDialog(context);
      AppSnackbar.showError(
          context: context,
          message: 'No internet connection. Please check your connection.');
    } on HttpException catch (e) {
      hideLoadingDialog(context);
      AppSnackbar.showError(
          context: context, message: 'Failed to load data: ${e.message}');
    } on FormatException catch (e) {
      hideLoadingDialog(context);
      AppSnackbar.showError(
          context: context, message: 'Invalid response: ${e.message}');
    } catch (e) {
      hideLoadingDialog(context);
      print('Error: $e');
      AppSnackbar.showError(
          context: context,
          message: 'An unexpected error occurred. Please try again later.');
    }
  }

  // void signIn(data, BuildContext context) async {
  //   showLoadingDialog(context);

  //   var url = Uri.parse(LOGIN_API);
  //   var response = await http.post(url, body: data);
  //   var result = jsonDecode(response.body);

  //   bool status = result['status'];

  //   if (status) {
  //     AppSnackbar.showSuccess(context: context, message: result['message']);
  //     hideLoadingDialog(context);
  //     Get.to(HomePage());
  //   } else {
  //     print(result['message']);
  //     AppSnackbar.showError(context: context, message: result['message']);

  //     hideLoadingDialog(context);
  //   }
  // }

  signOut() async {
    await authService.removeToken();
    Get.to(const AuthChecker());
  }
}
