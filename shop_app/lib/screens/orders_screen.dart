import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItem(ordersData.orders[index]),
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
