import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(CopyRight());

class CopyRight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CopyRightState();
  }
}

class _CopyRightState extends State<CopyRight> {
  final _BottomNavigationColor = Color(0xFF2E2F2E);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF4C6056)),
      home: Scaffold(
          backgroundColor: Color(0xFFFAFAFA),
          appBar: AppBar(
            title: Text("Test"),
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_return,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          body: new ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8.0, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Copyright Reserved",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF3E4840),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Color(0xFFEFF5E9),
                ),
                margin: EdgeInsets.only(top: 5, bottom: 20),
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Flower Dance",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3E4840),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/fonts/music_sample.jpg",
                            width: 120,
                            height: 128,
                          ),
                        ),
                      ),
                      const Text(
                        "Alice, Bob",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF3E4840),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25, top: 5),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            new Text(
                              "The song is created by Alice and Bob on June 10, 2020. The copyright belongs to Alice and is protected by ResoMate. All right reserved.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF3E4840),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Color(0xFFEFF5E9),
                ),
                margin: EdgeInsets.only(top: 5),
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 300, left: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5, right: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            aRole(context, "Singer:"),
                            aRole(context, "Lyrics Writer:"),
                            aRole(context, "Composer:"),
                            aRole(context, "Arranger:"),
                            aRole(context, "MV Maker:"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            aName(context, "I have a long name"),
                            aName(context, "I have a long name"),
                            aName(context, "I have a long name"),
                            aName(context, "I have a long name"),
                            aName(context, "Bob")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Container aName(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF3E4840),
        ),
      ),
    );
  }

  Container aRole(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF3E4840),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}