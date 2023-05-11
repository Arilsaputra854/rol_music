import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uangku_pencatat_keuangan/home.dart';
import 'package:uangku_pencatat_keuangan/register.dart';

class login_page extends StatefulWidget {
  const login_page({Key key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController UsernameController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  String _username = "", _password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    UsernameController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
                //extends parents view problem
                body: Stack(
              children: [
                Align(
                  child: SvgPicture.asset(
                    "assets/img/Ellipse.svg",
                    height: 200,
                    width: 200,
                  ),
                  alignment: Alignment.topRight,
                ),
                Container(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, bottom: 10),
                          child: Image.asset(
                            "assets/img/uangku_logo.png",
                            scale: 11,
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 30),
                        child: Text(
                          "Silakan Login",
                          style: TextStyle(fontSize: 40, fontFamily: "Inter"),
                        ),
                      ),
                      Form(
                          key: _formKey,
                          child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Username",
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: "Inter")),
                                  Container(
                                    color: Colors.white,
                                    margin:
                                        EdgeInsets.only(bottom: 10, top: 10),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Please enter your username.";
                                          }
                                        },
                                        controller: UsernameController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        )),
                                  ),
                                  Text("Password",
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: "Inter")),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Please enter your password.";
                                          }
                                        },
                                        obscureText: true,
                                        controller: PasswordController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        RegisterButtonPressed();
                                      },
                                      child: Text(
                                        "Register",
                                      ),
                                    ),
                                  ),
                                  Center(
                                      child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.yellow,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)))),
                                    onPressed: () {
                                      LoginButtonPressed();
                                    },
                                    child: Container(
                                        width: 200,
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: "Inter",
                                                color: Colors.black),
                                          ),
                                        )),
                                  ))
                                ],
                              )))
                    ],
                  ),
                ))
              ],
            ))));
  }

  void LoginButtonPressed() {
    if (_formKey.currentState.validate()) {
      _username = UsernameController.text;
      _password = PasswordController.text;

      Fluttertoast.showToast(msg: "data: " + _username + " & " + _password);

      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Home(_username))));
    }
  }

  void RegisterButtonPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }
}
