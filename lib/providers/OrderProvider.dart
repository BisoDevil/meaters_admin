import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:meaters_admin/model/Order.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> myOrders;

  OrderProvider() {
    getOrders();
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
}
