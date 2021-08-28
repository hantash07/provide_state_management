import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app_flutter/provider/cart.dart';
import 'package:shop_app_flutter/ui/screen/cart_screen.dart';
import 'package:shop_app_flutter/ui/widget/app_drawer.dart';
import 'package:shop_app_flutter/ui/widget/badge.dart';
import 'package:shop_app_flutter/ui/widget/product_grid.dart';

enum EnumFilterOption {
  SHOW_ALL,
  FAVOURITES,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _enumFilterOption = EnumFilterOption.SHOW_ALL;

  @override
  Widget build(BuildContext context) {
    print("ProductOverviewScreen's build() is called");
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cartProvider, childNotChangeable) => Badge(
              child: childNotChangeable!,
              value: cartProvider.counts.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
          PopupMenuButton(
            onSelected: (EnumFilterOption enumFilter) {
              setState(() {
                if (enumFilter == EnumFilterOption.FAVOURITES) {
                  _enumFilterOption = EnumFilterOption.FAVOURITES;
                } else {
                  _enumFilterOption = EnumFilterOption.SHOW_ALL;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Show All"),
                value: EnumFilterOption.SHOW_ALL,
              ),
              PopupMenuItem(
                child: Text("Favourites"),
                value: EnumFilterOption.FAVOURITES,
              ),
            ],
          ),
        ],
      ),
      body: ProductGrid(enumFilterOption: _enumFilterOption),
      drawer: AppDrawer(),
    );
  }
}
