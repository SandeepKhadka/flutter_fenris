import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/controller/wishlist_controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import '../Pages/Product_Details.dart';

class ViewMoreTopItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Top Items"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            // height: 900, // Updated height for the container
            child: GetBuilder<ProductController>(
              builder: (_) => GetBuilder<WishlistController>(
                builder: (wishlistController) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: _.exoticproducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ProductDetails(
                            productss: _.exoticproducts[index],
                          ));
                        },
                        child: Container(
                          // width: 200, // Commented out width for dynamic sizing
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
                                padding: const EdgeInsets.all(
                                    15), // Increased padding
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
                                    Text(
                                      "Weight: ${_.exoticproducts[index].quantity} KG", // Updated quantity label
                                      style: TextStyle(
                                        fontSize: 16, // Increased font size
                                        color: Colors.grey,
                                      ),
                                    ),
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
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}

//

class ViewMoreNewArrivals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Arrivals"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            // height: 900, // Updated height for the container
            child: GetBuilder<ProductController>(
              builder: (_) => GetBuilder<WishlistController>(
                builder: (wishlistController) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: _.getNewProduct.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ProductDetails(
                            productss: _.getNewProduct[index],
                          ));
                        },
                        child: Container(
                          // width: 200, // Commented out width for dynamic sizing
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
                                      _.getNewProduct[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                    15), // Increased padding
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _.getNewProduct[index]
                                          .name, // Updated name location
                                      style: TextStyle(
                                        fontSize: 20, // Increased font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 10), // Increased spacing
                                    Text(
                                      "Weight: ${_.getNewProduct[index].quantity} KG", // Updated quantity label
                                      style: TextStyle(
                                        fontSize: 16, // Increased font size
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 10), // Increased spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Price: Rs ${_.getNewProduct[index].price}", // Updated price label
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
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}

//

class ViewMoreDiscount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Discount Price"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            // height: 900, // Updated height for the container
            child: GetBuilder<ProductController>(
              builder: (_) => GetBuilder<WishlistController>(
                builder: (wishlistController) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: _.getDiscountProduct.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ProductDetails(
                            productss: _.getDiscountProduct[index],
                          ));
                        },
                        child: Container(
                          // width: 200, // Commented out width for dynamic sizing
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
                                      _.getDiscountProduct[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                    15), // Increased padding
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _.getDiscountProduct[index]
                                          .name, // Updated name location
                                      style: TextStyle(
                                        fontSize: 20, // Increased font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 10), // Increased spacing
                                    Text(
                                      "Weight: ${_.getDiscountProduct[index].quantity} KG", // Updated quantity label
                                      style: TextStyle(
                                        fontSize: 16, // Increased font size
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 10), // Increased spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Rs ${_.getDiscountProduct[index].price}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[600],
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        Text(
                                          "Price: Rs ${_.getDiscountProduct[index].discount}", // Updated price label
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
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
