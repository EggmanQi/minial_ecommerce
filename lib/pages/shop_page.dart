import 'package:flutter/material.dart';
import 'package:minial_ecommerce/components/my_drawer.dart';
import 'package:minial_ecommerce/components/my_product_title.dart';
import 'package:minial_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop page"),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart_page"),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MyDrawer(),
      body: ListView(children: [
        const SizedBox(
          height: 25,
        ),
        Center(
          child: Text(
            "Pick from a ..........",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        SizedBox(
          height: 550,
          child: ListView.builder(
              // physics: const FixedExtentScrollPhysics(),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductTitle(product: product);
              }),
        ),
      ]),
    );
  }
}
