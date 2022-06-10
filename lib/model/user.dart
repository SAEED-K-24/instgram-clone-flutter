import 'package:flutter/cupertino.dart';
import 'package:flutter_application_task/model/post.dart';

class User extends ChangeNotifier{
  String image;
  String username;
  String userId;
  User(this.image, this.username, this.userId);
}
