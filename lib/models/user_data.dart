import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String currentChatWith = 'Chat';

  void setCurrentChatWIth(String newEmail) {
    currentChatWith = newEmail;
    notifyListeners();
  }
}
