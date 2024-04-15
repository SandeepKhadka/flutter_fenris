import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product); // Fixed the issue here
    notifyListeners();
  }
}

class Product {
  final String name;
  final String image;
  final int price;

  Product({
    required this.name,
    required this.image,
    required this.price,
  });
}
