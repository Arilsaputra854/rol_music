import "package:audioplayers/audioplayers.dart";
import "package:flutter/material.dart";
import "package:rol_music/model/music.dart";

class playerPage extends StatefulWidget {
  final List<Music> data;
  final int index;
  const playerPage(@required this.data, @required this.index, {super.key});

  @override
  State<playerPage> createState() => _playerPageState(this.data, this.index);
}

class _playerPageState extends State<playerPage> with TickerProviderStateMixin {
  List<Music> data;
  int index;
  Music? nowPlaying;

  _playerPageState(List<Music> this.data, this.index);
  final player = AudioPlayer();
  int stateStatus = 3;
  Duration musicPosition = Duration.zero;
  Duration musicDuration = Duration.zero;

  initPlayer() async {
    UrlSource source = UrlSource(data[index].musicUrl);

    print("Now playing: " + data[index].musicUrl);

    musicPosition = Duration.zero;
    musicDuration = Duration.zero;
    playMusic(source);
  }

  playMusic(source) {
    player.play(source);
  }

  stopMusic() {
    player.stop();
  }

  playPrevMusic() {
    setState(() {
      player.stop();

      musicPosition = Duration.zero;
      musicPosition = Duration.zero;
      index = index - 1;
      if (index < 0) {
        index = data.length - 1;
      }
      nowPlaying = data[index];

      stopMusic();
      initPlayer();
      print("now playing: $nowPlaying");
    });
  }

  playNextMusic() {
    setState(() {
      musicPosition = Duration.zero;
      musicPosition = Duration.zero;
      index = index + 1;

      if (index > data.length - 1) {
        index = 0;
      }
      nowPlaying = data[index];
      stopMusic();
      initPlayer();
      print("now playing: $nowPlaying");
    });
  }

  String formatDurasiMusik(Duration duration) {
    String _formatAngka(int angka) => angka < 10 ? '0$angka' : angka.toString();

    int jam = duration.inHours;
    int menit = duration.inMinutes.remainder(60);
    int detik = duration.inSeconds.remainder(60);

    String durasiString =
        '${_formatAngka(jam)}:${_formatAngka(menit)}:${_formatAngka(detik)}';

    return jam > 0 ? durasiString : durasiString.substring(3);
  }

  @override
  void initState() {
    super.initState();

    nowPlaying = data[index];

    initPlayer();

    player.onPlayerStateChanged.listen((state) {
      stateStatus = state.index;
      print("State saat ini $stateStatus");
    });

    player.onPositionChanged.listen((position) {
      setState(() {
        musicPosition = position;
        if (musicPosition == musicDuration) {
          musicPosition = Duration.zero;
        }
      });
    });

    player.onDurationChanged.listen((duration) {
      setState(() {
        musicDuration = duration;
      });
    });

    player.onPlayerComplete.listen((event) {
      playNextMusic();
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Halaman Pemutar",
            style: TextStyle(fontFamily: "Futura"),
          ),
        ),
        body: Container(
            width: screenWidth,
            height: screenHeight,
            child: PotraitOrientation(nowPlaying!)
            //  isPotrait
            //     ? PotraitOrientation(nowPlaying)
            //     : LandscapeOrientation(nowPlaying, screenWidth, screenHeight)
            ));
  }

  // LandscapeOrientation(
  //     Music nowPlaying, double screenWidth, double screenHeight) {
  //   double width = screenWidth / 2;
  //   print(width);
  //   return Container(
  //       margin: EdgeInsets.all(10),
  //       width: screenWidth,
  //       height: screenHeight,
  //       child: Row(
  //         children: [
  //           Flexible(
  //               flex: 1,
  //               child: Card(
  //                 surfaceTintColor: Colors.white,
  //                 elevation: 8,
  //                 child: Container(
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.all(Radius.circular(5))),
  //                     padding: EdgeInsets.all(10),
  //                     child: Container(
  //                         child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                           Center(
  //                               child: Image.asset(
  //                             "assets/img/Logo.png",
  //                             height: screenHeight / 5,
  //                           )),
  //                           Text(
  //                             nowPlaying.musicName,
  //                             style: TextStyle(
  //                               fontSize: 12,
  //                               fontFamily: "Futura",
  //                             ),
  //                             textAlign: TextAlign.center,
  //                           ),
  //                           Container(
  //                               padding: EdgeInsets.only(left: 50, right: 50),
  //                               child: Slider(
  //                                   activeColor: Colors.black,
  //                                   value: musicPosition.inSeconds.toDouble(),
  //                                   max: musicDuration.inSeconds.toDouble(),
  //                                   onChanged: (value) {
  //                                     player.seek(
  //                                         Duration(seconds: value.toInt()));
  //                                   })),
  //                           Container(
  //                               padding: EdgeInsets.only(left: 50, right: 50),
  //                               child: Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Text(
  //                                     formatDurasiMusik(musicPosition),
  //                                   ),
  //                                   Text(
  //                                     formatDurasiMusik(musicDuration),
  //                                   ),
  //                                 ],
  //                               )),
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Ink(
  //                                   width: width / 10,
  //                                   decoration: ShapeDecoration(
  //                                       shape: CircleBorder(),
  //                                       color: Colors.black),
  //                                   child: IconButton(
  //                                       iconSize: width / 2 * 0.10,
  //                                       onPressed: () {
  //                                         setState(() {
  //                                           player.stop();

  //                                           index = index - 1;
  //                                           if (index < 0) {
  //                                             index = data.length - 1;
  //                                           }

  //                                           nowPlaying = data[index];
  //                                           setupAudioPlayer();
  //                                           print("now playing: $nowPlaying");
  //                                         });
  //                                       },
  //                                       icon: Icon(
  //                                         Icons.skip_previous,
  //                                         color: Colors.white,
  //                                       ))),
  //                               SizedBox(
  //                                 width: 5,
  //                               ),
  //                               Ink(
  //                                   decoration: ShapeDecoration(
  //                                       shape: CircleBorder(),
  //                                       color: Colors.black),
  //                                   child: IconButton(
  //                                       iconSize: width * 0.10,
  //                                       onPressed: () {
  //                                         if (stateStatus == 1) {
  //                                           setState(() {
  //                                             player.pause();
  //                                             stateStatus = 3;
  //                                             print(
  //                                                 "pause audio: ${nowPlaying.musicUrl}");
  //                                           });
  //                                         } else if (stateStatus == 0) {
  //                                           setState(() {
  //                                             player.play(AssetSource(
  //                                                 data[index].musicUrl));
  //                                             stateStatus = 3;
  //                                             print(
  //                                                 "pause audio: ${nowPlaying.musicUrl}");
  //                                           });
  //                                         } else {
  //                                           setState(() {
  //                                             player.resume();
  //                                             print(
  //                                                 "sekarang memutar: ${nowPlaying.musicUrl}");
  //                                           });
  //                                         }
  //                                       },
  //                                       icon: stateStatus == 3 ||
  //                                               stateStatus == 2 ||
  //                                               stateStatus == 0
  //                                           ? Icon(
  //                                               Icons.play_arrow,
  //                                               color: Colors.white,
  //                                             )
  //                                           : Icon(
  //                                               Icons.pause,
  //                                               color: Colors.white,
  //                                             ))),
  //                               SizedBox(
  //                                 width: 5,
  //                               ),
  //                               Ink(
  //                                   width: width / 10,
  //                                   decoration: ShapeDecoration(
  //                                       shape: CircleBorder(),
  //                                       color: Colors.black),
  //                                   child: IconButton(
  //                                       iconSize: width / 2 * 0.10,
  //                                       onPressed: () {
  //                                         setState(() {
  //                                           player.stop();

  //                                           index = index + 1;
  //                                           if (index > data.length - 1) {
  //                                             index = 0;
  //                                           }
  //                                           nowPlaying = data[index];
  //                                           setupAudioPlayer();
  //                                           print("now playing: $nowPlaying");
  //                                         });
  //                                       },
  //                                       icon: Icon(
  //                                         Icons.skip_next,
  //                                         color: Colors.white,
  //                                       )))
  //                             ],
  //                           )
  //                         ]))),
  //               )),
  //           Flexible(
  //             flex: 1,
  //             child: Card(
  //                 elevation: 8,
  //                 child: Container(
  //                     decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.all(Radius.circular(5))),
  //                     padding: EdgeInsets.all(10),
  //                     child: listOfMusic(data))),
  //           )
  //         ],
  //       ));
  // }

  PotraitOrientation(Music nowPlaying) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        height: 20,
      ),
      Container(child: Center(child: Image.asset("assets/img/Logo.png"))),
      SizedBox(
        height: 20,
      ),
      Text(
        nowPlaying.musicName,
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Futura",
        ),
        textAlign: TextAlign.center,
      ),
      Container(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Slider(
              activeColor: Colors.black,
              value: musicPosition.inSeconds.toDouble(),
              max: musicDuration.inSeconds.toDouble(),
              onChanged: (value) {
                player.seek(Duration(seconds: value.toInt()));
              })),
      Container(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDurasiMusik(musicPosition)),
              Text(formatDurasiMusik(musicDuration))
            ],
          )),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Ink(
              decoration:
                  ShapeDecoration(shape: CircleBorder(), color: Colors.black),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    playPrevMusic();
                  },
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ))),
          SizedBox(width: 10),
          Ink(
              decoration:
                  ShapeDecoration(shape: CircleBorder(), color: Colors.black),
              child: IconButton(
                  iconSize: 50,
                  onPressed: () {
                    if (stateStatus == 1) {
                      setState(() {
                        player.pause();
                        stateStatus = 3;
                        print("pause audio: ${nowPlaying.musicUrl}");
                      });
                    } else if (stateStatus == 0) {
                      setState(() {
                        player.play(AssetSource(data[index].musicUrl + ".mp3"));
                        stateStatus = 3;
                        print("pause audio: ${nowPlaying.musicUrl}");
                      });
                    } else {
                      setState(() {
                        player.resume();
                        print("sekarang memutar: ${nowPlaying.musicUrl}");
                      });
                    }
                  },
                  icon: stateStatus == 3 || stateStatus == 2 || stateStatus == 0
                      ? Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.pause,
                          color: Colors.white,
                        ))),
          SizedBox(width: 10),
          Ink(
              decoration:
                  ShapeDecoration(shape: CircleBorder(), color: Colors.black),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    playNextMusic();
                  },
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  )))
        ],
      )
    ]);
  }

  listOfMusic(List<Music> data) {
    if (data.isNotEmpty) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int position) {
            return Container(
                child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: position == index
                          ? Color.fromARGB(255, 228, 227, 227)
                          : Colors.white),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        index = position;
                        initPlayer();
                      });
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        child: Text(
                            style: TextStyle(fontFamily: "Futura"),
                            "${data.indexOf(data[position]) + 1}. ${data[position].musicName}")),
                  )),
            ));
          });
    } else {
      return Center(
          child: Text(
              textAlign: TextAlign.center,
              "Music not found.\n click Add icon on the bottom right."));
    }
  }
}
