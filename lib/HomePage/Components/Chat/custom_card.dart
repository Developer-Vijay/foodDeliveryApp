import 'package:flutter/material.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/Chat/individualpage.dart';
import 'package:shoppable_ecommerce_app/models.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({this.chat, this.sourceChat});
  final ChatModel sourceChat;
  final List chat;
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: widget.chat.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return IndividualPage(
                  chat: widget.chat[index],
                  sourcechat: widget.sourceChat,
                );
              },
            ));
          },
          leading: CircleAvatar(
            child: Icon(Icons.image),
            radius: 30,
          ),
          title: Text(
            widget.chat[index].name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          enabled: true,
          subtitle: Row(
            children: [
              Icon(Icons.done_all),
              Text(widget.chat[index].subtitle),
              Spacer(),
              Text(widget.chat[index].timing)
            ],
          ),
        );
      },
    ));
  }
}
