import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_task/controller/post_controller.dart';
import 'package:flutter_application_task/model/post.dart';
import 'package:flutter_application_task/model/user.dart';
import 'package:flutter_application_task/view/screen/post_screen.dart';
import 'package:flutter_application_task/view/widgets/comment_item.dart';
import 'package:flutter_application_task/view/widgets/user_item.dart';
import 'package:insta_like_button/insta_like_button.dart';
import 'package:provider/provider.dart';

class PostItem extends StatelessWidget {
  Post post;
  String userName;
  bool isCommentScreen;
  PostItem({
    Key? key,
    required this.post,
    required this.userName,
    required this.isCommentScreen,
  }) : super(key: key);

  //bool _isAllowComment = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostController>(
      builder: (ctx, provider, x) {
        return Container(
          //color: Colors.grey,
          //padding: EdgeInsets.all(16),
          height: 500,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                child: InstaLikeButton(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                    "${post.image}",
                  ),
                  imageBoxfit: BoxFit.cover,
                  icon:
                      post.isFavourite ? Icons.favorite : Icons.favorite_border,
                  iconColor: post.isFavourite ? Colors.red : Colors.white,
                  onChanged: () {
                    provider
                        .changeIsFavourite(post);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(8),
                // color: Colors.green,
                height: 50,
                width: double.infinity,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          provider
                              .changeIsFavourite(post);
                        },
                        icon: Icon(
                          post.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          color: post.isFavourite ? Colors.red : Colors.black,
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    IconButton(
                        onPressed: () {
                          if (!isCommentScreen) {
                            Navigator.of(context).pushNamed(
                                PostScreen.postsScreenRoute,
                                arguments: [post, userName]);
                          }
                        },
                        icon: Icon(
                          Icons.mode_comment_outlined,
                          size: 30,
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Transform(
                          transform: Matrix4.rotationZ(5.8),
                          child: Icon(
                            Icons.send,
                            size: 30,
                          ),
                        )),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Saved'),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.grey,
                          ));
                        },
                        icon: Icon(
                          Icons.save_alt_outlined,
                          size: 30,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 12),
                child: Text(
                  '${post.likes} likes',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 12),
                child: Row(
                  children: [
                    Text(
                      '${userName}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${post.title}',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              isCommentScreen
                  ? SizedBox(
                      height: 0,
                    )
                  : Container(
                      margin: EdgeInsetsDirectional.only(start: 12),
                      child: InkWell(
                        onTap: () {
                          //_isCommentShow = !_isCommentShow;
                          // setState(() {

                          // });
                          Navigator.of(context).pushNamed(
                              PostScreen.postsScreenRoute,
                              arguments: [post, userName]);
                        },
                        child: Text(
                          'view all ${post.comments.length} comment',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 16),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
