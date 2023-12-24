import 'package:flutter/material.dart';
import 'package:minial_ecommerce/components/my_drawer.dart';
import 'package:minial_ecommerce/components/my_product_title.dart';
import 'package:minial_ecommerce/models/shop.dart';
import 'package:minial_ecommerce/navigators/my_navigator.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with TickerProviderStateMixin {
  bool isHorizontal = true;
  void _changeDirection() {
    setState(() {
      isHorizontal = !isHorizontal;
    });
  }

  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

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
                onPressed: () => MyNavigator.pushToCart(context),
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: const MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _changeDirection();
          },
          mini: true, // 按钮图标
          child: const Icon(Icons.refresh_sharp),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Pick from a item to buy~",
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                  Expanded(
                      child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width - (isHorizontal ? 0 : 10),
                    child: ListView.builder(
                        itemCount: products.length,
                        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
                        padding: const EdgeInsets.all(15),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return MyProductTitle(product: product);
                        }),
                  )),
                  SizedBox(height: isHorizontal ? 150 : 0),
                ]);
              },
            ),
            Container(
              height: MediaQuery.of(context).padding.bottom,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(1.0),
                    Colors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ));
  }
}
