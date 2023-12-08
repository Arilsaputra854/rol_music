import "package:flutter/material.dart";
import "package:rol_music/model/music.dart";
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
         margin: EdgeInsets.only(top: 20, bottom: 20),
        child: listData(),
      ),
    );
  }

  listData() {
    List<Music> musicList = [];
    musicList.add(Music("Iphone 5s Ringtone", "music/iphone_5s_ringtone.mp3"));
    musicList.add(Music("Iphone Ringtone", "music/iphone_ringtone.mp3"));
    musicList.add(Music("Samsung A80 Ringtone", "music/samsung_a80_ringtone.mp3"));

    if (musicList.isNotEmpty) {
      return ListView.builder(
          itemCount: musicList.length,
          itemBuilder: (BuildContext context, int position) {
            return Container(
              margin: EdgeInsets.only(left: 20,right: 20,top:5,bottom: 5),
              child: Card(
                child: InkWell(
                    onTap: () {
                      goToPlayerPage(context, musicList, position);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: Text(
                            style: TextStyle(fontFamily: "Futura"),
                            musicList[position].musicName))),
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

  goToPlayerPage(BuildContext context, List<Music> data, int index) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return playerPage(data, index);
    }));
  }
}
