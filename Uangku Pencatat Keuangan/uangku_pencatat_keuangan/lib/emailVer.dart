import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uangku_pencatat_keuangan/home.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    bool isVerifiedEmail = false;
    Timer timer;

    checkEmailVerified() async {
      await FirebaseAuth.instance.currentUser.reload();

      setState(() {
        isVerifiedEmail = FirebaseAuth.instance.currentUser.emailVerified;
        print("STATUS VERIFIED: $isVerifiedEmail");
      });

      if (isVerifiedEmail) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email berhasil Terverifikasi.")));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    HomeScreen(FirebaseAuth.instance.currentUser.uid))));
        timer.cancel();
      }
    }

    @override
    void initState() {
      super.initState();

      FirebaseAuth.instance.currentUser.sendEmailVerification();
      checkEmailVerified();
      timer =
          Timer.periodic(Duration(seconds: 3), (timer) => checkEmailVerified());
    }

    @override
    dispose() {
      super.dispose();
      timer.cancel();
    }

    return Expanded(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
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
                          child: Text("Verifikasi",
                              style:
                                  TextStyle(fontSize: 40, fontFamily: "Inter")),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 30),
                          child: Text(
                              "Silakan cek Email inbox anda. jika tidak ada kemungkinan ada di Spam.",
                              style:
                                  TextStyle(fontSize: 12, fontFamily: "Inter")),
                        ),
                        Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                ),
                                onPressed: () {
                                  FirebaseAuth.instance.currentUser
                                      .sendEmailVerification();
                                  checkEmailVerified();
                                },
                                child: Text("Kirim Ulang",
                                    style: TextStyle(color: Colors.black))))
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
