import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import '../Pages/Product_Details.dart';

class ProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: GetBuilder<ProductController>(
        builder: (_) => ListView.builder(
          itemCount:
              _.getDiscountProduct.length > 5 ? 5 : _.getDiscountProduct.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                GridView.count(
                  childAspectRatio: 0.72,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(ProductDetails(
                          productss: _.getDiscountProduct[index],
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          width: 170,
                          height: 100,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 10, right: 10),
                                constraints: BoxConstraints(maxHeight: 190),
                                child: Image.network(
                                  PRODUCT_IMAGE_URL +
                                      _.getDiscountProduct[index].image,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  _.getDiscountProduct[index].name,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 2),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 8),
                              //   child: Text(
                              //     "Quantity = ${_.getDiscountProduct[index].quantity}",
                              //     style: TextStyle(
                              //       fontSize: 15,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(height: 8),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Original Price:",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      "Rs ${_.getDiscountProduct[index].price}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Discounted Price:",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Rs ${_.getDiscountProduct[index].discount}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
