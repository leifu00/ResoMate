import 'package:flutter/material.dart';

class UploadMusicPostFinish extends StatefulWidget {

  @override
  _UploadMusicPostFinishState createState() => _UploadMusicPostFinishState();
}

class _UploadMusicPostFinishState extends State<UploadMusicPostFinish> {
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
            margin: EdgeInsets.only(left: 30, right: 30),
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
          height: 155,
          bottom: 0,
          child: Image.asset("assets/background_2.png"),
        )
      ],
    );
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 200),
          child: Icon(Icons.graphic_eq, size: 60,),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            "Successfully uploaded!",
            style: bold1,
          ),
        ),

      ],
    );
  }
}