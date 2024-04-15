import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:keyboard/newAdded/api_constants.dart';

class BuyController extends GetxController {
  Future<void> add(Map<String, dynamic> data) async {
    try {
      var url = Uri.parse(BUY_PRODUCT_API);
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Specify content type
        },
        body: jsonEncode(data), // Convert data to JSON string
      );

      if (response.statusCode == 200) {
        print("SAVED SUCCESSFULLY");
        // Request successful
        // Handle success if needed
      } else {
        // Request failed
        print("Error: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (error) {
      // Error occurred during request
      print("Error: $error");
    }
  }
}
