import 'package:flutter/cupertino.dart';
import 'package:flutter_application_task/model/comment.dart';
import 'package:flutter_application_task/view/widgets/comment_item.dart';

class Reel  {
  String video;
  String title;
  int likes;
  List<Comment> _comments = [];
  bool isFavourite = false;


  Reel(this.video, this.title, this.likes);

  List<Comment> get comments {
    return _comments;
  }


}
