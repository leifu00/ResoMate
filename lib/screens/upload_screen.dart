import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'match_screen.dart';

class AddNoticeScreen extends StatefulWidget {
  @override
  _AddNoticeScreenState createState() => _AddNoticeScreenState();
}

class _AddNoticeScreenState extends State<AddNoticeScreen> {
  final isSelected = <bool>[false, false, false];

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            ToggleButtons(
              constraints: BoxConstraints(minHeight: 80, minWidth: 80),
              children: <Widget>[
                Icon(Icons.music_note),
                Icon(Icons.movie),
                Icon(Icons.create),
              ],
              onPressed: (index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
              isSelected: isSelected,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'I am looking for a ',
              textAlign: TextAlign.start,
            ),
            RaisedButton.icon(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MatchScreen()),
                );
              },
              icon: Icon(Icons.file_upload),
              label: Text('Upload'),
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
