import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(UploadScreen());

class UploadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UploadScreenState();
  }
}

class _UploadScreenState extends State<UploadScreen> {
  final _BottomNavigationColor = Color(0xFF2E2F2E); //组件内部私有变量

  final music_icon = Container(
    margin: EdgeInsets.only(bottom: 10, left: 30),
    child: Icon(Icons.music_note, color: Color(0xFF2E2F2E), size: 60),
  );

  final lyric_icon = Container(
    margin: EdgeInsets.only(bottom: 10, left: 30),
    child: Icon(Icons.create, color: Color(0xFF2E2F2E), size: 60),
  );

  final mv_icon = Container(
    margin: EdgeInsets.only(bottom: 10, left: 30),
    child: Icon(Icons.slideshow, color: Color(0xFF2E2F2E), size: 60),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            oneUpload(context, "Music", music_icon),
            oneUpload(context, "MV", mv_icon),
            oneUpload(context, "Lyrics", lyric_icon),
          ],
        )
      ],
    );
  }

  Container oneUpload(BuildContext context, String text, Container container) {
    return new Container(
      decoration: new BoxDecoration(
        color: Color(0xFFEFF5E9),
      ),
      margin: EdgeInsets.only(top: 35, bottom: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 40),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF3E4840),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      container,
                    ],
                  ),
                ),

//                      const Text("Alice, Bob",
//                        style: TextStyle(
//                          fontSize: 14,
//                          color: Color(0xFF3E4840),
//                          fontWeight: FontWeight.bold,
//                        ),),
              ],
            ),
          ),
          FlatButton(
            child: Container(
              margin: EdgeInsets.only(left: 50),
              decoration: new BoxDecoration(
                color: Color(0xFFE2E2E2),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child: Container(
                margin:
                    EdgeInsets.only(top: 45, bottom: 45, left: 30, right: 30),
                child: Text(
                  "Upload",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF2E2F2E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
