import 'package:flutter/material.dart';
import 'package:flutter_application_task/controller/post_controller.dart';
import 'package:flutter_application_task/controller/user_controller.dart';
import 'package:flutter_application_task/view/widgets/post_item.dart';
import 'package:flutter_application_task/view/widgets/user_item.dart';
import 'package:provider/provider.dart';

class PostsScroll extends StatelessWidget {

  int index;
  PostsScroll({required this.index});

  
  Widget build(BuildContext context) {

    return Consumer2<PostController,UserController>(
      builder: (ctx,_posts,_users,ch) => Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView(children: [
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) => Column(
                    children: [
                      UserItem(
                        user: _users.users.elementAt(i),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PostItem(
                          post: _posts.posts.elementAt(i+index),
                          userName: _users.users.elementAt(i+index).username,
                          isCommentScreen: false),
                    ],
                  ),
              separatorBuilder: (ctx, i) => SizedBox(
                    height: 20,
                  ),
              itemCount: _posts.posts.length - index),
        ]),
      ),
      
    );
  }
}
