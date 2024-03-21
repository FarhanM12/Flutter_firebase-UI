import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;
const ChatPage({
  super.key,
  required this.receiverUserEmail,
  required this.receiverUserId,

});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text(widget.receiverUserEmail)),
    );
  }
}