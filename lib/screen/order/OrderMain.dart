import 'package:flutter/material.dart';
import 'package:meaters_admin/providers/OrderProvider.dart';
import 'package:meaters_admin/screen/order/order_item.dart';
import 'package:provider/provider.dart';

class OrderMainScreen extends StatefulWidget {
  @override
  _OrderMainScreenState createState() => _OrderMainScreenState();
}

class _OrderMainScreenState extends State<OrderMainScreen> {
  @override
  Widget build(BuildContext context) {
    OrderProvider provider = Provider.of<OrderProvider>(context);
    return provider.myOrders == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: provider.myOrders.length,
            itemBuilder: (BuildContext context, int index) => OrderItem(
              order: provider.myOrders[index],
            ),
          );
  }
}
