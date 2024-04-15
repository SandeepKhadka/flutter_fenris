import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';
import 'package:keyboard/model/getProducts_model.dart';
import 'package:keyboard/newAdded/api_constants.dart';

import '../newAdded/loading_dialog.dart';

class ProductController extends GetxController {
  RxList<GetProducts> products = RxList<GetProducts>([]);
  RxList<GetProducts> exoticproducts = RxList<GetProducts>([]);
  RxList<GetProducts> getNewProduct = RxList<GetProducts>([]);
  RxList<GetProducts> getDiscountProduct = RxList<GetProducts>([]);
  RxList<GetProducts> getProductAccCategory = <GetProducts>[].obs;

  var isLoading = false.obs;

  //onit
  @override
  void onInit() {
    super.onInit();
    print(products);
    get();
    getExoticProduct();
    getDiscountProducts();
    getNewProducts();
  }

  get() async {
    try {
      var response = await http.get(Uri.parse(GETPRODUCT_API));

      // Future.delayed(Duration(seconds: 10), () {
      if (response.statusCode == 200) {
        var products = jsonDecode(response.body)["products"];
        this.products.value =
            products.map<GetProducts>((e) => GetProducts.fromJson(e)).toList();
        print(products);
        update();
      } else {}
      ;
    } catch (e) {
      Get.snackbar("", "something bad happen");
    }
  }

  getExoticProduct() async {
    try {
      var response = await http.get(Uri.parse(GET_EXOTIC_PRODUCT));

      // Future.delayed(Duration(seconds: 10), () {
      if (response.statusCode == 200) {
        var products = jsonDecode(response.body)["products"];
        this.exoticproducts.value =
            products.map<GetProducts>((e) => GetProducts.fromJson(e)).toList();
        print(products);
        print("EXOTIC ITEMS FETCHED SUCCESSFULLY");
        update();
      } else {}
      ;
    } catch (e) {
      Get.snackbar("", "something bad happen");
    }
  }

  getNewProducts() async {
    try {
      var response = await http.get(Uri.parse(GET_NEW_PRODUCTAPI));

      // Future.delayed(Duration(seconds: 10), () {
      if (response.statusCode == 200) {
        var products = jsonDecode(response.body)["products"];
        this.getNewProduct.value =
            products.map<GetProducts>((e) => GetProducts.fromJson(e)).toList();
        print(products);
        print("New Product FETCHED SUCCESSFULLY");
        update();
      } else {}
      ;
    } catch (e) {
      Get.snackbar("", "something bad happen");
    }
  }

  getDiscountProducts() async {
    try {
      var response = await http.get(Uri.parse(DISCOUNT_PRODUCT_API));

      if (response.statusCode == 200) {
        var products = jsonDecode(response.body)["products"];
        this.getDiscountProduct.value =
            products.map<GetProducts>((e) => GetProducts.fromJson(e)).toList();
        print(products);
        print("Discount ITEMS FETCHED SUCCESSFULLY");
        update();
      } else {}
      ;
    } catch (e) {
      Get.snackbar("", "something bad happen");
    }
  }

  Future<void> GetProductAccoridngCategory(int productId) async {
    try {
      isLoading.value = true;

      // showLoadingDialog(context);

      var response =
          await http.get(Uri.parse(BASE_URL + "/category/$productId/products"));

      if (response.statusCode == 200) {
        isLoading.value = false;

        // getProductAccCategory.clear();
        var products = jsonDecode(response.body)["products"];

        getProductAccCategory.value =
            products.map<GetProducts>((e) => GetProducts.fromJson(e)).toList();

        print("PRODUCT ACCORDING TO CATEGORY FETCHED SUCCESSFULLY");
        print(getProductAccCategory.length);
        print("dsaf");

        isLoading.value = false;
      } else {
        getProductAccCategory.value = [];
        print(getProductAccCategory.length);
        isLoading.value = false;
        print("some");
        // Handle other status codes if needed
      }
    } catch (e) {
      Get.snackbar("", "Something bad happened");
    }
  }
}
