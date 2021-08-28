import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/provider/product_provider.dart';
import 'package:shop_app_flutter/ui/screen/product_overview_screen.dart';

import 'package:shop_app_flutter/ui/widget/product_item.dart';

class ProductGrid extends StatelessWidget {
  final EnumFilterOption enumFilterOption;

  ProductGrid({required this.enumFilterOption});

  @override
  Widget build(BuildContext context) {
    print("ProductGrid's build() is called");
    final productProvider = Provider.of<ProductProvider>(context);
    final productList = enumFilterOption == EnumFilterOption.SHOW_ALL ? productProvider.items : productProvider.itemsFavourites;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) => ChangeNotifierProvider.value(
          value: productList[index],
          child: ProductItem(),
        ),
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
