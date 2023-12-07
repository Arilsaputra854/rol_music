import "package:flutter/material.dart";

class playerPage extends StatefulWidget {
  final List<String> data;
  final int index;
  const playerPage(@required  this.data,@required this.index, {super.key});

  @override
  State<playerPage> createState() => _playerPageState(this.data, this.index);
}

class _playerPageState extends State<playerPage>
    with TickerProviderStateMixin {
    List<String> data;
    int index;

    _playerPageState(List<String> this.data, this.index);
    
  @override
  Widget build(BuildContext context) {

    String nowPlaying = data[index];

    final AnimationController _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
 

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Halaman Pemutar",
            style: TextStyle(fontFamily: "Futura"),
          ),
        ),
        body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                margin: EdgeInsets.only(top: 100, bottom: 20),
                child: Center(
                    child: AnimatedBuilder(
                        animation: _controller,
                        builder: (controller, child) {
                          return Transform.rotate(
                            angle: _controller.value * 2 * 3.14,
                            child: child,
                          );
                        },
                        child: Image.asset("assets/img/Logo.png")))),
            SizedBox(
              height: 20,
            ),
            Text(
              nowPlaying,
              style: TextStyle(fontSize: 20, fontFamily: "Futura",),textAlign: TextAlign.center,
            ),
            Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Slider(
                    activeColor: Colors.black,
                    value: 1,
                    onChanged: (value) {})),
            Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("00:00"), Text("03:10")],
                )),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.black),
                    child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          setState(() {
                            index = index-1;
                            if(index < 0){
                              index = data.length -1;
                            }
                            nowPlaying = data[index];
                            print("now playing: $nowPlaying");
                          });
                        },
                        icon: Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                        ))),
                SizedBox(width: 10),
                Ink(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.black),
                    child: IconButton(
                        iconSize: 50,
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ))),
                SizedBox(width: 10),
                Ink(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.black),
                    child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          setState(() {
                            index = index+1;
                            if(index > data.length -1){
                              index = 0;
                            }
                            nowPlaying = data[index];
                            print("now playing: $nowPlaying");
                          });
                        },
                        icon: Icon(
                          Icons.skip_next,
                          color: Colors.white,
                        )))
              ],
            )
          ]),
        ));
  }
}
