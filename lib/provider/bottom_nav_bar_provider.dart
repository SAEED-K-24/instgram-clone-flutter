import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_task/view/screen/activity_screen.dart';
import 'package:flutter_application_task/view/screen/home_screen.dart';
import 'package:flutter_application_task/view/screen/profile_screen.dart';
import 'package:flutter_application_task/view/screen/reels_screen.dart';
import 'package:flutter_application_task/view/screen/search_with_post_screen.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int index = 0;

// ignore: prefer_final_fields
  List<Widget> widgets = [
    HomeScreen(),
    SearchWithPostScreen(),
    ReelsScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_sharp,
          color: Colors.black,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        label: ''),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.add_box,
          color: Colors.black,
        ),
        label: ''),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        label: ''),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.account_box,
          color: Colors.black,
        ),
        label: ''),
  ];

  changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
