import 'dart:collection';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:meaters_admin/model/ChatMessage.dart';

class ChatProvider extends ChangeNotifier {
  FirebaseApp app;
  DatabaseReference _messagesRef;
  DatabaseReference _userRef;
  Map<String, List<ChatMessage>> messages = {};
  List<ChatMessage> userMessages = [];

  ChatProvider() {
    _startFirbaseApp();
  }
  _startFirbaseApp() async {
    app = await FirebaseApp.configure(
      name: 'db2',
      options: Platform.isIOS
          ? const FirebaseOptions(
              googleAppID: '1:978795736687:ios:d44850e09591911fab279a',
              gcmSenderID: '978795736687',
              apiKey: 'AIzaSyAStkIkO5fgczl61pcvb49iozDXpVf1Khg',
              databaseURL: 'https://meaters-11c47.firebaseio.com',
            )
          : const FirebaseOptions(
              googleAppID: '1:978795736687:android:ce099e8bfcb64cbeab279a',
              apiKey: 'AIzaSyDjtae-IHrawSM8UrS22OKFo5_ttoTsy_0',
              databaseURL: 'https://meaters-11c47.firebaseio.com',
            ),
    );
    FirebaseDatabase database = FirebaseDatabase(app: app);
    _messagesRef = database.reference().child('messages');
    _messagesRef.limitToLast(40).onChildChanged.listen((onData) {
      print(onData.snapshot.value);
      _setupChatHome(onData.snapshot);
    });
    _messagesRef.limitToLast(40).once().then((data) {
      var list = data.value as Map<dynamic, dynamic>;
      for (var item in list.entries) {
        var chatList = (item.value as Map<dynamic, dynamic>).values;
        List<ChatMessage> userMessages = [];
        for (var item in chatList) {
          var chatMessage = ChatMessage.fromMap(item);
          userMessages.add(chatMessage);
        }

        messages[item.key] = userMessages;
      }
      messages = LinkedHashMap.fromEntries(messages.entries.toList().reversed);
      notifyListeners();
    });
  }

  _setupChatHome(DataSnapshot data) {
    var chatList = (data.value as Map<dynamic, dynamic>).values;
    List<ChatMessage> userMessages = [];
    for (var item in chatList) {
      var chatMessage = ChatMessage.fromMap(item);
      userMessages.add(chatMessage);
    }
    messages.remove(data.key);
    messages[data.key] = userMessages;

    messages = LinkedHashMap.fromEntries(messages.entries.toList().reversed);

    notifyListeners();
  }

  subscribeToUser({String userId}) {
    FirebaseDatabase database = FirebaseDatabase(app: app);
    _userRef = database.reference().child('messages/$userId');
    _userRef.limitToLast(30).once().then((value) {});
    _userRef.onChildAdded.listen((value) {
      var chatMessage = ChatMessage.fromMap(value.snapshot.value);
      userMessages.add(chatMessage);
      notifyListeners();
    });
  }

  addMessage(ChatMessage message) {
    _userRef.push().set(message.toMap());
    notifyListeners();
  }

  removeUserRef() {
    _userRef.remove();
  }
}
