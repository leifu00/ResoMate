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
    return MessagesStream();
  }
}

class MessagesStream extends StatelessWidget {
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
        final messages = snapshot.data.documents.reversed;
        List<Widget> messagesList = [];
        for (var message in messages) {
          if (message.data['sender'] == context.watch<UserData>().myEmail) {
            continue;
          }
//          postsList.add(OutlineButton(
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(10),
//              ),
//              onPressed: () {
//                context
//                    .read<UserData>()
//                    .setCurrentChatWIth(post.data['sender']);
//                Navigator.pushNamed(context, ChatScreen.id);
//              },
//              child: Row(
//                children: <Widget>[
//                  Text(
//                    post.data['text'],
//                  ),
//                  SizedBox(
//                    width: 20,
//                  ),
//                  Text(
//                    post.data['sender'],
//                  )
//                ],
//              )));
          messagesList.add(
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(),
                ),
              ),
              child: ListTile(
                  leading: Icon(Icons.message),
                  onTap: () {
                    context
                        .read<UserData>()
                        .setCurrentChatWIth(message.data['sender']);
                    Navigator.pushNamed(context, ChatScreen.id);
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        message.data['sender'],
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        message.data['text'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )),
            ),
          );
        }
        return ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: messagesList,
          ).toList(),
        );
      },
    );
  }
}
