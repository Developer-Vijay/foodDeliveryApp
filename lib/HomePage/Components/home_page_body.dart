import 'package:flutter/material.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/small_category_slider.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [Categorymini()],
        ),
      ),
    );
  }
}
