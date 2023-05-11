import 'package:flutter/material.dart';
import 'package:uangku_pencatat_keuangan/custom_colors.dart';
import 'package:uangku_pencatat_keuangan/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uangku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: custom_colors.Yellow,
          appBarTheme: AppBarTheme(color: Colors.white)),
      home: Splashscreen(),
    );
  }
}
