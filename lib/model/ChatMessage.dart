// To parse this JSON data, do
//
//     final chatMessage = chatMessageFromJson(jsonString);

import 'dart:convert';

ChatMessage chatMessageFromJson(String str) =>
    ChatMessage.fromMap(json.decode(str));

String chatMessageToJson(ChatMessage data) => json.encode(data.toMap());

class ChatMessage {
  String date;
  String sender;
  String message;

  ChatMessage({
    this.date,
    this.sender,
    this.message,
  });

  factory ChatMessage.fromMap(Map<dynamic, dynamic> json) => ChatMessage(
        date: json["date"],
        sender: json["sender"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "date": date,
        "sender": sender,
        "message": message,
      };
}
