import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/Chat/Functionality/database_functions.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

TextEditingController _searchFieldController = TextEditingController();
Databasefunction databasefunction = Databasefunction();

class _SearchFieldState extends State<SearchField> {
  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.documents.length,
            itemBuilder: (context, index) {
              return searchTile(
                email: searchSnapshot.documents[index].data["email"],
                userName: searchSnapshot.documents[index].data["name"],
              );
            },
          )
        : Container();
  }

  QuerySnapshot searchSnapshot;
  initiateSearch() {
    databasefunction.getusername(_searchFieldController.text).then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search field"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          colors: [Colors.green, Colors.greenAccent],
                          end: Alignment.centerRight)),
                  child: TextField(
                    controller: _searchFieldController,
                    enabled: true,
                    style: TextStyle(color: Colors.white),
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        prefixIcon: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.search),
                          onPressed: () {
                            initiateSearch();
                          },
                        )),
                  ),
                ),
              ),
              Container(
                child: searchList(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class searchTile extends StatelessWidget {
  String userName;
  String email;
  searchTile({this.email, this.userName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(userName),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    textColor: Colors.white,
                    child: Text("Message"),
                  ),
                )
              ],
            ),
            Text(email),
          ],
        ),
      ),
    );
  }
}
