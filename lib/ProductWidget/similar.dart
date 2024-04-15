import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimilarProductWidget extends StatelessWidget {
  // Define lists for product names, images, and prices
  final List<Map<String, dynamic>> products = [
    {"name": "Fruits", "image": "assets/fruits.png", "price": 100},
    {"name": "Vegetables", "image": "assets/vegetables.png", "price": 50},
    {"name": "Dairy Products", "image": "assets/dairy.png", "price": 200},
    {"name": "Exotic Foods", "image": "assets/exoti.png", "price": 150},
    {"name": "Exotic Foods", "image": "assets/exoti.png", "price": 150},
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
                'Exotic Vegetables',
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
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 10, right: 10),
                                  constraints: BoxConstraints(maxHeight: 190),
                                  child: Image.asset(
                                    product['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
    home: SimilarProductWidget(),
  ));
}
