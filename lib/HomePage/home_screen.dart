import 'package:flutter/material.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/Chat/chat_page.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/Chat/search_field.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/home_page_body.dart';
import 'package:shoppable_ecommerce_app/HomePage/TabbarMainPage/tab_bar.dart';
import 'package:shoppable_ecommerce_app/models.dart';
import 'package:shoppable_ecommerce_app/notfications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({this.chat, this.sourcechat});
  final ChatModel sourcechat;
  final List chat;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _page = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _controller;
  Notifications notifications = Notifications();

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  List<Widget> _widgetOptions = <Widget>[
    HomePageBody(),
    Text('Categories',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Explore Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('User', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  Widget build(BuildContext context) {
    Size sized = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: Text('Are you sure you want to quit?'),
                    actions: <Widget>[
                      RaisedButton(
                          child: Text('Yes'),
                          onPressed: () => Navigator.of(context).pop(true)),
                      RaisedButton(
                          child: Text('No'),
                          onPressed: () => Navigator.of(context).pop(false)),
                    ]));
      },
      child: SafeArea(
        child: Scaffold(
          body: TabBarView(
            controller: _controller,
            children: [
              ShowStudents(),
              ChatPage(
                sourcechat: widget.sourcechat,
                chat: widget.chat,
              ),
            ],
          ),
          appBar: AppBar(
            bottom: TabBar(
              controller: _controller,
              tabs: [
                Text("Student Section"),
                Tab(
                  child: Text("Chat"),
                )
              ],
            ),
            leading: InkWell(onTap: () {}, child: Icon(Icons.menu)),
            title: Row(
              children: [Text("Chat")],
            ),
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchField()));
                  },
                  child: Icon(Icons.search)),
              SizedBox(
                width: 12,
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text("Hello"),
                    )
                  ];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
