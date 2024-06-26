import "package:flutter/material.dart";
import "package:rol_music/home_page.dart";

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    goToHomeScreen(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 80,
          ),
          Image.asset("assets/img/Logo.png"),
          SizedBox(
            height: 20,
          ),
          Text("Version beta 0.1",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.black)),
          Text(
            "Created by\nAril Saputra",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.none,
                color: Colors.black),
          )
        ],
      ),
    );
  }

  goToHomeScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3)).then((value) => {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return HomePage();
          }))
        });
  }
}
