import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resomate/models/user_data.dart';
import 'package:resomate/screens/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resomate/screens/upload_screen.dart';

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
          top: 0,
          bottom: 0,
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEFF5E9),
            child: buildContent(),
          ),
        ),
        Positioned(
          top: 0,
          right: 20,
          child: GestureDetector(
            onTap: () => {
              context.read<UserData>().setUploadMusicStep(-1),
              Navigator.pushNamed(context, MainScreen.id)
            },
            child: Icon(
              Icons.navigate_next,
              size: 60,
            ),
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
          child: Icon(
            Icons.graphic_eq,
            size: 60,
          ),
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
