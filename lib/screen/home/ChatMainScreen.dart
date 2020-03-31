import 'package:flutter/material.dart';
import 'package:meaters_admin/providers/ChatProvider.dart';
import 'package:meaters_admin/screen/home/SingleChatScreen.dart';
import 'package:provider/provider.dart';

class ChatMainScreen extends StatefulWidget {
  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    var chatProvider = Provider.of<ChatProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (var item in chatProvider.messages.entries)
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                      item.value.firstWhere((u) => u.sender != "admin").sender),
                  subtitle: Text(item.value.last.message),
                  leading: CircleAvatar(
                    child: Icon(Icons.account_box),
                  ),
                  trailing: Text(item.value.last.date),
                  onTap: () {
                    chatProvider.subscribeToUser(userId: item.key);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SingleChatScreen(
                              userName: item.value
                                  .firstWhere((u) => u.sender != "admin")
                                  .sender,
                            )));
                  },
                ),
                Divider(
                  height: 1,
                  indent: 70,
                  endIndent: 20,
                )
              ],
            ),
        ],
      ),
    );
  }
}
