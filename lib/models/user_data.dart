import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String currentChatWith = 'Chat';
  String myEmail;

  void setCurrentChatWIth(String newEmail) {
    currentChatWith = newEmail;
    notifyListeners();
  }

  void setMyEmail(String email) {
    myEmail = email;
  }
}
