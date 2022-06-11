import 'package:flutter/material.dart';
import 'package:flutter_application_task/controller/post_controller.dart';
import 'package:flutter_application_task/controller/user_controller.dart';
import 'package:flutter_application_task/provider/bottom_nav_bar_provider.dart';
import 'package:flutter_application_task/view/screen/post_screen.dart';
import 'package:flutter_application_task/view/screen/post_scroll_screen.dart';
import 'package:flutter_application_task/view/screen/search_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'controller/reel_controller.dart';

//ScreenUtilInit
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserController>(create: (ctx) => UserController()),
      ChangeNotifierProvider<ReelController>(create: (ctx) => ReelController()),
      ChangeNotifierProvider<PostController>(create: (ctx) => PostController()),
      ChangeNotifierProvider<BottomNavBarProvider>(
          create: (ctx) => BottomNavBarProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(340, 640),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<BottomNavBarProvider>(
          builder: (context, p, ch) => Scaffold(
            backgroundColor: Colors.white,
            body: p.widgets[p.index],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 10,
              currentIndex: p.index,
              onTap: (i) {
                p.changeIndex(i);
              },
              items: p.items,
            ),
          ),
        ),
        routes: {
          PostsScrollScreen.postsScrollScreenRoute: (context) =>
              PostsScrollScreen(),
          SearchScreen.searchScreenRoute: (context) => SearchScreen(),
          PostScreen.postsScreenRoute: (context) => PostScreen(),
        },
      ),
    );
  }
}
