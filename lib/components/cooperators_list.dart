import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class CooperatorsList extends StatefulWidget {
  final String type;

  const CooperatorsList({Key key, this.type}) : super(key: key);
  @override
  _CooperatorsListState createState() => _CooperatorsListState();
}

class _CooperatorsListState extends State<CooperatorsList> {
  @override
  Widget build(BuildContext context) {
    return CooperatorsStream(
      type: widget.type,
    );
  }
}

class CooperatorsStream extends StatelessWidget {
  final String type;

  const CooperatorsStream({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('musicians').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final musicians = snapshot.data.documents.reversed;
        List<Widget> musiciansList = [];
        for (var musician in musicians) {
          if (musician.data['type'] != type.toString()) {
            print(type);
            print(musician.data['type']);
            continue;
          }
          print('here');
          musiciansList.add(Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(109.5)),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  musician.data['avatar'],
                  scale: 3,
                ),
              ),
              Text(
                musician.data['name'],
                style: TextStyle(
                  fontFamily: "Sans",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0xFF282E29),
                ),
              ),
            ],
          ));
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: musiciansList,
          ),
        );
      },
    );
  }
}
