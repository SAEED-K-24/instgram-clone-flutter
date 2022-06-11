import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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