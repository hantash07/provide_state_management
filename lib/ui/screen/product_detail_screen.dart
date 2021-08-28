import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/provider/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const rootName = "/product_detail_screen";

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context);
    String productId = "";
    if (arguments != null) {
      productId = arguments.settings.arguments as String;
    }
    final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
    final product = productProvider.getProductById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
