import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';
import 'package:keyboard/model/getOrder_model.dart';
import 'package:keyboard/model/getProducts_model.dart';
import 'package:keyboard/newAdded/api_constants.dart';

import '../newAdded/loading_dialog.dart';

class MyOrder extends GetxController {
  RxList<Order> getMyOrders = <Order>[].obs;
  var isLoading = false.obs;

  //onit
  @override
  void onInit() {
    super.onInit();
    // GetMyOrders(productId);
  }

  Future<void> GetMyOrders(int userId) async {
    try {
      isLoading.value = true;

      // showLoadingDialog(context);

      var response =
          await http.get(Uri.parse(BASE_URL + "/getUserOrders/$userId"));

      if (response.statusCode == 200) {
        print("Hitted Successfull");
        isLoading.value = false;
        getMyOrders.clear();
        var products = jsonDecode(response.body)["orders"];

        getMyOrders.value =
            products.map<Order>((e) => Order.fromJson(e)).toList();

        print("ORDER FETCHED SUCCESSFULLY");
        print(getMyOrders.length);
        print("dsaf");

        isLoading.value = false;
      } else {
        isLoading.value = false;

        getMyOrders.value = [];
        print(getMyOrders.length);
        print("some");
        // Handle other status codes if needed
      }
    } catch (e) {
      isLoading.value = false;
      print(e);

      print("Something bad happen");
    }
  }
}
