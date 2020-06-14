import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resomate/models/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

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
          top: 0,
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEFF5E9),
            child: buildContent(),
          ),
        ),
        Positioned(
          top: 0,
          left: 20,
          child: GestureDetector(
            onTap: () => context.read<UserData>().setUploadMusicStep(2),
            child: Icon(
              Icons.navigate_before,
              size: 60,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 20,
          child: GestureDetector(
            onTap: () => {
              context.read<UserData>().setPost(post_text),
              _firestore.collection('posts').add({
                'email': 'alex@example.com',
                'url': context.read<UserData>().mp3_url,
                'genre': context.read<UserData>().genre,
                'name': 'Alex',
                'post': context.read<UserData>().post,
                'target': context.read<UserData>().target
              }),
              context.read<UserData>().setUploadMusicStep(4)
            },
            child: Icon(
              Icons.navigate_next,
              size: 60,
            ),
          ),
        ),
        Positioned(
          top: 210,
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

  String post_text;

  Widget buildTextField() {
    return TextField(
      onChanged: (String newText) {
        post_text = newText;
      },
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
