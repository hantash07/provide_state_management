import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/provider/cart.dart';
import 'package:shop_app_flutter/provider/order_provider.dart';
import 'package:shop_app_flutter/ui/widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart_screen";

  @override
  Widget build(BuildContext context) {
    print("CartScreen's build() is called");
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Card(
            elevation: 4,
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      "\$${cartProvider.totalAmount}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      //Adding order
                      final orderProvider = Provider.of<OrderProvider>(context, listen: false);
                      orderProvider.addOrder(
                        cartProvider.items.values.toList(),
                        cartProvider.totalAmount,
                      );
                      //Clearing the cart once order is added
                      cartProvider.clearCart();
                    },
                    child: Text("Order Now!"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (_, index) => CartItem(
                productId: cartProvider.items.keys.toList()[index],
                cartItem: cartProvider.items.values.toList()[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
