import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resomate/models/user_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

final _firestore = Firestore.instance;

class UploadMusicMp3Black extends StatefulWidget {
  static const String id = 'upload_music_screen1';

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

  String fileType = '';
  File file;
  String fileName = '';
  String operationText = '';
  bool isUploaded = false;
  String result = '';

  Future<void> _uploadFile(File file, String filename) async {
    StorageReference storageReference;
    storageReference = FirebaseStorage.instance.ref().child("audio/$filename");
    final StorageUploadTask uploadTask = storageReference.putFile(file);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    context.read<UserData>().setMp3Url(url);
    _firestore
        .collection('musics')
        .add({'url': url, 'email': 'abc@example.com'});
    setState(() {
      isUploaded = true;
    });
  }

  Future filePicker(BuildContext context) async {
    try {
      print('here');
      file = await FilePicker.getFile(
          type: FileType.custom, allowedExtensions: ['.mp3']);
      print('here2');
      fileName = p.basename(file.path);
      setState(() {
        fileName = p.basename(file.path);
      });
      _uploadFile(file, fileName);
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sorry...'),
              content: Text('Unsupported exception: $e'),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

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
            onTap: () => {
              context.read<UserData>().setUploadMusicStep(-1),
            },
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
            onTap: () => isUploaded
                ? {context.read<UserData>().setUploadMusicStep(1)}
                : null,
            child: Icon(
              Icons.navigate_next,
              size: 60,
            ),
          ),
        ),
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
        GestureDetector(
          onTap: () => filePicker(context),
          child: Container(
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
