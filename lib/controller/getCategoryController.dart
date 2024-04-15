import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';
import 'package:keyboard/model/getCategory.dart';
import 'package:keyboard/model/getProducts_model.dart';
import 'package:keyboard/newAdded/api_constants.dart';

class GetCategoryController extends GetxController {
  RxList<GetCategories> getCategory = RxList<GetCategories>([]);

  //onit
  @override
  void onInit() {
    super.onInit();
    print(getCategory);
    get();
  }

  get() async {
    try {
      var response = await http.get(Uri.parse(GET_CATEGORY_API));

      // Future.delayed(Duration(seconds: 10), () {
      if (response.statusCode == 200) {
        var products = jsonDecode(response.body)["categories"];
        this.getCategory.value = products
            .map<GetCategories>((e) => GetCategories.fromJson(e))
            .toList();
        print(products);
        update();
      } else {}
      ;
    } catch (e) {
      Get.snackbar("", "something bad happen");
    }
  }
}
