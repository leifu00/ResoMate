import 'package:flutter/material.dart';

class MusicUploadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<MusicUploadPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body: new ListView(
        children: <Widget>[
          test(context),
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('UploadMusic'));
  }

  Widget test(BuildContext context) {
    return  new Container(
      margin: EdgeInsets.only(left:20,top: 10),
      child: const Text("Upload your music",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,),
      ),
    );
  }
}