import 'package:flutter/material.dart';
import 'package:flutter_application_task/controller/post_controller.dart';
import 'package:flutter_application_task/controller/user_controller.dart';
import 'package:flutter_application_task/view/screen/posts_scroll.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,elevation: 3,
        centerTitle: true,
        leading: IconButton(icon:Icon(Icons.camera_alt,color: Colors.black),onPressed: (){},),
      title: SizedBox(
          height: 35.0, child: Image.asset("assets/images/insta_logo.png")),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(icon:Transform(transform: Matrix4.rotationZ(5.8),child: Icon(Icons.send,color: Colors.black)),onPressed: (){},),
        )
      ],
        ),
        body: PostsScroll(index:0,), 
    );
  }
}
