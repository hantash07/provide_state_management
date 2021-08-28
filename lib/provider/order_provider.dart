import 'package:flutter/material.dart';
import 'package:shop_app_flutter/model/oder.dart';

import 'cart.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orderList {
    return [..._orders];
  }

  void addOrder(List<Cart> cartList, double amount) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        amount: amount,
        cartItemList: cartList,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
