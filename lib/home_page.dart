import "dart:io";

import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:path_provider/path_provider.dart";
import "package:rol_music/model/music.dart";
import "package:rol_music/player_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Music> musicList = [];

  @override
  void initState() {
    super.initState();
    readMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        onPressed: () {
          pickMusic();
        },
      ),
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

  Future<String?> moveAndRenameFile(FilePickerResult result) async {
    try {
      //path penyimpanan eksternal
      Directory? storageDirectory = await getExternalStorageDirectory();
      String? storagePath = storageDirectory?.path;

      if (storagePath != null) {
        // Buat folder "temp" di dalam penyimpanan eksternal
        String tempFolderPath = '$storagePath/music';
        Directory(tempFolderPath).createSync(recursive: true);

        // Ambil file yang dipilih dari FilePickerResult
        PlatformFile file = result.files.single;
        String fileName = file.name;

        // Path asal file yang dipilih
        String originalFilePath = file.path!;

        // Path baru di folder "temp"
        String newFilePath = '$tempFolderPath/$fileName';

        // Pindahkan file ke folder "temp"
        File(originalFilePath).copySync(newFilePath);

        print("PATH BARU: ${newFilePath}");

        // Kembalikan path baru
        return newFilePath;
      } else {
        print('Failed to get storage directory');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<void> pickMusic() async {
    String _filePath = "no file selected";

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['mp3', 'aac', 'wav', 'ogg']);

      if (result != null) {
        String? musicPath = await moveAndRenameFile(result);
        //musicPath = musicPath! + ".mp3";

        //print("DEBUG: " + musicPath);
        setState(() {
          if (!musicList
              .any((music) => music.musicName == result.files.single.name)) {
            musicList.add(Music(result.files.single.name, musicPath ?? ""));
          }
        });
      } else {
        _filePath = "no file selected";
      }
    } on PlatformException catch (e) {
      print("Error File Picker" + e.toString());
    } catch (e) {
      print(e);
    }

    print("FILE SELECTED:" + _filePath);
  }

  Future<void> readMusic() async {
    Directory? storageDirectory = await getExternalStorageDirectory();
    String? storagePath = (storageDirectory?.path);
    print(storagePath);
    // Replace 'path_to_your_folder' with the actual path of your folder
    final directory = Directory(storagePath! + "/music");

    // List all files in the directory
    List<FileSystemEntity> fileList = directory.listSync();

    // Extract filenames from the list of files
    List<String> filenames = fileList.map((file) {
      return file.path
          .split('/')
          .last; // Adjust this if your path uses a different separator
    }).toList();

    filenames.forEach((filename) {
      String temp = (storagePath + "/music" + "/${filename}");
      print("RETRIVING MUSIC FROM FOLDER: " + temp);

      //read file if duplicate or not
      if (!musicList.any((music) => music.musicName == filename)) {
        musicList.add(Music(filename, temp));
      }

      setState(() {});
    });
  }
}
