import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingScreen extends StatefulWidget {
  static const String id = 'trending_screen';

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: buildColumn());
  }
}

Widget buildColumn() =>
    // #docregion Column
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
        alignment: Alignment.bottomCenter,
        width: 145,
        height: 37,
        child: Text(
          "TOP MUSIC",
          style: TextStyle(
              fontFamily: "Sans",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w900,
              fontSize: 24,
              color: Color(0xFF3E4840),
          ),
        )
    ),
    Container(
        height: 5,
        color: Color(0xFF29E88C),
    ),
    Container(
      height: 5,
      color: Color(0xFF3E4840),
    ),
    Container(
        color: Color(0xFFEFF5E9),
        child: buildTopMusicColumn()
    ),
    Container(
      height: 5,
      color: Color(0xFF3E4840),
    ),
    Container(
      height: 5,
      color: Color(0xFF29E88C),
    ),
    Container(
        alignment: Alignment.bottomCenter,
        width: 210,
        height: 27,
        child: Text(
          "Golden Musicians",
          style: TextStyle(
            fontFamily: "Sans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Color(0xFF3E4840),
          ),
        )
    ),
    Container(
      height: 5,
      color: Color(0xFF29E88C),
    ),
    Container(
      height: 5,
      color: Color(0xFF3E4840),
    ),
    Container(
      color: Color(0xFFEFF5E9),
      child: buildGoldenMusiciansColumn(),
    ),
    Container(
      height: 5,
      color: Color(0xFF3E4840),
    ),
    Container(
      height: 5,
      color: Color(0xFF29E88C),
    ),
  ],
);
// #enddocregion Column

Widget buildTopMusicColumn() =>
    // #docregion Row
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    TopMusic(),
    TopMusic(),
  ],
);
// #enddocregion Row

class TopMusic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TopMusicState();
}

class TopMusicState extends State<TopMusic> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildMusicCoverRow(),
    );
  }
}

Widget buildMusicCoverRow() =>
    // #docregion Row
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    buildMusicCoverNamePair(),
    buildMusicCoverNamePair(),
    buildMusicCoverNamePair(),
  ],
);
// #enddocregion Row

Widget buildMusicCoverNamePair() =>
    // #docregion Row
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(18)
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset('assets/music_cover.jpg'),
    ),
    Text(
      'Some Music',
      style: TextStyle(
        fontFamily: "Sans",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 11,
        color: Color(0xFF3E4840),
      ),
    ),
  ],
);
// #enddocregion Row

Widget buildGoldenMusiciansColumn() =>
    // #docregion Row
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    GoldenMusicians(),
    GoldenMusicians(),
  ],
);
// #enddocregion Row

class GoldenMusicians extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GoldenMusiciansState();
}

class GoldenMusiciansState extends State<GoldenMusicians> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildMusiciansRow(),
    );
  }
}

Widget buildMusiciansRow() =>
    // #docregion Row
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    buildMusicianNamePair(),
    buildMusicianNamePair(),
    buildMusicianNamePair(),
    buildMusicianNamePair(),
    buildMusicianNamePair(),
  ],
);
// #enddocregion Row

Widget buildMusicianNamePair() =>
    // #docregion Row
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(109.5)
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset('assets/face.png'),
    ),
    Text(
      'Someone',
      style: TextStyle(
        fontFamily: "Sans",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Color(0xFF2E2F2E),
      ),
    ),
  ],
);
// #enddocregion Row