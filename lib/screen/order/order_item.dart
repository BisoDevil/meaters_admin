import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meaters_admin/model/Order.dart';
import 'package:meaters_admin/screen/order/order_details.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  final VoidCallback onRefresh;

  OrderItem({this.order, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderDetail(
                    order: order,
                    onRefresh: onRefresh,
                  )),
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Color(0xFFEEEEEE),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("#${order.number}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                IconButton(icon: Icon(Icons.arrow_right), onPressed: () {})
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Order date"),
                Text(
                  DateFormat("dd/MM/yyyy").format(order.dateCreated),
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Status"),
                Text(
                  order.status.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Payment method"),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Text(
                  order.paymentMethodTitle,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total"),
                Text(
                  "${order.total} EGP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Divider()
        ],
      ),
    );
  }
}
