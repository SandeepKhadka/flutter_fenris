import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/model/getProducts_model.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import 'package:keyboard/newAdded/ui_assets.dart';
import '../controller/wishlist_controller.dart';
import '../Pages/Product_Details.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Get.find<WishlistController>().wishlist.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Your wishlist is empty",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : GetBuilder<WishlistController>(
              builder: (_) => ListView.builder(
                itemCount: _.wishlist.length,
                itemBuilder: (context, index) {
                  final product = _.wishlist[index];
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            PRODUCT_IMAGE_URL + product.image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: GestureDetector(
                          onTap: () {
                            Get.to(ProductDetails(productss: product));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Price: ${product.price}',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            // Remove item from wishlist when clicking on delete button
                            _.removeFromWishlist(product);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Product Removed from Wishlist'),
                              duration: Duration(seconds: 1),
                            ));
                            _.update();
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final GetProducts product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  PRODUCT_IMAGE_URL + product.image,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Price: ${product.price}',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Description:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.description,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
