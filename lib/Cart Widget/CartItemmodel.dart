import 'package:flutter/material.dart';

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
