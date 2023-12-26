import 'package:flutter/material.dart';
import 'package:minial_ecommerce/components/my_drawer.dart';
import 'package:minial_ecommerce/components/my_product_tile.dart';
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

  @override
  Widget build(BuildContext context) {
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
        body: isHorizontal ? const HorizontalProductList() : const VerticalProductList());
  }
}

class ProductListHeader extends StatelessWidget {
  const ProductListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Pick from a item to buy~",
      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
    );
  }
}

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Column(
      children: [
        const ProductListHeader(),
        Expanded(
            child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return MyProductTile(product: product);
                })),
        const SizedBox(height: 150),
      ],
    );
  }
}

class VerticalProductList extends StatelessWidget {
  const VerticalProductList({super.key});
  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: ProductListHeader(),
          ));
        }, childCount: 1)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final product = products[index];
              return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: MyProductTile(product: product));
            },
            childCount: products.length,
          ),
        ),
      ],
    );
  }
}
