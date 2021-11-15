import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppable_ecommerce_app/HomePage/Components/Chat/Functionality/database_functions.dart';
import 'package:shoppable_ecommerce_app/local_database_helper.dart';
import 'package:shoppable_ecommerce_app/notfications.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // AuthMethods authMethods = new AuthMethods();
  bool _isValidate = false;
  var _nameValidate;
  var _emailValidate;
  var _phoneValidate;
  var _passwordValidate;

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Notifications notification = Notifications();
  LocalDatabseHelper localDatabseHelper = LocalDatabseHelper();
  Databasefunction databasefunction = new Databasefunction();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Container(
                child: ListView(children: [
      Column(children: [
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
        Text("Signup",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    color: Colors.black, letterSpacing: .5, fontSize: 40))),
        SizedBox(
          height: size.height * 0.06,
        ),
        // Name  TextField
        Container(
          margin: EdgeInsets.only(
              left: size.width * 0.03, right: size.width * 0.03),
          child: TextField(
            controller: _nameController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(26.0),
                ),
              ),
              labelText: 'Name',
              errorText: _nameValidate,
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        // EmailId Field
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
              labelText: 'Email',
              errorText: _emailValidate,
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        // Phone Field
        Container(
          margin: EdgeInsets.only(
              left: size.width * 0.03, right: size.width * 0.03),
          child: TextField(
            controller: _phoneController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(26.0),
                ),
              ),
              labelText: 'Phone Number',
              errorText: _phoneValidate,
              prefixIcon: Icon(Icons.phone),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        // Password Name Field
        Container(
          margin: EdgeInsets.only(
              left: size.width * 0.03, right: size.width * 0.03),
          child: TextField(
            obscureText: _obscureText,
            controller: _passwordController,
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
                    (_obscureText ? Icons.visibility_off : Icons.visibility),
                    size: 17,
                  )),
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),

        MaterialButton(
          child: Text(
            "Signup",
            style: TextStyle(
                fontSize: size.height * 0.028, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            signup();
          },
          color: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
          textColor: Colors.white,
          height: size.height * 0.06,
          minWidth: size.width * 0.9,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Have an account",
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              minWidth: 60,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.green[700],
                ),
              ),
            )
          ],
        ),
      ])
    ]))));
  }

  Future<AuthResult> signup() async {
// For Name Validateion

    if (_nameController.text.isEmpty) {
      setState(() {
        _nameValidate = "Please enter your name";
        _isValidate = true;
      });
    } else {
      _nameValidate = null;
      _isValidate = false;
    }
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
        _isValidate = false;
      });
    } else {
      _passwordValidate = null;
      _isValidate = true;
    }

    // Phone
    if (_phoneController.text.isEmpty) {
      setState(() {
        _phoneValidate = "Mobile number Cant be empty ";
        _isValidate = false;
      });
    } else if (_phoneController.text.length < 10) {
      _phoneValidate = "Mobile number should be of 10 digit ";
      _isValidate = false;
    } else {
      setState(() {
        _phoneValidate = null;
        _isValidate = true;
      });
    }
   
    if (_isValidate == true) {
      Map<String, String> userMap = {
        "name": _nameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "phonenumber": _phoneController.text,
      };
      try {
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
        FirebaseUser user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _emailController.text))
            .user;

        databasefunction.uploaduserInfo(userMap);
        Fluttertoast.showToast(msg: "Succesfully Register");
        notification.scheduleNotification(
            "Success", "Congrats you are Succesfully Registered");
        LocalDatabseHelper.saveUserNameInLocalStorage(_nameController.text);
        LocalDatabseHelper.saveUserEmail(_emailController.text);
        LocalDatabseHelper.getUserPhoneInLocalStorage(_phoneController.text);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ));
      } catch (e) {
        Fluttertoast.showToast(msg: "Invalid email");
      }
    }
  }
}
