import 'dart:convert' as convert;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:meaters_admin/model/Order.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> myOrders;

  OrderProvider() {
    getOrders();
    initFirebase();
  }

  void initFirebase() {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure();
    _firebaseMessaging.subscribeToTopic("new_order");
    print("firbase started");
  }

  void getOrders() async {
    var res = await http.get(
        "https://meatersegy.com/wp-json/wc/v3/orders?order=desc&orderby=date",
        headers: {
          "Authorization":
              "Basic Y2tfYWNjZTRhY2YzYjBhODAxMjM0ZTQyODQxNWI5NTI1NTFmZTk5NzkzMjpjc18zNGM1ZjI1ZWUzYTdhOTNmZTcxOGNmZTUxNjhlODBmMTlhMTgwM2Zk"
        });

    if (res.statusCode == 200) {
      List<Order> list = [];
      var body = convert.jsonDecode(res.body);
      for (var item in body) {
        list.add(Order.fromMap(item));
      }
      myOrders = list;
    }

    notifyListeners();
  }

  Future<bool> completeOrder({Order order}) async {
    return await _updateOrder(order: order, status: "completed");
  }

  Future<bool> cancelOrder({Order order}) async {
    return await _updateOrder(order: order, status: "cancelled");
  }

  Future<bool> _updateOrder({Order order, String status}) async {
    order.status = status;
    var res = await http.put(
        "https://meatersegy.com/wp-json/wc/v3/orders/${order.id}",
        body: convert.jsonEncode(order.toMap()),
        headers: {
          "Authorization":
              "Basic Y2tfYWNjZTRhY2YzYjBhODAxMjM0ZTQyODQxNWI5NTI1NTFmZTk5NzkzMjpjc18zNGM1ZjI1ZWUzYTdhOTNmZTcxOGNmZTUxNjhlODBmMTlhMTgwM2Zk"
        });
    print(res.body);
    if (res.statusCode == 200) {
      notifyListeners();
      return true;
    }
    return false;
  }
}
