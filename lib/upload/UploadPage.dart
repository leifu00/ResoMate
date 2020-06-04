import 'package:flutter/material.dart';
import 'package:fluttertesttest/upload/MusicUpload.dart';

class UploadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body: new ListView(
        children: <Widget>[

          Container(
            color: Color.fromARGB(80, 250, 200, 150),
            margin: EdgeInsets.only(left:50,top: 100,right: 50),
            child: Row(
              children: <Widget>[
                test(context),
                Container(
                  margin: EdgeInsets.only(left:50,top: 5),
                  child: IconButton (
                    icon: Icon(
                      Icons.music_note,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MusicUploadPage(),
                    )),
                  ),

                ),
              ],
            ),



          ),

        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('Upload'));
  }

  Widget test(BuildContext context) {
    return  new Container(
      margin: EdgeInsets.only(left:20,top: 10),
      child: const Text("Upload",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,),
      ),
    );
  }
}
