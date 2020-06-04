import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resomate/models/user_data.dart';
import 'package:resomate/screens/chat_screen.dart';
import 'package:provider/provider.dart';

final _firestore = Firestore.instance;

class MessagesList extends StatefulWidget {
  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  @override
  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemBuilder: (context, index) {
//        return Text(posts[index]);
//      },
//      itemCount: 3,
//    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
      stream: _firestore.collection('messages').snapshots(),
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
          postsList.add(OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                context
                    .read<UserData>()
                    .setCurrentChatWIth(post.data['sender']);
                Navigator.pushNamed(context, ChatScreen.id);
              },
              child: Row(
                children: <Widget>[
                  Text(
                    post.data['text'],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    post.data['sender'],
                  )
                ],
              )));
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: postsList,
          ),
        );
      },
    );
  }
}
