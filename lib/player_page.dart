import "package:flutter/material.dart";


class playerPage extends StatefulWidget {
  const playerPage({super.key});

  @override
  State<playerPage> createState() => _playerPageState();
}

class _playerPageState extends State<playerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Pemutar", style: TextStyle(fontFamily: "Futura"),),),
    );
  }
}