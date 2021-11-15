
import 'package:flutter/material.dart';

class ReplyMesaageCard extends StatelessWidget {
  final String message;
  const ReplyMesaageCard({this.message});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
       
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 40, bottom: 20, top: 10),
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 4,
                  child: Text(
                    "20:34",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
