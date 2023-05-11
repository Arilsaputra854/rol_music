import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController UsernameController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  TextEditingController ConfirmPasswordController = new TextEditingController();
  String _username = "", _password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    UsernameController.dispose();
    PasswordController.dispose();
    ConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  elevation: 0,
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
                body: Stack(
                  children: [
                    Align(
                      child: SvgPicture.asset(
                        "assets/img/Ellipse.svg",
                        height: 200,
                        width: 200,
                      ),
                      alignment: Alignment.topRight,
                    ),
                    Container(
                        child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 20, bottom: 10),
                              child: Image.asset(
                                "assets/img/uangku_logo.png",
                                scale: 11,
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 20, bottom: 30),
                            child: Text(
                              "Create Account",
                              style:
                                  TextStyle(fontSize: 40, fontFamily: "Inter"),
                            ),
                          ),
                          Form(
                              key: _formKey,
                              child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Username",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Inter")),
                                      Container(
                                        color: Colors.white,
                                        margin: EdgeInsets.only(
                                            bottom: 10, top: 10),
                                        child: TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Please enter username.";
                                              }
                                            },
                                            controller: UsernameController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            )),
                                      ),
                                      Text("Password",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Inter")),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Please enter your new Password.";
                                              }

                                              return null;
                                            },
                                            obscureText: true,
                                            controller: PasswordController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            )),
                                      ),
                                      Text("Confirm Password",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Inter")),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 30),
                                        child: TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Please enter your confirm password.";
                                              }
                                              if (value !=
                                                  PasswordController.text) {
                                                return "Your password not same as before.";
                                              }

                                              return null;
                                            },
                                            obscureText: true,
                                            controller:
                                                ConfirmPasswordController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            )),
                                      ),
                                      Center(
                                          child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.yellow,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)))),
                                        onPressed: () {
                                          Registered();
                                        },
                                        child: Container(
                                            width: 250,
                                            padding: EdgeInsets.all(10),
                                            child: Center(
                                              child: Text(
                                                "Register Now",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: "Inter",
                                                    color: Colors.black),
                                              ),
                                            )),
                                      ))
                                    ],
                                  )))
                        ],
                      ),
                    ))
                  ],
                ))));
  }

  void Registered() {
    if (_formKey.currentState.validate()) {
      _username = UsernameController.text;
      _password = PasswordController.text;
      Fluttertoast.showToast(msg: "data: " + _username + " & " + _password);
    }
  }
}
