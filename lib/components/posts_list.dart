import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  List<String> posts = ['a', 'b', 'c'];

  @override
  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemBuilder: (context, index) {
//        return Text(posts[index]);
//      },
//      itemCount: 3,
//    );
    return Column(
      children: <Widget>[
        PostsStream(),
      ],
    );
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
        List<Text> postsList = [];
        for (var post in posts) {
          postsList.add(Text(post.data['type']));
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: postsList,
          ),
        );
      },
    );
  }
}
