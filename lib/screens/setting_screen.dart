import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(Setting());

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<Setting> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF4C6056)),
      home: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text("Setting"),
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_return,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {},
          ),
        ),
        body: new ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),

//              margin: EdgeInsets.only(top: 35, bottom: 20),

              decoration: new BoxDecoration(
                  color: Color(0xFFEFF5E9),
                  border: new Border.all(color: Color(0xFFD1D1D1), width: 0.5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 5.0), //阴影xy轴偏移量
                        blurRadius: 15.0, //阴影模糊程度
                        spreadRadius: 0.1 //阴影扩散程度
                        )
                  ]),

              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                      child: titles(context, "Portrait"),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(left: 200),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFF282E29),
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: next_button(context),
                  ),
                ],
              ),
            ),

            a_row_with_space(context, "Nickname", "YourName"),
            a_row(context, "Role", "YourRole"),
            a_row(context, "Location", "YourLocation"),

            a_row_with_space(context, "Your tags", "Tags"),

            description_row(context, "Description", "I am alice and i love music")
          ],
        ),
      ),
    );
  }

  Text titles(BuildContext context, String text) {
    return new Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF282E29),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text contents(BuildContext context, String text) {
    return new Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF282E29),
      ),
    );
  }

  Container next_button(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: IconButton(
        icon: Icon(
          Icons.navigate_next,
          color: Color(0xFF727673),
          size: 40,
        ),
        onPressed: () {},
      ),
    );
  }

  Container a_row(BuildContext context, String title, String content) {
    return Container(
//              margin: EdgeInsets.only(top: 35, bottom: 20),

      decoration: new BoxDecoration(
          color: Color(0xFFEFF5E9),
          border: new Border.all(color: Color(0xFFD1D1D1), width: 0.5),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 5.0), //阴影xy轴偏移量
                blurRadius: 15.0, //阴影模糊程度
                spreadRadius: 0.1 //阴影扩散程度
                )
          ]),

      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: titles(context, title)),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: contents(context, content),
            ),
          ),
          Expanded(
            flex: 1,
            child: next_button(context),
          ),
        ],
      ),
    );
  }

  Container a_row_with_space(
      BuildContext context, String title, String content) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: a_row(context, title, content),
    );
  }

  Container description_row(
      BuildContext context, String title, String content) {
    return Container(
      margin: EdgeInsets.only(top: 50),

//              margin: EdgeInsets.only(top: 35, bottom: 20),

      decoration: new BoxDecoration(
          color: Color(0xFFEFF5E9),
          border: new Border.all(color: Color(0xFFD1D1D1), width: 0.5),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 5.0), //阴影xy轴偏移量
                blurRadius: 15.0, //阴影模糊程度
                spreadRadius: 0.1 //阴影扩散程度
                )
          ]),

      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  child: titles(context, title)),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: contents(context, content),
              ),
            ),
            Expanded(
              flex: 1,
              child: next_button(context),
            ),
          ],
        ),
      ),
    );
  }
}
