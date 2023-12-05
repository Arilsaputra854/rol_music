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
         margin: EdgeInsets.only(top: 20, bottom: 20),
        child: listData(),
      ),
    );
  }

  listData() {
    List<String> DummySong = [
      "Tak Pantas Terluka - Keisya Levronka",
      "Cinta Tlah Terlambat - Steven Pasaribu",
      "Mimpi - Putri Ariani",
      "Satu-satu - Idgitaf",
      "Rayuan Perempuan Gila - Nadin Amizah",
      "Nanti Kita Seperti Ini - Batas Senja",
      "Semua Akan Dirayakan - Nadin Amizah",
      "Kembali Pulang - Suara Kayu & Feby Putri",
      "Aku Yang Terluka - Lyodra Ginting",
      "Tak Di Tanganku - Rendy Pandugo",
      "Jiwa yang Bersedih - Ghea Indrawari",
      "Tak Ingin Usai - Keisya Levronka",
      "Terlukis Indah - Rizky Febian & Ziva Magnolya",
      "Tentang Dirimu - Raisa",
      "Bagaimana Kalau Aku Tidak Baik-Baik Saja - Judika",
      "Ingkar - Rizky Febian",
      "Melawan Restu - Virgoun",
      "Sekali Seumur Hidup - Isyana Sarasvati",
      "Perlahan - Fiersa Besari",
      "Seperti Bidadari - Rossa",
      "Masih Ada - Lyodra Ginting",
      "Lebih Indah - Andmesh Kamaleng",
      "Cinta Sejati - Judika",
      "Masih Berharap - Rossa",
      "Dilema - Isyana Sarasvati",
      "Surat Cinta untuk Starla - Virgoun",
      "Kisah Cintaku - Once Mekel",
      "Salam Terakhir - D'Masiv",
      "Bintang di Surga - Armada",
      "Laguku untukmu - Afgan",
      "Cinta Kita - Titiek Puspa",
      "Pernah Terluka - Marcell Siahaan",
      "Kaulah yang Terindah - Dewa 19",
      "Sempurna - Andra & The BackBone",
      "Rindu - Melly Goeslaw",
      "Kenangan Terindah - Dewa 19"
    ];

    if (DummySong.isNotEmpty) {
      return ListView.builder(
          itemCount: DummySong.length,
          itemBuilder: (BuildContext context, int position) {
            return Container(
              margin: EdgeInsets.only(left: 20,right: 20,top:5,bottom: 5),
              child: Card(
                child: InkWell(
                    onTap: () {
                      goToPlayerPage(context);
                    },
                    child: Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: Text(
                            style: TextStyle(fontFamily: "Futura"),
                            DummySong[position]))),
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

  goToPlayerPage(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return playerPage();
    }));
  }
}
