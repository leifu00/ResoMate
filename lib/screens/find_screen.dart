import 'package:flutter/material.dart';
import 'package:resomate/components/cooperators_list.dart';

class FindScreen extends StatefulWidget {
  static const String id = 'find_screen';

  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
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
        Container(height: 50, child: SearchBar()),
        Container(
            color: Color(0xFFEFF5E9),
            alignment: Alignment.bottomLeft,
            height: 26,
            child: Text(
              "   Find cooperators",
              style: TextStyle(
                fontFamily: "Sans",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF282E29),
              ),
            )),
        Container(
          height: 200,
          child: label(),
        ),
        Container(
          height: 260,
          child: dropdownScreen(),
        ),
      ],
    );

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(29)),
      clipBehavior: Clip.antiAlias,
      child: AppBar(
        backgroundColor: Color(0xFFEFF5E9),
        title: TextField(
          decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, color: Color(0xFF5C5C5C))),
          textInputAction: TextInputAction.search,
        ),
      ),
    );
  }
}

class label extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new labelState();
}

class labelState extends State<label> {
  final List<Tab> tabs = <Tab>[
    new Tab(
      text: 'composer',
    ),
    new Tab(
      text: 'arranger',
    ),
    new Tab(
      text: 'singer',
    ),
    new Tab(
      text: 'lyrics writer',
    ),
    new Tab(
      text: 'MV maker',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: tabs.length,
      child: new Scaffold(
        appBar: TabBar(
          tabs: tabs,
          isScrollable: true,
          labelColor: Color(0xFF0B0B0B),
          unselectedLabelColor: Color(0xFF6D7B6F),
          labelStyle: TextStyle(
            fontFamily: "Sans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        body: new TabBarView(
          children: tabs.map((Tab tab) {
            return new Center(
              child: CooperatorsList(
                type: tab.text,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// #docregion Row

Widget buildAvatarNamePair() =>
    // #docregion Row
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(109.5)),
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/photo.jpg'),
        ),
        Text(
          'Someone',
          style: TextStyle(
            fontFamily: "Sans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color(0xFF282E29),
          ),
        ),
      ],
    );
// #enddocregion Row

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class dropdownScreen extends StatefulWidget {
  State createState() => dropdownScreenState();
}

class dropdownScreenState extends State<dropdownScreen> {
  Item selectedGenre;
  List<Item> genres = <Item>[
    const Item('All', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item(
        'Blues', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item('R&B', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item('Jazz', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item('Rock', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item(
        'Country', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item('Soul', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item(
        'Dance', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item(
        'Hip-hop', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item(
        'C-pop', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
    const Item(
        'Other', Icon(Icons.arrow_forward_ios, color: Color(0xFF5C5C5C))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF5E9),
        title: DropdownButton<Item>(
          hint: Text("Select genres"),
          value: selectedGenre,
          onChanged: (Item Value) {
            setState(() {
              selectedGenre = Value;
            });
          },
          items: genres.map((Item genre) {
            return DropdownMenuItem<Item>(
              value: genre,
              child: Row(
                children: <Widget>[
                  genre.icon,
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    genre.name,
                    style: TextStyle(color: Color(0xFF5C5C5C)),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      body: buildCoorperationList(),
    );
  }
}

Widget buildCoorperationList() => Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildCoorperation(),
        buildCoorperation(),
        buildCoorperation(),
        buildCoorperation(),
      ],
    );

Widget buildCoorperation() =>
    // #docregion Row
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8)),
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/music.jpg'),
        ),
        buildNameNeedPair(),
        IconButton(
          icon: Icon(Icons.person_add, color: Color(0xFF282E29)),
        ),
        IconButton(
          icon: Icon(Icons.message, color: Color(0xFF282E29)),
        ),
      ],
    );
// #enddocregion Row

Widget buildNameNeedPair() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Someone',
          style: TextStyle(
            fontFamily: "Sans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color(0xFF282E29),
          ),
        ),
        Text(
          'Looking for a composer',
          style: TextStyle(
            fontFamily: "Sans",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color(0xFF282E29),
          ),
        ),
      ],
    );
