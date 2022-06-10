import 'package:flutter/cupertino.dart';
import 'package:flutter_application_task/model/comment.dart';
import 'package:flutter_application_task/view/widgets/comment_item.dart';

class Post  {
  String image;
  String title;
  int likes;
  List<Comment> _comments = [];
  bool isFavourite = false;
  Post(
    this.image,
    this.title,
    this.likes,
  );


  List<Comment> get comments {
    return _comments;
  }

  

  
}
