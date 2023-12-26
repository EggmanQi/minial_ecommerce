import 'package:flutter/material.dart';
import 'package:minial_ecommerce/components/my_button.dart';
import 'package:minial_ecommerce/components/my_cart_tile.dart';
import 'package:minial_ecommerce/models/products.dart';
import 'package:minial_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = context.watch<Shop>().cart;
    final cartGroup = context.watch<Shop>().cartProductsGroup;

    void removeItemFromCart(BuildContext context, Product product) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("Remove this item to your cart?"),
                actions: [
                  MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<Shop>().removeFromCart(product);
                    },
                    child: const Text("Yes"),
                  ),
                ],
              ));
    }

    void payButtonPressed(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                content: Text("User wants to pay"),
              ));
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          // title: const Text("Cart page"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Cart",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  "Check your cart before paying!",
                  style:
                      TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
              Expanded(
                child: cartGroup.isEmpty
                    ? const Center(child: Text("Your cart is empty"))
                    : ListView.builder(
                        // padding: EdgeInsets.all(10),
                        itemCount: cartGroup.length,
                        itemBuilder: (context, index) {
                          // print(cartGroup);
                          final item = cartGroup[index];
                          return MyCartTile(
                            cartProducts: item,
                            onTapRemove: (product) {
                              removeItemFromCart(context, product);
                            },
                          );
                        }),
              ),
            ]),
            Positioned(
                left: 10,
                right: 10,
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child:
                      MyButton(onTap: () => payButtonPressed(context), child: const Text("Pay!")),
                ))
          ],
        ));
  }
}
