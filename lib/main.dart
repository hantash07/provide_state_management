import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/provider/cart.dart';
import 'package:shop_app_flutter/provider/order_provider.dart';
import 'package:shop_app_flutter/provider/product_provider.dart';
import 'package:shop_app_flutter/ui/screen/cart_screen.dart';
import 'package:shop_app_flutter/ui/screen/edit_product_screen.dart';
import 'package:shop_app_flutter/ui/screen/order_screen.dart';

import 'package:shop_app_flutter/ui/screen/product_detail_screen.dart';
import 'package:shop_app_flutter/ui/screen/product_overview_screen.dart';
import 'package:shop_app_flutter/ui/screen/user_products_screen.dart';
import 'package:shop_app_flutter/ui/widget/user_product_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderProvider(),
        )
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
