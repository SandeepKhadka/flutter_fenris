import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/checkout/checkout.dart';
import 'package:keyboard/controller/wishlist_controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import 'package:keyboard/newAdded/ui_assets.dart';
import '../Widgets/Navbar.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  Map<int, int> quantities = {};
  Map<int, String?> selectedSizes =
      {}; // Map to store selected sizes for each product

  @override
  void initState() {
    super.initState();
    // Initialize quantities and selectedSizes for each product
    final wishlistController = Get.find<WishlistController>();
    for (int i = 0; i < wishlistController.cart.length; i++) {
      quantities[i] = 1; // Default quantity is 1
      selectedSizes[i] = null; // Default selected size is null
    }
  }

  double getTotalPrice() {
    double totalPrice = 0;
    final wishlistController = Get.find<WishlistController>();
    for (int i = 0; i < wishlistController.cart.length; i++) {
      final cartItem = wishlistController.cart[i];
      totalPrice += double.parse(cartItem.price) * (quantities[i] ?? 1);
    }
    return totalPrice;
  }

  int shippingCost = 300;

  void incrementCounter(int index) {
    final wishlistController = Get.find<WishlistController>();
    final int maxQuantity = int.parse(wishlistController.cart[index].quantity);
    if ((quantities[index] ?? 0) < maxQuantity) {
      setState(() {
        quantities[index] = (quantities[index] ?? 0) + 1;
      });
    } else {
      // Show Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Out of quantity'),
        ),
      );
    }
  }

  void decrementCounter(int index) {
    setState(() {
      if (quantities[index]! > 1) {
        quantities[index] = quantities[index]! - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Get.find<WishlistController>().cart.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Your cart is empty",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            : GetBuilder<WishlistController>(
                builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView.builder(
                      itemCount: _.cart.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final cartItem = _.cart[index];
                        return Column(
                          children: [
                            ListTile(
                              tileColor: Colors.blue[50],
                              leading: Image(
                                image: NetworkImage(
                                  PRODUCT_IMAGE_URL + cartItem.image,
                                ),
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      cartItem.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      _.removeFromCart(cartItem);
                                      _.update();
                                    },
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cartItem.quantity} quanity, ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    '${cartItem.price} price, ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: IconButton(
                                              onPressed: () {
                                                decrementCounter(index);
                                              },
                                              icon: Icon(Icons.remove),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            child: Text(
                                              (quantities[index] ?? 0)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: IconButton(
                                              onPressed: () {
                                                incrementCounter(index);
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Rs ${double.parse(cartItem.discount) > 0 ? double.parse(cartItem.discount) * (quantities[index] ?? 1) : double.parse(cartItem.price) * (quantities[index] ?? 1)}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: DropdownButton<String>(
                                      hint: Text('Select Size'),
                                      value: selectedSizes[index],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedSizes[index] = newValue;
                                        });
                                      },
                                      items: [
                                        'Small',
                                        'Medium',
                                        'Large',
                                        'XL',
                                        'XXL',
                                        'XXXL'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(), // Divider between items
                            SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Subtotal:',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Text(
                            'Rs ${getTotalPrice()}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Shipping Cost:',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Text(
                            "Rs " + shippingCost.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text(
                            (getTotalPrice() + shippingCost).toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Check if any product has a null selected size
                          if (selectedSizes.containsValue(null)) {
                            // Show error message if any product has a null selected size
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Please select size for each product'),
                              ),
                            );
                          } else {
                            // Proceed to checkout if all products have selected sizes
                            final wishlistController =
                                Get.find<WishlistController>();
                            List<Map<String, dynamic>> products = [];
                            for (int i = 0;
                                i < wishlistController.cart.length;
                                i++) {
                              final cartItem = wishlistController.cart[i];
                              final quantity = quantities[i] ?? 0;
                              final size = selectedSizes[i]!;
                              // Add product details to the list
                              products.add({
                                'product_id': cartItem.id,
                                'quantity': quantity,
                                'size': size,
                              });
                            }
                            // Convert the list to JSON format
                            List<dynamic> productsList =
                                jsonDecode(jsonEncode(products));
                            // print(productsList);
                            // Navigate to the checkout screen

                            Get.to(Checkout(
                              totalPrice:
                                  getTotalPrice().toInt() + shippingCost,
                              productJsonData: productsList,
                            ));
                          }
                        },
                        child: Text(
                          "Go To Checkout",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.only(left: 100, right: 100),
                          textStyle: TextStyle(fontSize: 20),
                          elevation: 20,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
