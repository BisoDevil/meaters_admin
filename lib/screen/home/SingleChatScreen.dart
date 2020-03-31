import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meaters_admin/model/ChatMessage.dart';
import 'package:meaters_admin/providers/ChatProvider.dart';
import 'package:provider/provider.dart';

class SingleChatScreen extends StatefulWidget {
  final String userName;

  SingleChatScreen({this.userName});

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.userName),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                reverse: true,
                children: <Widget>[
                  for (var item in provider.userMessages.reversed)
                    Bubble(
                      color: item.sender == "admin"
                          ? Theme.of(context).primaryColor
                          : Colors.white70,
                      margin: BubbleEdges.only(
                          top: 10,
                          left: item.sender == "admin"
                              ? MediaQuery.of(context).size.width * .4
                              : 0,
                          right: item.sender != "admin"
                              ? MediaQuery.of(context).size.width * .4
                              : 0),
                      padding: BubbleEdges.all(9),
                      alignment: item.sender == "admin"
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      nip: item.sender != "admin"
                          ? BubbleNip.leftBottom
                          : BubbleNip.rightBottom,
                      nipRadius: 4,
                      nipWidth: 30,
                      nipHeight: 10,
                      radius: Radius.circular(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            item.message,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: item.sender == "admin"
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            item.date,
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                    )
//
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 20,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                          filled: true,
                        ),
                        autocorrect: true,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).primaryColor,
                    ),
                    iconSize: 24,
                    color: Colors.blue,
                    onPressed: () {
                      var chatMessage = ChatMessage();
                      chatMessage.message = _messageController.text;
                      chatMessage.sender = "admin";
                      chatMessage.date =
                          DateFormat("hh:mm a").format(DateTime.now());
                      provider.addMessage(chatMessage);
                      _messageController.text = "";
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
