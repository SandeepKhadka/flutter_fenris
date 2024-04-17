import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/controller/wishlist_controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import '../Pages/Product_Details.dart';

class ExoticItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Updated height for the container
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GetBuilder<ProductController>(
          builder: (_) => GetBuilder<WishlistController>(
            builder: (wishlistController) => Row(
              children: [
                for (int index = 0;
                    index < _.exoticproducts.length && index < 5;
                    index++) // Limit loop to 5 items or the length of the list
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ProductDetails(
                          productss: _.exoticproducts[index],
                        ));
                      },
                      child: Container(
                        width: 200, // Updated width for the container
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              15), // Increased border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                PRODUCT_IMAGE_URL +
                                    _.exoticproducts[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.all(15), // Increased padding
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _.exoticproducts[index]
                                        .name, // Updated name location
                                    style: TextStyle(
                                      fontSize: 20, // Increased font size
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10), // Increased spacing
                                  // Text(
                                  //   "Weight: ${_.exoticproducts[index].quantity} KG", // Updated quantity label
                                  //   style: TextStyle(
                                  //     fontSize: 16, // Increased font size
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),

                                  SizedBox(height: 10), // Increased spacing
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Price: Rs ${_.exoticproducts[index].price}", // Updated price label
                                        style: TextStyle(
                                          fontSize: 18, // Increased font size
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
