import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/provider/cart.dart';

import 'package:shop_app_flutter/provider/product_provider.dart';
import 'package:shop_app_flutter/model/product.dart';
import 'package:shop_app_flutter/ui/screen/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ProductItem's build() is called");
    final productModelProvider = Provider.of<Product>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: productModelProvider.id,
          );
        },
        child: Image.network(
          productModelProvider.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          productModelProvider.title,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Consumer<Product>(
            builder: (ctx, product, child) => Icon(
              //This child is used if we want some child of widget to be not rebuild when changes occurs
              productModelProvider.isFavourite
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ),
          onPressed: () {
            productModelProvider.toggleFavorite();
          },
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            cartProvider.addItem(
              productModelProvider.id,
              productModelProvider.title,
              productModelProvider.price,
            );

            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Added item to cart!',
                ),
                duration: Duration(seconds: 3),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    cartProvider.removeSingleItem(productModelProvider.id);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
