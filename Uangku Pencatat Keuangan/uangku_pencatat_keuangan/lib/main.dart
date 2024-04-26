import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uangku_pencatat_keuangan/custom_colors.dart';
import 'package:uangku_pencatat_keuangan/firebase_options.dart';
import 'package:uangku_pencatat_keuangan/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAS_Rxf2csoFKuIoYVJ_dWdxhknGjFS3l4",
          appId: "1:713929882960:web:24eb93a22221e4bf22c055",
          messagingSenderId: "713929882960",
          projectId: "uangku-application"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
