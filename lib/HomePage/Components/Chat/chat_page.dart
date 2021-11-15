import 'package:flutter/material.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/Chat/custom_card.dart';

import '../../../models.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({this.chat, this.sourcechat});
  final ChatModel sourcechat;
  final List chat;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return CustomCard(
          sourceChat: widget.sourcechat,
          chat: widget.chat,
        );
      },
    ));
  }
}
