import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resomate/screens/regisration_screen.dart';
import 'package:resomate/screens/chat_screen.dart';
import 'package:resomate/screens/search_screen.dart';
import 'models/user_data.dart';
import 'package:resomate/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
        },
      ),
    );
  }
}
