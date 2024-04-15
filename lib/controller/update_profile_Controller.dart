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

class UpdateProfileController extends GetxController {
  var isLoading = false.obs;
  void updateYourProfile(data, BuildContext context) async {
    try {
      showLoadingDialog(context);

      var url =
          Uri.parse(UPDATE_USER_PROFILE + '/${Get.find<UserController>().id}');

      print(url);
      var response =
          await http.post(url, body: data).timeout(Duration(seconds: 10));

      var result = jsonDecode(response.body);

      print(result);

      String status = result['message'];
      var userData = result['user'];

      // Initialize UserController and set user data
      UserController userController = Get.put<UserController>(UserController());
      await userController.setUser(userData);

      if (status == "User details updated successfully") {
        var userData = result['user'];

        // Initialize UserController and set user data
        UserController userController =
            Get.put<UserController>(UserController());
        await userController.setUser(userData);
        hideLoadingDialog(context);
        AppSnackbar.showSuccess(context: context, message: result['message']);
        Get.to(HomePage());
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
}
