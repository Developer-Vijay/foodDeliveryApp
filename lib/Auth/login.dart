import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shoppable_ecommerce_app/Auth/Services/firebase_auth.dart';
import 'package:shoppable_ecommerce_app/Auth/Services/googleauth.dart';
import 'package:shoppable_ecommerce_app/Auth/login_chat_screen.dart';
import 'package:shoppable_ecommerce_app/Auth/signup.dart';
import 'package:shoppable_ecommerce_app/HomePage/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var _emailValidate;
  var _passwordValidate;
  bool _isValidate = false;
  bool _obscureText = true;
  String id;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  var email;
  var password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(userId: user.uid) : null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    "asset/images/MainLogo.png",
                    height: size.height * 0.16,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text("Login",
                    style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                            color: Colors.black,
                            letterSpacing: .5,
                            fontSize: 40))),
                SizedBox(
                  height: size.height * 0.06,
                ),
                // Email  TextField
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.03, right: size.width * 0.03),
                  child: TextField(
                    controller: _emailController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(26.0),
                        ),
                      ),
                      labelText: 'Email/UserName',
                      errorText: _emailValidate,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                // Password Field
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.03, right: size.width * 0.03),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(26.0),
                        ),
                      ),
                      labelText: 'Password',
                      errorText: _passwordValidate,
                      suffixIcon: InkWell(
                          onTap: _toggle,
                          child: new Icon(
                            (_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            size: 17,
                          )),
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            color: Colors.blue[900]),
                      ),
                    )),
                MaterialButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: size.height * 0.028,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    login();
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26)),
                  textColor: Colors.white,
                  height: size.height * 0.06,
                  minWidth: size.width * 0.9,
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        height: 2.0,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3.0),
                      child: Text("OR",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        height: 2.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Login With Facebook
                    IconButton(
                      icon: SvgPicture.asset('asset/images/facebook.svg'),
                      tooltip: 'Login With Facebook',
                      iconSize: 40,
                      onPressed: () {},
                    ),
                    //Login With Google
                    IconButton(
                      icon: SvgPicture.asset('asset/images/google.svg'),
                      tooltip: 'Login With Goolge',
                      iconSize: 40,
                      onPressed: () => googleSignin().whenComplete(() =>
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginChatScreen()))),
                    ),
                  ],
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Not yet account",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.black),
                    ),
                    FlatButton(
                      padding: EdgeInsets.zero,
                      minWidth: 60,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.green[700]),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  void login() async {
    // Email
    if (_emailController.text.isEmpty) {
      setState(() {
        _emailValidate = "Please enter the email address";
        _isValidate = true;
      });
    } else {
      _emailValidate = null;
      _isValidate = false;
    }
    // Password

    if (_passwordController.text.isEmpty) {
      _passwordValidate = "Please enter the passsword";
      _isValidate = true;
    } else if (!RegExp(
            r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
        .hasMatch(_passwordController.text)) {
      setState(() {
        _passwordValidate =
            "password must contain a Capiatl word , special character , number ";
        _isValidate = true;
      });
    } else {
      _passwordValidate = null;
      _isValidate = false;
    }
    if (_isValidate != true) {
    //   Map data = {
    //     "username": _emailController.text,
    //     "password": _passwordController.text
    //   };
    //   var bodydata=jsonEncode(data);
    //   var response =
    //       await http.post('http://10.0.2.2:5000/user/login', body: bodydata,headers: {
    //         "application-type":"contenttype/json"
    //       });
    //   var responseData = jsonDecode(response.body);
    //   if (response.statusCode == 200) {
    //     Fluttertoast.showToast(msg: "worked");
    //   } else {
    //     print(response.statusCode);
    //     Fluttertoast.showToast(msg: "Failed");
    //   }
      try {
        setState(() {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (_) => new AlertDialog(
                      content: Row(
                    children: [
                      CircularProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Loading"),
                      ),
                    ],
                  )));
        });
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text))
            .user;
        id = user.uid;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('userId', id);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginChatScreen()));
      } catch (e) {
        switch (e.code) {
          case 'ERROR_INVALID_EMAIL':
            Fluttertoast.showToast(msg: e.code);
            break;
          case 'ERROR_USER_NOT_FOUND':
            Fluttertoast.showToast(msg: e.code);
        }
      }
    } else {
      Fluttertoast.showToast(msg: "Invalid Id and Password");
    }
  }
}
