import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:keyboard/Pages/Product_Details.dart';
import 'package:keyboard/newAdded/api_constants.dart';

import '../controller/getProduct_controller.dart';
import '../controller/wishlist_controller.dart';

class BestSelling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GetBuilder<ProductController>(
          builder: (_) => GetBuilder<WishlistController>(
            builder: (wishlistController) => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  _.getNewProduct.length > 5 ? 5 : _.getNewProduct.length,
              itemBuilder: (context, index) {
                bool isInWishlist =
                    wishlistController.isInWishlist(_.getNewProduct[index]);
                bool isInCart =
                    wishlistController.isInCart(_.getNewProduct[index]);

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            productss: _.getNewProduct[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Image.network(
                                  PRODUCT_IMAGE_URL +
                                      _.getNewProduct[index].image,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        isInWishlist
                                            ? Icons.favorite
                                            : Icons.favorite_border_rounded,
                                        color: isInWishlist
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      onPressed: () {
                                        if (isInWishlist) {
                                          wishlistController.removeFromWishlist(
                                              _.getNewProduct[index]);
                                          print(
                                              'Removed from wishlist: ${_.getNewProduct[index].name}');
                                        } else {
                                          wishlistController.addToWishlist(
                                              _.getNewProduct[index]);
                                          print(
                                              'Added to wishlist: ${_.getNewProduct[index].name}');
                                        }
                                        _.update(); // Update the UI
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        isInCart
                                            ? CupertinoIcons.cart_fill
                                            : CupertinoIcons.cart,
                                        color:
                                            isInCart ? Colors.red : Colors.grey,
                                      ),
                                      onPressed: () {
                                        if (isInCart) {
                                          wishlistController.removeFromCart(
                                              _.getNewProduct[index]);
                                          print(
                                              'Removed from cart: ${_.getNewProduct[index].name}');
                                        } else {
                                          wishlistController.addTocart(
                                              _.getNewProduct[index]);
                                          print(
                                              'Added to cart: ${_.getNewProduct[index].name}');
                                        }
                                        _.update(); // Update the UI
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _.getNewProduct[index].name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    _.getNewProduct[index].description,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  // Text(
                                  //   "Quantity = " +
                                  //       _.getNewProduct[index].quantity +
                                  //       " KG",
                                  //   style: TextStyle(fontSize: 14),
                                  // ),
                                  SizedBox(height: 5),
                                  SizedBox(height: 5),
                                  Text(
                                    "RS= " + _.getNewProduct[index].price,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
