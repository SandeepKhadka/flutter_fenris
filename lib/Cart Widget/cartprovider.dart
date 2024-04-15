import 'package:flutter/material.dart';
import 'package:keyboard/Cart%20Widget/CartItemmodel.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _cartItems[index].qty++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_cartItems[index].qty > 1) {
      _cartItems[index].qty--;
      notifyListeners();
    }
  }

  int getSubtotal() {
    int subtotal = 0;
    for (var item in _cartItems) {
      subtotal += item.qty * item.unitPrice;
    }
    return subtotal;
  }

  int getShippingCost(int subtotal) {
    if (subtotal > 1000) {
      return 0;
    } else if (subtotal <= 1000 && subtotal > 100) {
      return 100;
    } else {
      return 120;
    }
  }

  int getTotalPrice() {
    int subtotal = getSubtotal();
    int shippingCost = getShippingCost(subtotal);
    return subtotal + shippingCost;
  }
}
