import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<MinePage> {
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
      Container(
        margin: EdgeInsets.only(top: 20, bottom: 10,left: 10),
        child: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment(1, -0.7),
              children: <Widget>[
                ClipOval(
                  child:
                  Image.asset(
                    "images/pig.jpg",
                    width: 80,
                    height: 80,

                  ),
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 50, 50),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12, width: 2),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30),
              width: 280,
              height: 30,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text("Name"),
                    Text("Role",
                    style: TextStyle(
                      fontSize: 10,
                    ),),
                  ],

                ),
              ),
            )
          ],
        ),
      ),

        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('Mine'));
  }

  Widget test(BuildContext context) {
    return  new Container(
      margin: EdgeInsets.only(left:20,top: 10),
      child: const Text("This is a test",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,),
      ),
    );
  }
}

