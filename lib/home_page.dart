import "package:flutter/material.dart";
import "package:rol_music/player_page.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: Text(
            "SELAMAT DATANG",
            style: TextStyle(fontFamily: "Futura"),
          ),
          leading: Image.asset("assets/img/Logo.png")),
      body: Container(
        child: listData(),
      ),
    );
  }

  listData() {
    List<String> dummyData = ["Peterpan - hooh"];

    if (dummyData.isNotEmpty) {
      return ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (BuildContext context, int position) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Card(
                child: InkWell(
                    onTap: () {
                      goToPlayerPage(context);
                    },
                    child: Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: Text(dummyData[position]))),
                elevation: 2,
              ),
            );
          });
    } else {
      return Center(
          child: Text(
              textAlign: TextAlign.center,
              "Music not found.\n click Add icon on the bottom right."));
    }
  }

  goToPlayerPage(BuildContext context){
    return Navigator.push(context, MaterialPageRoute(builder: (context){
      return playerPage();
    }));
  }
}
