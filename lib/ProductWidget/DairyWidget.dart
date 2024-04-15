import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/controller/getProduct_controller.dart';
import '../Pages/Product_Details.dart';

class CartItem {
  final String name;
  final String icon;
  int qty;
  final String unit;
  final int unitPrice;

  CartItem({
    required this.name,
    required this.icon,
    required this.qty,
    required this.unit,
    required this.unitPrice,
  });
}

class DairyWidget extends StatelessWidget {
  final List<CartItem> cart = []; // Initialize an empty cart

  // Function to add items to the cart
  void addToCart(CartItem newItem) {
    cart.add(newItem);
  }

  final List<Map<String, dynamic>> products = [
    {
      "name": "Apple",
      "image": "assets/apple.png",
      "price": 100,
      "description":
          "Apples are nutritious. They may be good for weight loss and your heart. Incorporating apples into a healthful diet can be beneficial.",
      "nutrition": "120", // Example nutrition value for Apple
    },
    {
      "name": "Dragon Fruit",
      "image": "assets/vegetables.png",
      "price": 50,
      "description":
          "Dragon fruits are rich in antioxidants and vitamin C. They can help boost your immune system and improve digestion.",
      "nutrition": "80", // Add nutrition information
    },
    {
      "name": "Durian",
      "image": "assets/durian.png",
      "price": 200,
      "description":
          "Durian is known as the 'king of fruits.' It has a strong odor and a unique taste, loved by many.",
      "nutrition": "150", // Add nutrition information
    },
    {
      "name": "Watermelon",
      "image": "assets/watermelon.png",
      "price": 150,
      "description":
          "Watermelons are hydrating and refreshing fruits. They are low in calories and high in vitamins A and C.",
      "nutrition": "100", // Add nutrition information
    },
    {
      "name": "Banana",
      "image": "assets/Banana.png",
      "price": 150,
      "description":
          "Bananas are rich in potassium and fiber. They make for a convenient and nutritious snack.",
      "nutrition": "90", // Add nutrition information
    },
    {
      "name": "Cherry",
      "image": "assets/cherry.png",
      "price": 150,
      "description":
          "Cherries are packed with antioxidants and anti-inflammatory compounds. They may promote better sleep and heart health.",
      "nutrition": "110", // Add nutrition information
    },
    {
      "name": "Coconut",
      "image": "assets/cocunut.png",
      "price": 150,
      "description":
          "Coconuts are versatile fruits. Coconut water is hydrating, while coconut meat is rich in healthy fats and fiber.",
      "nutrition": "120", // Add nutrition information
    },
    {
      "name": "Grapes",
      "image": "assets/Grapes.png",
      "price": 150,
      "description":
          "Grapes contain antioxidants like resveratrol, which may have heart-healthy benefits. They are also delicious as a snack.",
      "nutrition": "80", // Add nutrition information
    },
    {
      "name": "Mango",
      "image": "assets/Mango.png",
      "price": 150,
      "description":
          "Mangoes are tropical fruits rich in vitamins A and C. They are delicious on their own or added to smoothies and salads.",
      "nutrition": "100", // Add nutrition information
    },
    {
      "name": "Strawberry",
      "image": "assets/strawberry.png",
      "price": 150,
      "description":
          "Strawberries are high in vitamin C and antioxidants. They are versatile and can be enjoyed in various dishes, from desserts to salads.",
      "nutrition": "70", // Add nutrition information
    },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: innerBoxIsScrolled
                  ? Colors.white.withOpacity(0.5)
                  : Colors.transparent,
              elevation: 0,
              title: Text(
                'Dairy Products',
                style: TextStyle(
                  color: innerBoxIsScrolled ? Colors.black : Colors.black,
                ),
              ),
              centerTitle: true,
              floating: true,
              pinned: true,
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                GridView.count(
                  childAspectRatio: 0.72,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  children: [
                    for (final product in products)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productss:
                                    Get.find<ProductController>().products[1],
                                // name: product['name'],
                                // image: product['image'],
                                // price: product['price'],
                                // description: product['description'],
                                // nutrition: product['nutrition'],
                                // isFavorite:
                                //     false, // Example value for isFavorite
                              ),
                            ));
                          },
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
                                  child: Image.asset(
                                    product['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product['name'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        "1KG",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs ${product['price']}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green[400],
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.add_box_rounded,
                                            color: Colors.green,
                                            size: 30,
                                          )
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
                SizedBox(height: 20),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DairyWidget(),
  ));
}
