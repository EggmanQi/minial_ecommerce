import 'package:flutter/material.dart';
import 'package:minial_ecommerce/models/products.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
        name: "Product 1",
        price: 99.99,
        description: "Item description",
        imagePath: 'assets/112.jpg'),
    Product(
        name: "Product 2",
        price: 199.99,
        description: "Item description",
        imagePath: 'assets/195.jpg'),
    Product(
        name: "Product 3",
        price: 9.99,
        description: "Item description",
        imagePath: 'assets/373.jpg'),
  ];

  final List<Product> _cart = [];

  List<Product> get shop => _shop; // 这个操作相当于 _shop read only

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
