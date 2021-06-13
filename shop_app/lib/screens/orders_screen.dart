import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  // // var _isLoading = false;
  // @override
  // void initState() {
  //   // setState(() {
  //   //   _isLoading = true;
  //   // });
  //   // Provider.of<Orders>(
  //   //   context,
  //   //   listen: false,
  //   // ).fetchAndSetOrders().then((_) {
  //   //   setState(() {
  //   //     _isLoading = false;
  //   //   });
  //   // });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final ordersData = Provider.of<Orders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('An error occurd!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (context, ordersData, child) => ListView.builder(
                  itemBuilder: (context, index) =>
                      OrderItem(ordersData.orders[index]),
                  itemCount: ordersData.orders.length,
                ),
              );
            }
          }
        },
        future: Provider.of<Orders>(
          context,
          listen: false,
        ).fetchAndSetOrders(),
      ),
    );
  }
}
