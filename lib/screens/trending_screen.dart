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
  children: [
    Container(
        height: 30,
        child: Text("TOP MUSIC")
    ),
    Container(
        height: 150,
        child: TopMusic()
    ),
    Container(
        height: 150,
        child: TopMusic()
    ),
    Container(
        height: 30,
        child: Text("Golden Musicians")
    ),
    Container(
      height: 150,
      child: GoldenMusicians(),
    ),
  ],
);
// #enddocregion Column

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
    Image.asset('assets/music_cover.jpg'),
    Text('Some Music'),
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
  ],
);
// #enddocregion Row

Widget buildMusicianNamePair() =>
    // #docregion Row
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset('assets/face.png'),
    Text('Someone'),
  ],
);
// #enddocregion Row