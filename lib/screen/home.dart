import 'package:flutter/material.dart';

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
                text: "Chat",
                icon: Icon(Icons.chat),
              ),
              Tab(
                icon: Icon(Icons.shopping_basket),
                text: "Orders",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[ChatMainScreen(), Text("tab")],
        ),
      ),
    );
  }
}
