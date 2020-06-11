import 'package:flutter/material.dart';
import 'package:resomate/models/user_data.dart';
import 'search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'message_screen.dart';
import 'package:provider/provider.dart';

import 'trending_screen.dart';
import 'find_screen.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        print(user.email);
        loggedInUser = user;
        context.read<UserData>().setMyEmail(user.email);
      }
    } catch (e) {
      print(e);
    }
  }

  int _selectedIndex = 1;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static List<Widget> _widgetOptions = <Widget>[
    TrendingScreen(),
    FindScreen(),
    MessageScreen(),
    Text(
      'Index 3: Me',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFF4C6056),
        leading: Icon(Icons.graphic_eq,
            color: Color(0xFFFFFFFF),
            size: 35,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Find'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xFF6FA06C),
        unselectedItemColor: Color(0xFF2E2F2E),
        selectedItemColor: Color(0xFFFAFAFA),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
