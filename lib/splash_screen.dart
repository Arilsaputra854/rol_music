import "package:flutter/material.dart";
import "package:rol_music/home_page.dart";

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    goToHomeScreen(context);

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 80,),
          Image.asset("assets/img/Logo.png"),
          Text(
            "Created by \n Aril Saputra",
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
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return HomePage();
       }))
    });
  }
}
