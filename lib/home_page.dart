import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "SELAMAT DATANG",
              style: TextStyle(fontFamily: "Futura"),
            ),
            leading: Image.asset("assets/img/Logo.png")),
        body: Container());
  }
}
