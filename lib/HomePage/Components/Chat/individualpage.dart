import 'package:flutter/material.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/Chat/own_mesaage_card.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/Chat/reply_card.dart';
import 'package:shoppable_ecommerce_app/Models/MessageModel.dart';
import 'package:shoppable_ecommerce_app/models.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage({this.sourcechat, this.chat});
  final ChatModel sourcechat;
  final ChatModel chat;
  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  IO.Socket socket;
  bool show = false;
  TextEditingController _controller = TextEditingController();
  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io("https://lit-lowlands-31351.herokuapp.com", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((data) {
      print("Connected...");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
      });
    });
    print("socket.connected");
    socket.emit("signin", widget.sourcechat.id);
  }

  void sendMesage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message);
    setState(() {
      setState(() {
        messages.add(messageModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          leadingWidth: 75,
          leading: Row(
            children: [
              SizedBox(
                width: 4,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
              SizedBox(
                width: 6,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
              ),
            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "last seen today at 10:30 AM",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          actions: [
            Icon(Icons.call),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("Hi"),
                  ),
                  PopupMenuItem(
                    child: Text("Hello2"),
                  )
                ];
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height - 140,
                child: ListView.builder(
                  itemCount: messages.length,
                  // ignore: missing_return
                  itemBuilder: (context, index) {
                    if (messages[index].type == "source") {
                      return OwnMessageCard(
                        message: messages[index].message,
                      );
                    } else {
                      return ReplyMesaageCard(
                        message: messages[index].message,
                      );
                    }
                  },
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                    width: size.width - 55,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: TextField(
                          maxLines: 5,
                          minLines: 1,
                          controller: _controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Send Mesaage",
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.attach_file),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.camera_alt),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              prefixIcon: Icon(Icons.emoji_emotions_outlined)),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CircleAvatar(
                      radius: 25,
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                        ),
                        onPressed: () {
                          sendMesage(_controller.text, widget.sourcechat.id,
                              widget.chat.id);
                          _controller.clear();
                        },
                      ),
                    ),
                  ),
                  //  show ? emojiSelect() : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      rows: 4,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        print(emoji);
      },
    );
  }
}
