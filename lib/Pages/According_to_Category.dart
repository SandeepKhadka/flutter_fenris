import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Pages/Product.dart';
import 'package:keyboard/Pages/Product_Details.dart';
import 'package:keyboard/controller/wishlist_controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import '../controller/getProduct_controller.dart';

class AccToCategory extends StatefulWidget {
  final int categoryId;

  const AccToCategory({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<AccToCategory> createState() => _AccToCategoryState();
}

class _AccToCategoryState extends State<AccToCategory> {
  late bool _isLoading = true; // Flag to track loading state

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget initializes
    fetchData();
  }

  // Function to fetch data
  void fetchData() async {
    try {
      await Get.find<ProductController>()
          .GetProductAccoridngCategory(widget.categoryId);
    } finally {
      // Set loading state to false when API call is completed
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: _isLoading
          ? Center(
              child:
                  CircularProgressIndicator(), // Show circular progress indicator while loading
            )
          : Get.find<ProductController>().getProductAccCategory.isEmpty
              ? Center(
                  child: Text('Sorry, no products according to category.'),
                )
              : GetBuilder<ProductController>(
                  builder: (_) => GetBuilder<WishlistController>(
                      builder: (wishlistController) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              itemCount: _.getProductAccCategory.length,
                              itemBuilder: (context, index) {
                                bool isInWishlist = wishlistController
                                    .isInWishlist(_.products[index]);
                                bool isInCart = wishlistController
                                    .isInCart(_.products[index]);

                                return GestureDetector(
                                  onTap: () {
                                    Get.to(ProductDetails(
                                        productss: _.products[index]));
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Image.network(
                                            PRODUCT_IMAGE_URL +
                                                _.getProductAccCategory[index]
                                                    .image,
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _.getProductAccCategory[index]
                                                    .name,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                _.getProductAccCategory[index]
                                                    .description,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "RS= " +
                                                    _
                                                        .getProductAccCategory[
                                                            index]
                                                        .price,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                isInWishlist
                                                    ? Icons.favorite
                                                    : Icons
                                                        .favorite_border_rounded,
                                                color: isInWishlist
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                              onPressed: () {
                                                if (isInWishlist) {
                                                  wishlistController
                                                      .removeFromWishlist(
                                                          _.products[index]);
                                                  print(
                                                      'Removed from wishlist: ${_.products[index].name}');
                                                } else {
                                                  wishlistController
                                                      .addToWishlist(
                                                          _.products[index]);
                                                  print(
                                                      'Added to wishlist: ${_.products[index].name}');
                                                }
                                                _.update(); // Update the UI
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                isInCart
                                                    ? Icons.shopping_cart
                                                    : Icons.add_shopping_cart,
                                                color: isInCart
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                              onPressed: () {
                                                if (isInCart) {
                                                  wishlistController
                                                      .removeFromCart(
                                                          _.products[index]);
                                                  print(
                                                      'Removed from cart: ${_.products[index].name}');
                                                } else {
                                                  wishlistController.addTocart(
                                                      _.products[index]);
                                                  print(
                                                      'Added to cart: ${_.products[index].name}');
                                                }
                                                _.update(); // Update the UI
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                ),
    );
  }
}
