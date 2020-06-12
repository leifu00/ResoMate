import 'package:flutter/material.dart';

class UploadMusicCoorp extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _UploadMusicCoorpState createState() => _UploadMusicCoorpState();
}

class _UploadMusicCoorpState extends State<UploadMusicCoorp> {
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 25,
          bottom: 180,
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEFF5E9),
            child: buildContent(),
          ),
        ),
        Positioned(
          top: 550,
          left: 20,
          child: Icon(
            Icons.navigate_before,
            size: 60,
          ),
        ),
        Positioned(
          top: 550,
          right: 20,
          child: Icon(
            Icons.navigate_next,
            size: 60,
          ),
        ),
        Positioned(
          height: 150,
          bottom: 0,
          child: Image.asset("assets/background.png"),
        )
      ],
    );
  }

  Widget buildContent() {
    List<String> list = [
      "Singer",
      "Arranger",
      "Lyrics writer",
      "MV maker",
      "Composer",
      "Other"
    ];
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            "Who you are looking for!",
            style: bold1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Wrap(
              spacing: 200.0, // 主轴(水平)方向间距
              runSpacing: 4.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.start,
              children: list
                  .map((String str) => Chip(
                        //              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.only(left: 12, right: 12),
                        label: new Text(
                          str,
                          style: bold2,
                        ),
                      ))
                  .toList()),
        ),
      ],
    );
  }
}
