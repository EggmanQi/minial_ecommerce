import 'package:flutter/material.dart';
import 'package:minial_ecommerce/components/my_list_title.dart';
import 'package:minial_ecommerce/navigators/my_navigator.dart';
import 'package:minial_ecommerce/pages/intro_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void _closeDrawer(BuildContext context) {
    MyNavigator.pop(context);
  }

  void _didTapCardButton(BuildContext context) {
    _closeDrawer(context);
    MyNavigator.pushToCart(context);
  }

  void _didTapShopButton(BuildContext context) {
    _closeDrawer(context);
    MyNavigator.pushToCart(context);
  }

  void _didTapExitButton(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const IntroPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // 在这里定义页面切换时的动画效果
            return FadeTransition(opacity: animation, child: child);
          },
        ),
        (route) => false);
  }

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
              MyListTitle(text: "Shop", icon: Icons.home, onTap: () => _didTapShopButton(context)),
              MyListTitle(
                  text: "Cart", icon: Icons.shopping_cart, onTap: () => _didTapCardButton(context)),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyListTitle(
                text: "Exit",
                icon: Icons.logout,
                onTap: () => _didTapExitButton(context),
              ))
        ],
      ),
    );
  }
}
