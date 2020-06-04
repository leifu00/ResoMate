import 'package:flutter/material.dart';

class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  List<String> posts = ['a', 'b', 'c'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(posts[index]);
      },
      itemCount: 3,
    );
  }
}
