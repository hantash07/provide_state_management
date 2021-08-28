
import 'package:shop_app_flutter/provider/cart.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> cartItemList;
  final DateTime dateTime;

  Order({required this.id, required this.amount, required this.cartItemList, required this.dateTime});
}