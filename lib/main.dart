import 'package:flutter/material.dart';
import 'StartupPages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shoppify",
      home: SpashScreen(),
      // home: LoginChatScreen()
    );
  }
}
