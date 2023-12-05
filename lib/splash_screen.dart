import "package:flutter/material.dart";


class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Center(child: Image.asset("assets/img/Logo.png")), Text("Created by \n Aril Saputra", style: TextStyle(fontSize: 15,decoration: TextDecoration.none,color: Colors.black),)],),
    );
  }
}