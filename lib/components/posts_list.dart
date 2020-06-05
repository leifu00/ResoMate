import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resomate/models/user_data.dart';
import 'package:resomate/screens/chat_screen.dart';
import 'package:provider/provider.dart';

final _firestore = Firestore.instance;
List<Icon> icons = [
  Icon(Icons.music_note),
  Icon(Icons.movie),
  Icon(Icons.create),
];

List<String> types = [
  'singer',
  'MV Producer',
  'composer',
];

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemBuilder: (context, index) {
//        return Text(posts[index]);
//      },
//      itemCount: 3,
//    );
    return PostsStream();
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      children: <Widget>[
//        PostsStream(),
//      ],
//    );
  }
}

class PostsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final posts = snapshot.data.documents.reversed;
        List<Widget> postsList = [];
        for (var post in posts) {
          if (post.data['email'] == context.watch<UserData>().myEmail) {
            continue;
          }
          postsList.add(Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(),
              ),
            ),
            child: ListTile(
                leading: icons[post.data['type']],
                onTap: () {
                  context
                      .read<UserData>()
                      .setCurrentChatWIth(post.data['email']);
                  Navigator.pushNamed(context, ChatScreen.id);
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.data['email'],
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Looking for a ${types[post.data['type']]}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                )),
          ));
        }
        return ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: postsList,
          ).toList(),
        );
      },
    );
  }
}
