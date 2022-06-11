import 'package:flutter/material.dart';
import 'package:flutter_application_task/controller/post_controller.dart';
import 'package:flutter_application_task/controller/user_controller.dart';
import 'package:flutter_application_task/provider/bottom_nav_bar_provider.dart';
import 'package:flutter_application_task/view/screen/home_screen.dart';
import 'package:flutter_application_task/view/screen/post_screen.dart';
import 'package:flutter_application_task/view/screen/post_scroll_screen.dart';
import 'package:flutter_application_task/view/screen/search_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'controller/reel_controller.dart';

//ScreenUtilInit
void main() {
  runApp(
    MultiProvider(providers: 
  [
    ChangeNotifierProvider<UserController>(create:(ctx)=>UserController() ),
    ChangeNotifierProvider<ReelController>(create:(ctx)=>ReelController() ),
    ChangeNotifierProvider<PostController>(create:(ctx)=>PostController() ),
    ChangeNotifierProvider<BottomNavBarProvider>(create:(ctx)=>BottomNavBarProvider() ),
  ],
  child: MyApp(),
  ) );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(340, 640),
      builder: () => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      Consumer<BottomNavBarProvider>(
        builder: (context,p,ch)=>Scaffold(
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
        PostsScrollScreen.postsScrollScreenRoute:(context)=>PostsScrollScreen(),
        SearchScreen.searchScreenRoute:(context)=>SearchScreen(),
        PostScreen.postsScreenRoute:(context)=>PostScreen(),
      },
      ),
    );
  }
}



class ContentScreen extends StatefulWidget {

  const ContentScreen({Key? key,}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 14,left: 14,bottom: 2),
        child: ListView(
          children: 
          [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Text('Name name',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              IconButton(onPressed: (){}, icon: Icon(Icons.category))
            ],
            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(right: 8),
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: 
                [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user1.png'),
                    radius: 45,
                  ),
                  
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: 
                      [
                        Text('0'),
                        Text('Posts'),
                      ],
                    ),
                    
                  ),
                  
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: 
                      [
                        Text('66'),
                        Text('Followers'),
                      ],
                    ),
                    
                  ),
                  
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: 
                      [
                        Text('98'),
                        Text('Following'),
                      ],
                    ),
                    
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 2),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  Text('Name name'),
                  SizedBox(height: 2,),
                  Text('off'),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              color: Colors.grey.shade300,
              width: MediaQuery.of(context).size.width,
              child: TextButton(onPressed: (){},child:Text('Edit Profile',style: TextStyle(color: Colors.black),)),
            ),
          ],
        ),
      ),
    );
  }
}