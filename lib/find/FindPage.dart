import 'package:flutter/material.dart';
import 'package:fluttertesttest/find/Post.dart';
import 'package:fluttertesttest/home/HomePage.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body: new ListView(
        children: <Widget>[
          search_bar(context),

          Container(
            margin: EdgeInsets.only(left:20,top: 10),
            child: const Text("Find cooperators",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left:50,top: 10, right: 50),
            child: RaisedButton (
                child: Text("Post test"),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PostPage(),
                )),),

          ),

          Container(
            child: Row(

            ),
          ),

          a_post(context),
          a_post(context),
          a_post(context),


        ],
      ),

    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('Find'));
  }

  Widget search_bar(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
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
            margin: EdgeInsets.only(left: 20, top: 15),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            width: 280,
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        ],
      ),
    );
  }

  Widget a_post(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
      color: Color.fromARGB(80, 250, 200, 150),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            child: ClipOval(
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Color.fromARGB(255, 250, 150, 150),
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Name"),
                const Text("Role"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: const Text("Looking for a !"),
          ),

          Container(
            margin: EdgeInsets.only(left:50,top: 5),
            child: IconButton (
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostPage(),
              )),
            ),

          ),

          Container(
            margin: EdgeInsets.only(right: 30.0,top: 5),
            child: IconButton (
              icon: Icon(
                Icons.more_horiz,
                size: 30,
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostPage(),
              )),
            ),
          ),
        ],
      ),
    );
  }


}

