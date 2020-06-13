import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextStyle bold1 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 22,
    color: Color(0xFF282E29),
  );

  TextStyle bold2 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 18,
    color: Color(0xFF282E29),
  );

  TextStyle defaultStyle = TextStyle(
    fontSize: 16,
    color: Color(0xFF282E29),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAFAFA),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          buildProfile(),
          buildProduction(),
        ]),
      ),
    );
  }

  Widget buildProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Profile", style: bold1),
                Container(
                  margin: EdgeInsets.only(left: 250),
                  child: Icon(
                    Icons.settings,
                    size: 40,
                    color: Color(0xFF282E29),
                  ),
                )
              ],
            )),
        Divider(height: 1.0, thickness: 2, endIndent: 220),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFD1D1D1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(61),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFD1D1D1),
                          offset: Offset(0, 4),
                          blurRadius: 5,
                        ),
                      ]),
                  margin: EdgeInsets.only(top: 7),
                  child: new CircleAvatar(
                    radius: 61,
                    backgroundImage: AssetImage('assets/pig.jpg'),
                  )),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.border_color,
                            color: Color(0xFF282E29),
                            size: 20,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Text(
                            "Alice",
                            style: bold1,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "MV producer",
                      style: defaultStyle,
                    ),
                    Text(
                      "London UK",
                      style: defaultStyle,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "self introduction",
                        style: defaultStyle,
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
            left: 10,
            right: 10,
          ),
          child: new ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Color(0xFFEFF5E9),
                height: 80,
                child: buildStatisticsTable(),
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              buildTag("Jazz"),
              buildTag("London"),
            ],
          ),
        )
      ],
    );
  }

  Widget buildProduction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("Production", style: bold1),
        ),
        Divider(height: 1.0, thickness: 2, endIndent: 220),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              new ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Color(0xFFE2E2E2),
                    height: 102,
                    width: 96,
                    child: new Image.asset('assets/song1.jpg'),
                  )),
              Text("Flower dance"),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildStatisticsTable() {
    return Container(
      margin: EdgeInsets.only(top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "4,324",
                  style: bold2,
                ),
                Text(
                  "Likes",
                  style: defaultStyle,
                ),
              ],
            ),
          ),
          VerticalDivider(
            width: 1.0,
            thickness: 2,
            endIndent: 20,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "1,005",
                  style: bold2,
                ),
                Text(
                  "Follows",
                  style: defaultStyle,
                ),
              ],
            ),
          ),
          VerticalDivider(
            width: 1.0,
            thickness: 2,
            endIndent: 20,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "876",
                  style: bold2,
                ),
                Text(
                  "Following",
                  style: defaultStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTag(String str) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Text("#" + str, style: defaultStyle,),
    );
  }
}
