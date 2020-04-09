import 'package:flutter/material.dart';
import 'package:meaters_admin/screen/order/OrderMain.dart';

import 'home/ChatMainScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meater Admin"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Order",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Tab(
                child: Text(
                  "Chat",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[ChatMainScreen(), OrderMainScreen()],
        ),
      ),
    );
  }
}
