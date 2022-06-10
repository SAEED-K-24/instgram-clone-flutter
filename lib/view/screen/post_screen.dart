import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_task/controller/post_controller.dart';
import 'package:flutter_application_task/model/comment.dart';
import 'package:flutter_application_task/model/post.dart';
import 'package:flutter_application_task/view/widgets/comment_item.dart';
import 'package:flutter_application_task/view/widgets/post_item.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  static String postsScreenRoute = '_postScreen';

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final _formKey = GlobalKey<FormState>();
  String? c;
  TextEditingController _controller = TextEditingController();

  _message(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
      duration: Duration(milliseconds: 1500),
      backgroundColor: Colors.grey,
    ));
  }


  @override
  Widget build(BuildContext context) {
    List arg = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final _post = arg.elementAt(0);
    final _userName = arg.elementAt(1);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            PostItem(
              post: _post,
              userName: _userName,
              isCommentScreen: true,
            ),
            _post.comments.length > 0
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, i) =>
                        CommentItem(comment: _post.comments.elementAt(i)),
                    separatorBuilder: (ctx, i) => SizedBox(
                          height: 3,
                        ),
                    itemCount: _post.comments.length)
                : Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text('No comment yet')),
            _textFormField(_post, context),
          ],
        ),
      ),
    );
  }

  Widget _textFormField(Post post, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 45,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
              alignment: Alignment.center,
              icon:const Icon(Icons.send),
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (!isValid) {
                  return;
                }
                _formKey.currentState!.save();
                var r = Random();
                int num = r.nextInt(5);
                print('num is $num');
                print('assets/images/user${num + 1}.png');
                String im;
                if (num == 0) {
                  im = 'assets/images/user${num + 1}.png';
                } else {
                  im = 'assets/images/user${num + 1}.jpg';
                }

                Provider.of<PostController>(context, listen: false)
                    .addComment(Comment('$im', c!), post);

                _message('added comment', context);
                _controller.clear();
                setState(() {});
              },
            ),
          ),
          onSaved: (value) {
            c = value;
          }),
    );
  }
}
