import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uangku_pencatat_keuangan/login.dart';

import 'form_money.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int Saldo = 0;
  TabController? _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabcontroller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //debuging database
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (FirebaseAuth.instance.currentUser != null) {
      firestore
          .collection("financial_records")
          .doc(FirebaseAuth.instance.currentUser!.uid.toString()) //39
          .update({
        'records': FieldValue.arrayUnion([
          {
            'jumlah': 20000,
            'catatan': '-',
            'kategori': 'transportasi',
            'tanggal': new DateTime.timestamp().toString()
          }
        ])
      }).then((value) {
        Fluttertoast.showToast(msg: "Database berhasil dibuat.");
      });
    }
    List namaPemasukan = [
      'data1',
      'data2',
      'data3',
      'data1',
      'data2',
      'data3',
    ];
    List tanggalPemasukan = [
      '1 Januari 2023',
      '2 Januari 2023',
      '3 Januari 2023',
      '1 Januari 2023',
      '2 Januari 2023',
      '3 Januari 2023'
    ];
    List kategoriPemasukan = [
      'Gaji',
      'Hadiah',
      'Dividen',
      'Gaji',
      'Hadiah',
      'Dividen'
    ];
    List keteranganPemasukan = ['-', '-', 'dari bibit', '-', '-', 'dari bibit'];

    List data1 = [
      'data3',
      'data2',
      'data1',
    ];

    return Scaffold(
        body: Container(
            constraints: BoxConstraints(maxWidth: 500),
            child: ListView(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 500,
                        height: 230,
                        child: SvgPicture.asset(
                          "assets/img/bg.svg",
                          fit: BoxFit.fill,
                        ),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.only(
                        //         bottomLeft: Radius.circular(50),
                        //         bottomRight: Radius.circular(50)),
                        //     color: Colors.yellow),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 130),
                        alignment: Alignment.center,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Saldo Anda",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter",
                                    fontSize: 20),
                              ),
                              Text(
                                "Rp ${Saldo}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Inter",
                                    fontSize: 40),
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                        width: 500,
                        height: 60,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  FirebaseAuth.instance.currentUser?.email ??
                                      "No Signin",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Inter",
                                      fontSize: 15),
                                )),
                            Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bar_chart,
                                  color: Colors.black,
                                )),
                            IconButton(
                                onPressed: () {
                                  FirebaseAuth.instance
                                      .signOut()
                                      .then((value) async {
                                    saveUserToken("");

                                    print("LOG: Signout Berhasil!");
                                  });
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FormMoneyScreen(1);
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: 80,
                          height: 80,
                          child: Image.asset("assets/img/icon_money_in.png"),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow),
                        )),
                    InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FormMoneyScreen(0);
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: 80,
                          height: 80,
                          child: Image.asset("assets/img/icon_money_out.png"),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow),
                        )),
                    InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {
                          Fluttertoast.showToast(msg: "Graphic");
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: 80,
                          height: 80,
                          child: Image.asset("assets/img/icon_graphic.png"),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow),
                        )),
                  ],
                ),
                Container(
                    margin: EdgeInsets.all(12),
                    height: 40,
                    child: TabBar(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        indicatorColor: Colors.transparent,
                        indicatorPadding: EdgeInsets.only(left: 10, right: 10),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20)),
                        unselectedLabelColor: Colors.grey,
                        controller: _tabcontroller,
                        tabs: [Text("Pemasukan"), Text("Pengeluaran")])),
                Container(
                  height: 250,
                  width: 500,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TabBarView(controller: _tabcontroller, children: [
                    ListView.builder(
                      itemCount: namaPemasukan.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: 5, right: 5, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(namaPemasukan[index]),
                                  Spacer(),
                                  Text(tanggalPemasukan[index])
                                ],
                              ),
                              Text(kategoriPemasukan[index]),
                              Text(keteranganPemasukan[index])
                            ],
                          ),
                        );
                      }),
                    ),
                    ListView.builder(
                        itemCount: data1.length,
                        itemBuilder: ((context, index) {
                          return Text(data1[index]);
                        }))
                  ]),
                ),
              ],
            )));
  }
}
