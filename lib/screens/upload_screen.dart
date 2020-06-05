import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class UploadScreen extends StatefulWidget {
  static const String id = 'upload_screen';

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final isSelected = <bool>[false, false, false];
  int currentSelected = 0;

  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              '   I am looking for a ......',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            ToggleButtons(
              constraints: BoxConstraints(minHeight: 80, minWidth: 100),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Singer'),
                    Icon(Icons.music_note),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('MV Producer'),
                    Icon(Icons.movie),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Composer'),
                    Icon(Icons.create),
                  ],
                ),
              ],
              onPressed: (index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                  currentSelected = index;
                });
              },
              isSelected: isSelected,
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton.icon(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              onPressed: () {
                _firestore.collection('posts').add({
                  'type': currentSelected,
                  'email': loggedInUser.email,
                });
                Navigator.pop((context));
              },
              icon: Icon(Icons.file_upload),
              label: Text('Upload my work and Continue'),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
