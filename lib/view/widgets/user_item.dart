import 'package:flutter/material.dart';
import 'package:flutter_application_task/constant.dart';
import 'package:flutter_application_task/model/user.dart';

class UserItem extends StatelessWidget {
  User user;
  bool isStrokeText;
  UserItem({
    Key? key,
    required this.user,
    this.isStrokeText = false ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            //margin: EdgeInsetsDirectional.only(top: 8, end: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('${user.image}'), fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isStrokeText ?
              textWithStroke(
                text: '${user.username}', 
                fontSize: 14,
                textColor: Colors.white,
                strokeColor: Colors.black,
                strokeWidth: 0.5,
              ) : Text(
              '${user.username}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              ),
              SizedBox(
                height: 2,
              ),
              isStrokeText ?
              textWithStroke(
                text: '${user.userId}',
                textColor: Colors.grey.shade600,
                fontSize: 14,
              ) : Text('${user.userId}',style: TextStyle(
                fontSize: 14,
                color: Colors.grey
              ),)
            ],
          ),
          Spacer(),
          Icon(
            Icons.more_vert,
            color: Colors.grey,
            size: 25,
          ),
        ],
      ),
    );
  }
}
