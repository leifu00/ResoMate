import 'package:flutter/material.dart';

class UploadMusicMp3Black extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _UploadMusicMp3BlackState createState() => _UploadMusicMp3BlackState();
}

class _UploadMusicMp3BlackState extends State<UploadMusicMp3Black> {
  final TextStyle bold1 = TextStyle(
    fontSize: 26,
    color: Color(0xFF2E2F2E),
    fontWeight: FontWeight.w800,
  );
  final TextStyle bold2 = TextStyle(
    fontSize: 18,
    color: Color(0xFF2E2F2E),
    fontWeight: FontWeight.w800,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 25,
          bottom: 180,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEFF5E9),
            child: buildContent(),
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
          height: 150,
          bottom: 0,
          child: Image.asset("assets/background.png"),
        )
      ],
    );
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 120),
          child: Icon(
            Icons.music_note,
            size: 70,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
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
                        style: bold1,
                      ),
                      Text(
                        "(mp3)",
                        style: bold1,
                      ),
                    ],
                  ))),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Is this your final product?",
                style: bold2,
              ),
              Icon(
                Icons.flag,
                color: Color(0xFF2E2F2E),
              )
            ],
          ),
        )
      ],
    );
  }
}
