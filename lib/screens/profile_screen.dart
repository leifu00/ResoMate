import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextStyle style1 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 25,
    color: Color(0xFF3E4840),
  );

  TextStyle style2 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 25,
  );

  TextStyle style3 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 18,
  );

  TextStyle defaultStyle = TextStyle(
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              children: <Widget>[
                buildProfile(),
                buildProduction(),
              ]
          ),
    );
  }

  Widget buildProfile(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Text(
                  "Profile",
                  style: style1
              ),
              Container(
                margin: EdgeInsets.only(left: 250),
                child: Icon(Icons.settings, size: 40,),
              )

            ],
          )
        ),
        Divider(height: 1.0, thickness: 2,endIndent: 200),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                  child: new CircleAvatar(
                    radius: 61,
                    backgroundImage: AssetImage('assets/face.png'),
                  )
              ),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.border_color),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Alice",
                            style: style2,
                          ),
                        )

                      ],
                    ),
                    Text("MV producer", style: defaultStyle,),
                    Text("London UK", style: defaultStyle,),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: new ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                color: Color(0xFFEFF5E9),
                height: 80,
                width: 400,
                child: buildStatisticsTable(),
              )
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
          margin: EdgeInsets.only(top: 20),
          child: Text(
              "Production",
              style: style1
          ),
        ),
        Divider(height: 1.0, thickness: 2,endIndent: 200),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              new ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    height: 80,
                    width: 80,
                    child: new Image.asset(
                        'assets/4.png'
                    ),
                  )
              ),
              Text("Flower dance"),

            ],
          ),
        )
      ],
    );
  }

  Widget buildStatisticsTable() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Row(
//        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "4,324",
                  style: style3,
                ),
                Text("Likes", style: defaultStyle,),
              ],
            ),
          ),
          VerticalDivider(width: 1.0, thickness: 2,endIndent: 20,),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "1,005",
                  style: style3,
                ),
                Text("Follows", style: defaultStyle,),
              ],
            ),
          ),
          VerticalDivider(width: 1.0, thickness: 2,endIndent: 20,),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "876",
                  style: style3,
                ),
                Text("Following", style: defaultStyle,),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
