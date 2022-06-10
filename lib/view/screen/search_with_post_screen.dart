import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_task/controller/post_controller.dart';
import 'package:flutter_application_task/controller/user_controller.dart';
import 'package:flutter_application_task/model/user.dart';
import 'package:flutter_application_task/view/screen/post_scroll_screen.dart';
import 'package:flutter_application_task/view/screen/search_screen.dart';
import 'package:provider/provider.dart';

class SearchWithPostScreen extends StatelessWidget {
  const SearchWithPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Consumer2<PostController,UserController>(
      builder: (ctx,_posts,_users,ch)=>Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(
            children: [
              _searchTextFormField(context, _users.users),
              const SizedBox(
                height: 3,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1),
                itemBuilder: (ctx, i) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(PostsScrollScreen.postsScrollScreenRoute,arguments: i);
                    },
                    child: _postGrid(_posts.posts[i].image, context)),
                itemCount: _posts.posts.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _postGrid(String image, BuildContext context) {
    return  Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 1 / 3,
      child: Image.asset(
        '$image',
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _searchTextFormField(BuildContext context, List<User> _users) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SearchScreen.searchScreenRoute);
      },
      child: Container(
        padding:const EdgeInsets.only(left: 12),
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 50,
        margin:const EdgeInsetsDirectional.only(top: 2, start: 8, end: 8, bottom: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade300,
        ),
        child:const Icon(Icons.search),
      ),
    );
  }
}
