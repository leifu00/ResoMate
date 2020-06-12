import 'package:flutter/material.dart';

class UploadMusicPost extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _UploadMusicPostState createState() => _UploadMusicPostState();
}

class _UploadMusicPostState extends State<UploadMusicPost> {
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
        ),
        Positioned(
          top: 230,
          right: 70,
          child: Icon(Icons.camera_alt),
        )
      ],
    );
  }

  Widget buildContent() {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          "Making a post",
          style: bold1,
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 30),
        child: new ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Container(
              color: Color(0xFFFFFFFF),
              height: 150,
              width: 360,
              child: buildTextField(),
            )),
      )
    ]);
  }

  Widget buildTextField() {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.only(left: 20, right: 20),
          border: InputBorder.none,
          hintText: "What do you want to say...",
          hintStyle: new TextStyle(fontSize: 14, color: Colors.grey)),
      style: new TextStyle(fontSize: 14, color: Colors.black),
    );
  }
}
