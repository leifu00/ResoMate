import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(Upload());

class Upload extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UploadState();
  }
}



class _UploadState extends State<Upload> {
  final _BottomNavigationColor = Color(0xFF2E2F2E);

  final music_icon = Container(
    margin: EdgeInsets.only(bottom: 10, left: 30),
    child: Icon(Icons.music_note,
        color: Color(0xFF2E2F2E), size: 60),
  );

  final lyric_icon = Container(
    margin: EdgeInsets.only(bottom: 10, left: 30),
    child: Icon(Icons.create,
        color: Color(0xFF2E2F2E), size: 60),
  );

  final mv_icon = Container(
    margin: EdgeInsets.only(bottom: 10, left: 30),
    child: Icon(Icons.slideshow,
        color: Color(0xFF2E2F2E), size: 60),
  );



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF4C6056)),
      home: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text("Test"),
          leading: IconButton(
            icon: Icon(
              Icons.graphic_eq,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        body: new ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                oneUpload(context, "Music",music_icon),
                oneUpload(context, "MV",mv_icon),

                oneUpload(context, "Lyrics",lyric_icon),

              ],
            )

          ],
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color(0xFF6FA06C),

//              primaryColor: Colors.red,

              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.headset,
                    color: _BottomNavigationColor,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: _BottomNavigationColor),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: _BottomNavigationColor,
                  ),
                  title: Text(
                    'Find',
                    style: TextStyle(color: _BottomNavigationColor),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.publish,
                    color: _BottomNavigationColor,
                  ),
                  title: Text(
                    'Upload',
                    style: TextStyle(color: _BottomNavigationColor),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                    color: _BottomNavigationColor,
                  ),
                  title: Text(
                    'Chat',
                    style: TextStyle(color: _BottomNavigationColor),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: _BottomNavigationColor,
                  ),
                  title: Text(
                    'Me',
                    style: TextStyle(color: _BottomNavigationColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Container oneUpload(BuildContext context, String text, Container container){

    return new  Container(
      decoration: new BoxDecoration(
        color: Color(0xFFEFF5E9),
      ),
      margin: EdgeInsets.only(top: 35, bottom: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 40),
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
                margin: EdgeInsets.only(top: 45, bottom: 45,left: 30,right: 30),
                child: Text("Upload",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF2E2F2E),
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );


  }
}


//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//final _firestore = Firestore.instance;
//FirebaseUser loggedInUser;
//
//class UploadScreen extends StatefulWidget {
//  static const String id = 'upload_screen';
//
//  @override
//  _UploadScreenState createState() => _UploadScreenState();
//}
//
//class _UploadScreenState extends State<UploadScreen> {
//  final isSelected = <bool>[false, false, false];
//  int currentSelected = 0;
//
//  final _auth = FirebaseAuth.instance;
//
//  String messageText;
//
//  @override
//  void initState() {
//    super.initState();
//
//    getCurrentUser();
//  }
//
//  void getCurrentUser() async {
//    try {
//      final user = await _auth.currentUser();
//      if (user != null) {
//        loggedInUser = user;
//      }
//    } catch (e) {
//      print(e);
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.grey,
//      child: Container(
//        padding: EdgeInsets.all(20),
//        decoration: BoxDecoration(
//          color: Colors.white,
//          borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(20),
//            topRight: Radius.circular(20),
//          ),
//        ),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            SizedBox(
//              height: 20,
//            ),
//            Text(
//              '   I am looking for a ......',
//              textAlign: TextAlign.start,
//              style: TextStyle(fontSize: 30),
//            ),
//            SizedBox(
//              height: 30,
//            ),
//            ToggleButtons(
//              constraints: BoxConstraints(minHeight: 80, minWidth: 100),
//              children: <Widget>[
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    Text('Singer'),
//                    Icon(Icons.music_note),
//                  ],
//                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    Text('MV Producer'),
//                    Icon(Icons.movie),
//                  ],
//                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    Text('Composer'),
//                    Icon(Icons.create),
//                  ],
//                ),
//              ],
//              onPressed: (index) {
//                setState(() {
//                  isSelected[index] = !isSelected[index];
//                  currentSelected = index;
//                });
//              },
//              isSelected: isSelected,
//            ),
//            SizedBox(
//              height: 30,
//            ),
//            RaisedButton.icon(
//              padding:
//                  EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
//              onPressed: () {
//                _firestore.collection('posts').add({
//                  'type': currentSelected,
//                  'email': loggedInUser.email,
//                });
//                Navigator.pop((context));
//              },
//              icon: Icon(Icons.file_upload),
//              label: Text('Upload my work and Continue'),
//            ),
//            SizedBox(
//              height: 30,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
