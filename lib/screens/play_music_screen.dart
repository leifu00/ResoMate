import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resomate/main.dart';
import 'package:resomate/models/user_data.dart';
import 'package:resomate/components/audio_provider.dart';
import 'package:audioplayer/audioplayer.dart';

class PlayMusicScreen extends StatefulWidget {
  static const String id = 'play_music_screen';

  @override
  _PlayMusicScreenState createState() => _PlayMusicScreenState();
}

BuildContext main_context;

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  static String url = main_context.watch<UserData>().currentUrl;
  AudioPlayer audioPlayer = new AudioPlayer();
  AudioProvider audioProvider = new AudioProvider(url);

  play() async {
    String localUrl = await audioProvider.load();
    audioPlayer.play(localUrl, isLocal: true);
  }

  Widget buildColumn() =>
      // #docregion Column
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 130,
            child: buildAvatarDescriptionPair(),
            padding: EdgeInsets.fromLTRB(21, 21, 21, 21),
          ),
          Container(
            width: double.infinity,
            height: 222,
            child: GestureDetector(
              onTap: play,
              child: Icon(
                Icons.play_circle_filled,
                color: Color(0xF0282E29),
                size: 80,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(new Radius.circular(44)),
                image: DecorationImage(
                  image: AssetImage('assets/song1.jpg'),
                )),
          ),
          Container(
            width: double.infinity,
            child: buildTitleIconPair(),
            padding: EdgeInsets.fromLTRB(21, 0, 21, 21),
          ),
          Container(
            width: double.infinity,
            color: Color(0xFFE2EDE6),
            child: buildIconLikePair(),
            margin: EdgeInsets.fromLTRB(21, 0, 21, 0),
          ),
          Container(
            height: 2,
            color: Color(0xFFD1D1D1),
            margin: EdgeInsets.fromLTRB(21, 0, 21, 0),
          ),
          Container(
            width: double.infinity,
            color: Color(0xFFE2EDE6),
            child: buildCommentColumn(),
            margin: EdgeInsets.fromLTRB(21, 0, 21, 0),
          ),
        ],
      );
// #enddocregion Column

  @override
  Widget build(BuildContext context) {
    main_context = context;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFF4C6056),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_return,
            color: Color(0xFFFFFFFF),
            size: 35,
          ),
        ),
      ),
      body: Container(child: buildColumn()),
    );
  }
}

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
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        ),
      ],
    );

Widget buildNameDescriptionPair() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: buildNameAddPair(),
        ),
        Container(
          width: 260,
          child: Text(
            main_context.watch<UserData>().currentPost,
            style: TextStyle(
              fontFamily: "Sans",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF000000),
            ),
            softWrap: true,
          ),
        )
      ],
    );

Widget buildNameAddPair() => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          main_context.watch<UserData>().currentName,
          style: TextStyle(
            fontFamily: "Sans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF282E29),
          ),
        ),
        Icon(Icons.group_add, color: Color(0xFF282E29)),
      ],
    );

Widget buildTitleIconPair() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            fontSize: 18,
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
            fontSize: 13,
            color: Color(0xFF828282),
          ),
          softWrap: true,
        ),
      ],
    );

Widget buildIconRow() => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.favorite, color: Color(0xFF282E29)),
        Icon(Icons.textsms, color: Color(0xFF282E29)),
        Icon(Icons.more_horiz, color: Color(0xFF282E29)),
      ],
    );

Widget buildIconLikePair() => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.favorite_border,
          color: Color(0xFFFF3232),
          size: 15,
        ),
        Text(
          '30 likes',
          style: TextStyle(
            fontFamily: "Sans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color(0xFF000000),
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
            color: Color(0xFF000000),
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
            color: Color(0xFF000000),
          ),
          softWrap: true,
        ),
      ],
    );
