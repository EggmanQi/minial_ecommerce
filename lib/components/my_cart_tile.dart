import 'package:flutter/material.dart';
import 'package:minial_ecommerce/models/products.dart';

class MyCartTile extends StatelessWidget {
  final List<Product> cartProducts;
  final void Function(Product product) onTapRemove;
  const MyCartTile({super.key, required this.cartProducts, required this.onTapRemove});

  @override
  Widget build(BuildContext context) {
    Product product = cartProducts.first;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)),
              width: double.infinity,
              padding: const EdgeInsets.all(6),
              child: Image.asset(product.imagePath),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'x ${cartProducts.length.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          )),
          IconButton(
              onPressed: () {
                onTapRemove(product);
              },
              icon: Icon(cartProducts.length > 1 ? Icons.remove : Icons.delete))
        ]),
      ),
    );
  }
}
