import 'package:flutter/material.dart';

class PostScreen1 extends StatefulWidget {
  static const String id = 'post_screen1';

  @override
  _PostScreen1State createState() => _PostScreen1State();
}

class _PostScreen1State extends State<PostScreen1> {
  final TextStyle bold = TextStyle(
    fontSize: 27,
    color: Color(0xFF2E2F2E),
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 1,
          bottom: 190,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEFF5E9),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 150),
                  child: Icon(
                    Icons.music_note,
                    size: 70,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: new ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                          color: Color(0xFFE2E2E2),
                          height: 140,
                          width: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Upload",
                                style: bold,
                              ),
                              Text(
                                "(mp3)",
                                style: bold,
                              ),
                            ],
                          ))),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 550,
          left: 20,
          child: Icon(
            Icons.navigate_before,
            size: 60,
          ),
        ),
        Positioned(
          top: 550,
          right: 20,
          child: Icon(
            Icons.navigate_next,
            size: 60,
          ),
        ),
        Positioned(
          height: 180,
          bottom: 0,
          child: Image.asset("assets/background.png"),
        )
      ],
    );
  }
}
