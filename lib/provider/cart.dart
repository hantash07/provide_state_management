import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {  //Updating the cart quantity if the product already exist otherwise add new cart into list
      _items.update(
        productId,
        (oldItem) => CartItem(
          id: oldItem.id,
          title: oldItem.title,
          quantity: (oldItem.quantity + 1),
          price: oldItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
  }
}
