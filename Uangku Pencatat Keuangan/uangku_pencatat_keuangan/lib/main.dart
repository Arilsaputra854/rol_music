import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uangku_pencatat_keuangan/custom_colors.dart';
import 'package:uangku_pencatat_keuangan/firebase_options.dart';
import 'package:uangku_pencatat_keuangan/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
