import 'package:flutter/material.dart';
import 'package:meaters_admin/model/Order.dart';
import 'package:meaters_admin/providers/OrderProvider.dart';
import 'package:provider/provider.dart';

class OrderDetail extends StatefulWidget {
  final Order order;

  OrderDetail({this.order});

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  Order order;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    order = widget.order;
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider provider = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Number #${order.number}"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Client",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${order.shipping.firstName} ${order.shipping.lastName}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Phone number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${order.shipping.phone}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
            ),
            for (var item in order.lineItems)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Text(item.name)),
                    SizedBox(
                      width: 15,
                    ),
                    Text("x${item.quantity}"),
                    SizedBox(width: 20),
                    Text("${item.total} EGP",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            Container(
              decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Subtotal",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "${order.lineItems.fold(0, (sum, e) => sum + double.parse(e.total))} EGP",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total Tax",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "${order.totalTax} EGP",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "${order.total} EGP",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  order.status.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(height: 15),
            Stack(children: <Widget>[
              Container(
                height: 6,
                decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(3)),
              ),
              if (order.status == "processing")
                Container(
                  height: 6,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3)),
                ),
              if (order.status != "processing")
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3)),
                ),
            ]),
            SizedBox(height: 40),
            Text("Shipping address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            if (order.billing != null)
              Text(order.billing.address1 +
                  ", " +
                  order.billing.city +
                  ", " +
                  order.billing.country),
            SizedBox(
              height: 20,
            ),
            if (order.status == "pending")
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton.icon(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          isLoading =
                              !await provider.completeOrder(order: order);
                        },
                        color: Colors.green,
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Complete",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: FlatButton.icon(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          isLoading = !await provider.cancelOrder(order: order);
                        },
                        color: Colors.red,
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            if (isLoading)
              SizedBox(
                height: 70,
                child: Center(child: CircularProgressIndicator()),
              )
          ],
        ),
      ),
    );
  }

  String formatTime(DateTime time) {
    return "${time.day}/${time.month}/${time.year}";
  }
}

class BoxComment extends CustomPainter {
  final Color color;

  BoxComment({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = color;
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 10);
    path.lineTo(30, size.height - 10);
    path.lineTo(20, size.height);
    path.lineTo(20, size.height - 10);
    path.lineTo(0, size.height - 10);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
