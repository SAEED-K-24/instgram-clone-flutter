import 'package:flutter/cupertino.dart';

class Comment {
  String image;
  String comment;
  bool isFavourite = false;

  Comment(
    this.image,
    this.comment,
  );

  void changeIsFavourite() {
    isFavourite = !isFavourite;
  }
}
