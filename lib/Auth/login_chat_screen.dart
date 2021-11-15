import 'package:flutter/material.dart';
import 'package:shoppable_ecommerce_app/HomePage/home_screen.dart';
import 'package:shoppable_ecommerce_app/models.dart';

class LoginChatScreen extends StatefulWidget {
  @override
  _LoginChatScreenState createState() => _LoginChatScreenState();
}

class _LoginChatScreenState extends State<LoginChatScreen> {
  @override
  Widget build(BuildContext context) {
    ChatModel sourceChat;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(29.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Pleaese Choose the Person or Parent for the Chat"),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: chat.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    sourceChat = chat.removeAt(index);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                  chat: chat,
                                  sourcechat: sourceChat,
                                )));
                  },
                  child: ListTile(
                    enabled: true,
                    title: Text("${chat[index].name}"),
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
