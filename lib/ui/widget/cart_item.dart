import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/provider/cart.dart' show Cart, CartProvider;

class CartItem extends StatelessWidget {
  final String productId;
  final Cart cartItem;

  CartItem({required this.productId, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    print("CartItem's build() is called");
    return Dismissible(
      key: ValueKey(productId),
      background: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        final cartProvider = Provider.of<CartProvider>(context, listen: false);
        cartProvider.removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: FittedBox(
                  child: Text("\$${cartItem.price}"),
                ),
              ),
            ),
            title: Text(cartItem.title),
            subtitle: Text("Total: \$${cartItem.price * cartItem.quantity}"),
            trailing: Text("${cartItem.quantity} x"),
          ),
        ),
      ),
    );
  }
}
