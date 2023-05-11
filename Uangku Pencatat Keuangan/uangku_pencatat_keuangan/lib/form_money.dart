import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormMoney extends StatelessWidget {
  FormMoney(this.type);
  int type;

  @override
  Widget build(BuildContext context) {
    Fluttertoast.showToast(msg: type.toString());

    if (type == 1) {
      return Scaffold(
        appBar: ,
        body: Container(
          color: Colors.red,
        ),
      );
    } else {
      return Scaffold(
        body: Container(color: Colors.yellow),
      );
    }
  }
}
