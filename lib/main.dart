import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user_data.dart';
import 'package:resomate/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
