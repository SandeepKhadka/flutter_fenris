import 'package:flutter/material.dart';
import 'package:keyboard/Cart%20Widget/cartprovider.dart';
import 'package:keyboard/cart/my_cart_view.dart';
import 'package:provider/provider.dart';

// Assuming your MyCart widget is in my_cart.dart file

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'My App',
        home: MyCart(),
      ),
    );
  }
}
