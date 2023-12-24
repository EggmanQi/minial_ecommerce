import 'package:flutter/material.dart';
import 'package:minial_ecommerce/components/my_button.dart';
import 'package:minial_ecommerce/navigators/my_navigator.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            const Text(
              "Minimal Shop",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              "Premium Quality Products",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 10),
            MyButton(
                onTap: () {
                  MyNavigator.pushToShop(context);
                },
                child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
