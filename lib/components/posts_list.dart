import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resomate/models/user_data.dart';
import 'package:resomate/screens/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:resomate/screens/play_music_screen.dart';

final _firestore = Firestore.instance;

class PostsList extends StatefulWidget {
  final String genre;

  const PostsList({Key key, this.genre}) : super(key: key);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    return PostsStream(
      genre: widget.genre,
    );
  }
}

class PostsStream extends StatelessWidget {
  final String genre;

  const PostsStream({Key key, this.genre}) : super(key: key);

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
          if (post.data['genre'] != genre && genre != 'All') {
            continue;
          }
          postsList.add(GestureDetector(
            onTap: () => {
              context.read<UserData>().setCurrentName(post.data['name']),
              context.read<UserData>().setCurrentPost(post.data['post']),
              context.read<UserData>().setCurrentUrl(post.data['url']),
              Navigator.pushNamed(context, PlayMusicScreen.id)
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset('assets/music.jpg'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.data['name'],
                          style: TextStyle(
                            fontFamily: "Sans",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xFF282E29),
                          ),
                        ),
                        Text(
                          post.data['post'],
                          style: TextStyle(
                            fontFamily: "Sans",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xFF282E29),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.person_add, color: Color(0xFF282E29)),
                    ),
                    IconButton(
                      icon: Icon(Icons.message, color: Color(0xFF282E29)),
                    ),
                  ],
                ),
              ],
            ),
          ));
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: postsList,
        );
      },
    );
  }
}
