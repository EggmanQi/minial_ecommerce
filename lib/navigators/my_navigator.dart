import 'package:flutter/material.dart';

class MyNavigator {
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void pushToShop(BuildContext context) {
    Navigator.pushNamed(context, '/shop_page');
  }

  static void pushToCart(BuildContext context) {
    Navigator.pushNamed(context, '/cart_page');
  }
}
