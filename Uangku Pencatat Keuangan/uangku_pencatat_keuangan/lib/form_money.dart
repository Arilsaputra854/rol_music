import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';

class FormMoneyScreen extends StatelessWidget {
  FormMoneyScreen(this.type);
  int type;
  TextEditingController _jumlahController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Fluttertoast.showToast(msg: type.toString());

    if (type == 1) {
      return Expanded(
          child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    title: Text("Pemasukan",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Inter",
                            color: Colors.black)),
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
                  body: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jumlah",
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: "Inter")),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: "Inter"),
                                    controller: _jumlahController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.yellow,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.yellow, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.yellow, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(children: [
                            Text("Kategori",
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Inter")),
                            SizedBox(
                              height: 5,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                              onPressed: () {
                                _showDialogKategori(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    "Pilih",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Inter",
                                        color: Colors.black),
                                  )),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(children: [
                            Text("Tanggal",
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Inter")),
                            SizedBox(
                              height: 5,
                            ),
                            TextButton(
                              child: Icon(
                                Icons.calendar_month,
                                size: 45,
                                color: Colors.black,
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                              onPressed: () {},
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Catatan",
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: "Inter")),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: "Inter"),
                                    controller: _jumlahController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.yellow,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.yellow, width: 0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.yellow, width: 0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          onPressed: () {},
                          child: Container(
                              width: 200,
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "Simpan",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "Inter",
                                      color: Colors.black),
                                ),
                              )),
                        )
                      ]),
                    ),
                  ))));
    } else {
      return Scaffold(
        body: Container(color: Colors.yellow),
      );
    }
  }
}

_showDialogKategori(BuildContext context) async {
  TextEditingController _addKategori = new TextEditingController();
  String _newKategori = "";

  await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text("Kategori",
                style: TextStyle(
                    fontSize: 20, fontFamily: "Inter", color: Colors.black)),
            TextField(
              onChanged: (value) {
                _newKategori = value.toString();
              },
              controller: _addKategori,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              onPressed: () {
                if (_newKategori.trim().isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Kategori baru tidak boleh kosong!");
                } else {
                  Fluttertoast.showToast(
                      msg: "Kategori ${_newKategori} ditambahkan.");
                  Navigator.pop(context);
                }
              },
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Simpan",
                    style: TextStyle(
                        fontSize: 20, fontFamily: "Inter", color: Colors.black),
                  )),
            ),
          ])),
        );
      });
}
