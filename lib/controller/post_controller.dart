import 'package:flutter/cupertino.dart';
import 'package:flutter_application_task/model/comment.dart';
import 'package:flutter_application_task/model/post.dart';

class PostController extends ChangeNotifier {
  final posts = [
    Post(
      'assets/images/car.jpg',
      'look at my amazing car',
      8,
    ),
    Post(
      'assets/images/nabat.jpg',
      'look at my amazing planet',
      420,
    ),
    Post(
      'assets/images/amazaon.jpg',
      'look at my amazing amazon',
      42,
    ),
    Post(
      'assets/images/glasses.jpg',
      'look at my amazing glasses',
      76,
    ),
    Post(
      'assets/images/watch.jpg',
      'look at my amazing watch',
      444,
    ),
  ];


  updateSinglePost(Post post) {
    int index = posts.indexOf(post);
    posts[index] = post;
    notifyListeners();
  }

  void changeIsFavourite(Post post) {
    post.isFavourite = !post.isFavourite;
    updateSinglePost(post);
  }

  void addComment(Comment c, Post post) {
    post.comments.add(c);
    updateSinglePost(post);
  }

  void changeCommentIsFavourite(Comment c) {
    c.isFavourite = !c.isFavourite;
    notifyListeners();
  }
}
