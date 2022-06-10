import 'package:flutter/material.dart';
import 'package:flutter_application_task/view/screen/posts_scroll.dart';

class PostsScrollScreen extends StatelessWidget {
  static String postsScrollScreenRoute = '_postScrollScreen';

  PostsScrollScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: PostsScroll(
          index: index,
        ),
      ),
    );
  }
}
