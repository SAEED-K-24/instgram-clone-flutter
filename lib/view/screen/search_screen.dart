import 'package:flutter/material.dart';
import 'package:flutter_application_task/controller/user_controller.dart';
import 'package:flutter_application_task/model/user.dart';
import 'package:flutter_application_task/view/widgets/user_item.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static String searchScreenRoute = '_searchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode focusNode = FocusNode();
  List<User> items = [];
  String notFound = '';

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);

    return Consumer<UserController>(
      builder: (ctx,_users,ch)=>Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(
            children: [
              _searchTextFormField(_users.users),
              const SizedBox(
                height: 8,
              ),
              items.length < 1
                  ? Center(child: Text(notFound))
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, i) => UserItem(user: items[i]),
                        itemCount: items.length,
                      ),
                    ),
            ],
          ),
        ),
      ), 
    );
  }

  Widget _searchTextFormField(List<User> _users) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 2, start: 8, end: 8, bottom: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: TextFormField(
        onChanged: (value) {
          filterSearchResults(value, _users);
        },
        focusNode: focusNode,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void filterSearchResults(String query, List<User> _users) {
    List<User> dummySearchList = [];

    dummySearchList.addAll(_users);
    if (query.isNotEmpty) {
      List<User> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.username.contains(query) || item.userId.contains(query)) {
          dummyListData.add(item);
        } else {
          notFound = 'No people found';
          setState(() {});
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(_users);
      });
    }
  }
}
