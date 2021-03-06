import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            color: Colors.green[200],
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 80,bottom: 30,top: 10),
                  child: Text(message,style: TextStyle(color: Colors.black),),
                ),
                Positioned(
                  right: 10,
                  bottom: 4,
                  child: Row(
                    children: [Text("20:34",style: TextStyle(color: Colors.black,fontSize: 12),), 
                    SizedBox(width: 7,),
                    Icon(Icons.done_all,size: 18,)],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
