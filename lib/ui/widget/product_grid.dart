import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/provider/product_provider.dart';

import 'package:shop_app_flutter/ui/screen/product_detail_screen.dart';
import 'package:shop_app_flutter/ui/widget/product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productList = productProvider.items;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) => ProductItem(product: productList[index]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10, //top-bottom spacing
          crossAxisSpacing: 10, //Left-right spacing
        ),
      ),
    );
  }
}
