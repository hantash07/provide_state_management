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
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text(
              'Do you want to remove the item from the cart?',
            ),
            actions: <Widget>[
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        final cartProvider = Provider.of<CartProvider>(context, listen: false);
        cartProvider.removeItem(productId);
      },
      child: Card(
        elevation: 2,
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
                  child: Text("\$${cartItem.price.toStringAsFixed(2)}"),
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
