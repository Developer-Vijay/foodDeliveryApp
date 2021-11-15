import 'package:flutter/material.dart';

class Categorymini extends StatefulWidget {
  @override
  _CategoryminiState createState() => _CategoryminiState();
}

class _CategoryminiState extends State<Categorymini> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 3,
                                                color: Colors.blueGrey,
                                                spreadRadius: 1)
                                          ],
                                        ),
                                        margin:
                                            EdgeInsets.only(left: size.width * 0.011),
                                        height: size.height * 0.08,
                                        width: size.width * 0.24,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: FlatButton(
                                            onPressed: () {},
                                            child: ClipOval(
                                                child:Text("Data")
                                                
                                                      ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text("Data",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.height * 0.014),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
  }
}
