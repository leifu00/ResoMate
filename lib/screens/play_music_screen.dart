import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayMusicScreen extends StatefulWidget {
  static const String id = 'play_music_screen';

  @override
  _PlayMusicScreenState createState() => _PlayMusicScreenState();
}

BuildContext main_context;

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  @override
  Widget build(BuildContext context) {
    main_context = context;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFF4C6056),
        leading: Icon(
          Icons.keyboard_return,
          color: Color(0xFFFFFFFF),
          size: 35,
        ),
      ),
      body: Container(child: buildColumn()),
    );
  }
}

Widget buildColumn() =>
    // #docregion Column
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
        width: double.infinity,
        height: 78.73,
        child: buildAvatarDescriptionPair(),
        padding: EdgeInsets.fromLTRB(21,21,21,10),
    ),
    Container(
      width: 323,
      height: 222,
      child: Icon(
          Icons.play_circle_filled
      ),
      padding: EdgeInsets.fromLTRB(20,20,20,20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/song1.jpg"),
        )
      ),
    ),
    Container(
        child: buildTitleIconPair(),
    ),
    Container(
        child: buildIconLikePair(),
    ),
    Container(
        child: buildCommentColumn(),
    ),
  ],
);
// #enddocregion Column

Widget buildAvatarDescriptionPair() => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset('assets/pig.jpg'),
    ),
    Container(
      child: buildNameDescriptionPair(),
    ),
  ],
);

Widget buildNameDescriptionPair() => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      child: buildNameAddPair(),
    ),
    Text(
      'This is my final piece of work with Bob! Hope you enjoy! :)',
      style: TextStyle(
        fontFamily: "Sans",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Color(0xFF282E29),
      ),
      softWrap: true,
    ),
  ],
);

Widget buildNameAddPair() => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Alice',
      style: TextStyle(
        fontFamily: "Sans",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Color(0xFF282E29),
      ),
    ),
    Icon(Icons.group_add),
  ],
);

Widget buildTitleIconPair() => Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Container(
      child: buildTitleNamePair(),
    ),
    Container(
      child: buildIconRow(),
    ),
  ],
);

Widget buildTitleNamePair() => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Flower Dance',
      style: TextStyle(
        fontFamily: "Sans",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Color(0xFF282E29),
      ),
      softWrap: true,
    ),
    Text(
      'Alice Bob',
      style: TextStyle(
        fontFamily: "Sans",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Color(0xFF282E29),
      ),
      softWrap: true,
    ),
  ],
);

Widget buildIconRow() => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Icon(Icons.favorite),
    Icon(Icons.textsms),
    Icon(Icons.more_horiz),
  ],
);

Widget buildIconLikePair() => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Icon(Icons.favorite),
    Text(
      '30 likes',
      style: TextStyle(
        fontFamily: "Sans",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Color(0xFF282E29),
      ),
      softWrap: true,
    ),
  ],
);

Widget buildCommentColumn() => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Lisa_111: Wow!',
      style: TextStyle(
        fontFamily: "Sans",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Color(0xFF282E29),
      ),
      softWrap: true,
    ),
    Text(
      'Mary: Great!',
      style: TextStyle(
        fontFamily: "Sans",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Color(0xFF282E29),
      ),
      softWrap: true,
    ),
  ],
);