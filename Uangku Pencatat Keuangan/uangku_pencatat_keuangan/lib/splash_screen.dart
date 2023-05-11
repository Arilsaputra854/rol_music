import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uangku_pencatat_keuangan/home.dart';
import 'package:uangku_pencatat_keuangan/login.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => login_page())));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(child: Image.asset("assets/img/uangku_logo.png", scale: 8)),
          SizedBox(
            height: 20,
          ),
          Text(
            "UangKu",
            style: TextStyle(fontSize: 30, fontFamily: "Futura"),
          )
        ]),
      ),
    );
  }
}
