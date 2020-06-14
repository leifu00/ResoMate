import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String currentChatWith = 'Chat';
  String myEmail;
  int uploadMusicStep = -1;
  String genre;
  String target;
  String post;
  String mp3_url;

  String currentName;
  String currentPost;
  String currentUrl;

  String name = 'Peter';

  void setCurrentName(String name) {
    currentName = name;
    notifyListeners();
  }

  void setCurrentPost(String post) {
    currentPost = post;
    notifyListeners();
  }

  void setCurrentUrl(String url) {
    currentUrl = url;
    notifyListeners();
  }

  void setMp3Url(String url) {
    mp3_url = url;
    print('reached here, $mp3_url');
    notifyListeners();
  }

  void setPost(String newPost) {
    post = newPost;
    print(post);
    notifyListeners();
  }

  void setTarget(String newTarget) {
    target = newTarget;
    notifyListeners();
  }

  void setGenre(String newGenre) {
    genre = newGenre;
    notifyListeners();
  }

  void setCurrentChatWIth(String newEmail) {
    currentChatWith = newEmail;
    notifyListeners();
  }

  void setMyEmail(String email) {
    myEmail = email;
  }

  void setUploadMusicStep(int newStep) {
    uploadMusicStep = newStep;
    notifyListeners();
  }
}
