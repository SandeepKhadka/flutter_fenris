import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Favourite/fav_screen.dart';
import 'package:keyboard/Pages/Drawer.dart';
import 'package:keyboard/Pages/Product_Details.dart';
import 'package:keyboard/Widgets/BestSelling.dart';
import 'package:keyboard/Widgets/Carousel.dart';
import 'package:keyboard/Widgets/Exotic.dart';
import 'package:keyboard/Widgets/Navbar.dart';
import 'package:keyboard/Widgets/ProductWidget.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import 'package:keyboard/controller/user_Controller.dart';
import 'package:keyboard/model/getProducts_model.dart';
import 'package:keyboard/newAdded/ViewMore.dart';
import 'package:keyboard/newAdded/api_constants.dart';
import 'package:keyboard/payment/khalti.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print(Get.find<ProductController>().get());
    print(Get.find<ProductController>().getExoticProduct());
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SearchPage());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Search Products",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                MySlider(),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Top Items",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Container(
                    height: 200,
                    child: Image.network(
                      'https://static.vecteezy.com/system/resources/previews/014/435/780/non_2x/top-product-banner-icon-modern-illustration-vector.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ExoticItemWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.to(ViewMoreTopItems());
                        },
                        child: Text(
                          "View More",
                          style: TextStyle(color: Colors.blue, fontSize: 18,),
                        )),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "New Arrivals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Container(
                    height: 200,
                    child: Image.network(
                      'https://img.freepik.com/premium-vector/new-arrival-banner-template-classic-blue-color_1361-2098.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                BestSelling(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.to(ViewMoreNewArrivals());
                        },
                        child: Text(
                          "View More",
                          style: TextStyle(color: Colors.blue, fontSize: 18,),
                        )),
                  ],
                ),
                // SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Discount Price",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Container(
                    height: 200,
                    child: Image.network(
                      'https://www.shutterstock.com/image-vector/colorful-discount-sale-podium-special-600nw-2055955985.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ProductItemWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.to(ViewMoreDiscount());
                        },
                        child: Text(
                          "View More",
                          style: TextStyle(color: Colors.blue, fontSize: 18,),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(),
      drawer: Drawer(
        child: CustomDrawer(),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<GetProducts> _products = [];
  List<GetProducts> _searchResults = [];

  @override
  void initState() {
    super.initState();
    // Get.find<ProductController>().products
    print(Get.find<ProductController>().products);
    _products = Get.find<ProductController>().products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search Products...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                _updateSearchResults('');
              },
            ),
          ),
          onChanged: _updateSearchResults,
        ),
      ),
      body: _searchController.text.isEmpty
          ? Center(
              child: Text("Search Product Here ..."),
            )
          : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final product = _searchResults[index];
                return ListTile(
                  trailing: Image(
                    image: NetworkImage(
                      PRODUCT_IMAGE_URL + product.image,
                    ),
                    height: 40,
                    width: 40,
                  ),
                  title: Text(product.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          productss: product,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  void _updateSearchResults(String query) {
    setState(() {
      _searchResults = _products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
