import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/provider/product_provider.dart';

import 'package:shop_app_flutter/ui/screen/product_detail_screen.dart';
import 'package:shop_app_flutter/ui/screen/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProductProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.rootName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
