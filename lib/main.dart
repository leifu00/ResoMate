import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resomate/screens/copyright_screen.dart';
import 'package:resomate/screens/play_music_screen.dart';
import 'package:resomate/screens/post_screen1.dart';
import 'package:resomate/screens/profile_screen.dart';
import 'package:resomate/screens/regisration_screen.dart';
import 'package:resomate/screens/chat_screen.dart';
import 'package:resomate/screens/trending_screen.dart';
import 'package:resomate/screens/upload_music_screen1.dart';
import 'package:resomate/screens/upload_music_screen2.dart';
import 'package:resomate/screens/upload_screen.dart';
import 'models/user_data.dart';
import 'package:resomate/screens/main_screen.dart';
import 'screens/main_screen.dart';
import 'screens/trending_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        initialRoute: RegistrationScreen.id,
        routes: {
          PlayMusicScreen.id: (context) => PlayMusicScreen(),
          UploadScreen.id: (context) => UploadScreen(),
          UploadMusicType.id: (context) => UploadMusicType(),
          UploadMusicMp3Black.id: (context) => UploadMusicMp3Black(),
          PostScreen1.id: (context) => PostScreen1(),
          CopyRightScreen.id: (context) => CopyRightScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          TrendingScreen.id: (context) => TrendingScreen(),
          MainScreen.id: (context) => MainScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          PlayMusicScreen.id: (context) => PlayMusicScreen(),
        },
      ),
    );
  }
}
