import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resomate/components/messages_list.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MessagesList(),
    );
  }
}
