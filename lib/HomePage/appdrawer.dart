import 'package:flutter/material.dart';



class Appdrawer extends StatefulWidget {
  @override
  _AppdrawerState createState() => _AppdrawerState();
}

class _AppdrawerState extends State<Appdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.only(bottom: 5, top: 3),
              decoration: BoxDecoration(
                color: Color(0xFF3498E5),
              ),
              child: CircleAvatar(child: Text("Hello"),)),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            dense: true,
            selected: true,
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('MyOrders'),
            dense: true,
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => MyOrders()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Wishlist'),
            dense: true,
            onTap: () {
             
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            dense: true,
            
              // Update the state of the app.
              // ...
            
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Wallet'),
            dense: true,
            onTap: () {
             
              // Update the state of the app.
              // ...
            },
          ),
          Divider(
            color: Colors.blue,
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            dense: true,
            onTap: () {
            
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.help_center),
            title: Text('Help & Support'),
            dense: true,
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            dense: true,
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            dense: true,
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),

            dense: true,
            onTap: (){},
            // onTap: () async {
            //   if (widget.cStatus == 1) {
            //     return showDialog(
            //         context: context,
            //         builder: (context) => AlertDialog(
            //               title: Text("Do you really want to logout"),
            //               actions: [
            //                 FlatButton(
            //                   child: Text("Yes"),
            //                   onPressed: () async {
            //                     Navigator.pop(context);
            //                     Navigator.pop(context);

            //                     SharedPreferences prefs =
            //                         await SharedPreferences.getInstance();
            //                     prefs.remove(
            //                       'name',
            //                     );
            //                     prefs.remove('sessionToken');
            //                     prefs.remove('refreshToken');
            //                     prefs.remove('userNumber');
            //                     prefs.remove('userProfile');
            //                     prefs.remove('customerName');
            //                     prefs.remove('userId');
            //                     prefs.remove('loginId');
            //                     prefs.remove('userEmail');
            //                     prefs.remove("loginBy");
            //                     takeUser = null;
            //                     emailid = null;
            //                     photo = null;

            //                     prefs.setBool("_isAuthenticate", false);
            //                     setState(() {
            //                       loginstatus = 0;
            //                     });
            //                     Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (context) => LoginPage()));
            //                   },
            //                 ),
            //                 FlatButton(
            //                   child: Text("No"),
            //                   onPressed: () {
            //                     Navigator.pop(context);
            //                   },
            //                 )
            //               ],
            //             ));
            //   }

            //   // Update the state of the app.
            //   // ...
            // },
          ),
        ],
      ),
    );
  }
}