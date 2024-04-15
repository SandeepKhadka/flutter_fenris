import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/cart/my_cart_view.dart';
import 'package:keyboard/model/getProducts_model.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import 'package:keyboard/newAdded/snackbar.dart';
import '../controller/wishlist_controller.dart'; // Import WishlistController

class ProductDetails extends StatelessWidget {
  final GetProducts productss; // Change the type to GetProducts

  ProductDetails({required this.productss}); // Update the constructor

  // Define a list of sizes
  final List<String> sizes = ['Small', 'Medium', 'Large', 'XL', 'XXL', 'XXXL'];

  // Define a variable to store the selected size
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          GetBuilder<WishlistController>(
            builder: (wishlistController) => Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (wishlistController.isInWishlist(productss)) {
                      wishlistController.removeFromWishlist(productss);
                      wishlistController.update();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Product remove from wishlist'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    } else {
                      wishlistController.addToWishlist(productss);
                      wishlistController.update();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Product added to wishlist'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    wishlistController.isInWishlist(productss)
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    color: wishlistController.isInWishlist(productss)
                        ? Colors.red
                        : null,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (wishlistController.isInCart(productss)) {
                      wishlistController.removeFromCart(productss);
                      wishlistController.update();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Product removed from cart'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      AppSnackbar();
                    } else {
                      wishlistController.addTocart(productss);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Product added to cart'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      wishlistController.update();
                    }
                  },
                  icon: Icon(wishlistController.isInCart(productss)
                      ? CupertinoIcons.cart_fill
                      : CupertinoIcons.cart),
                  color: wishlistController.isInCart(productss)
                      ? Colors.red
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              margin: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              color: Colors.white,
              child: Image.network(
                PRODUCT_IMAGE_URL + productss.image,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productss.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Description:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    productss.description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "Rs ${double.parse(productss.discount) > 0 ? productss.discount : productss.price}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Stock:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        productss.quantity,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 30),

                  // DropdownButton for selecting size
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'View Size: ',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //       DropdownButton<String>(
                  //         iconEnabledColor: Colors.red,
                  //         value: selectedSize,
                  //         onChanged: (String? newValue) {
                  //           // Update the selected size when an item is selected
                  //           selectedSize = newValue;
                  //           // Rebuild the UI
                  //           Get.forceAppUpdate();
                  //         },
                  //         items: sizes
                  //             .map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(MyCart());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: Text(
                        "Go to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
