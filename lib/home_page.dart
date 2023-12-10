import "package:flutter/material.dart";
import "package:rol_music/model/music.dart";
import "package:rol_music/player_page.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Music> musicList = [];
    musicList.add(Music("Iphone 5s Ringtone", "music/Iphone_5s_ringtone.mp3"));
    musicList.add(Music("Iphone Ringtone", "music/Iphone_ringtone.mp3"));
    musicList
        .add(Music("Samsung A80 Ringtone", "music/Samsung_a80_ringtone.mp3"));
    musicList.add(Music("Iphone 5s Ringtone", "music/Iphone_5s_ringtone.mp3"));
    musicList.add(Music("Iphone Ringtone", "music/Iphone_ringtone.mp3"));
    musicList
        .add(Music("Samsung A80 Ringtone", "music/Samsung_a80_ringtone.mp3"));

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: Text(
            "SELAMAT DATANG",
            style: TextStyle(fontFamily: "Futura"),
          ),
          leading: Image.asset("assets/img/Logo.png")),
      body: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        child: listofMusic(musicList),
      ),
    );
  }

  listofMusic(List<Music> musicList) {
    if (musicList.isNotEmpty) {
      return ListView.builder(
          itemCount: musicList.length,
          itemBuilder: (BuildContext context, int position) {
            return Container(
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          goToPlayerPage(context, musicList, position);
                        },
                        child: Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            child: Text(
                                style: TextStyle(fontFamily: "Futura"),
                                "${musicList.indexOf(musicList[position]) + 1}. ${musicList[position].musicName}"))),
                  )),
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
