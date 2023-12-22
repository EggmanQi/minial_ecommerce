import 'package:flutter/material.dart';
import 'package:minial_ecommerce/components/my_list_title.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
              const SizedBox(height: 25),
              MyListTitle(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context)),
              MyListTitle(
                  text: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTitle(
                text: "Exit",
                icon: Icons.logout,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, "/intro_page", (route) => false)),
          )
        ],
      ),
    );
  }
}
