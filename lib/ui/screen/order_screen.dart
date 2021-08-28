import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/provider/order_provider.dart';
import 'package:shop_app_flutter/ui/widget/app_drawer.dart';
import 'package:shop_app_flutter/ui/widget/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/order_screen";

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    print(orderProvider.orderList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: orderProvider.orderList.length,
        itemBuilder: (ctx, i) => OrderItem(orderProvider.orderList[i]),
      ),
      drawer: AppDrawer(),
    );
  }
}
