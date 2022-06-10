import 'package:flutter/material.dart';
import 'package:flutter_application_task/constant.dart';
import 'package:flutter_application_task/controller/reel_controller.dart';
import 'package:flutter_application_task/model/reel.dart';
import 'package:provider/provider.dart';

class OptionsScreen extends StatelessWidget {
  Reel reel;
  OptionsScreen({required this.reel});

//   @override
//   State<OptionsScreen> createState() => _OptionsScreenState();
// }

// class _OptionsScreenState extends State<OptionsScreen> {
//   late Icon _favourite;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _favourite = widget.reel.isFavourite
//         ? Icon(
//             Icons.favorite,
//             color: Colors.red,
//           )
//         : Icon(
//             Icons.favorite_outline,
//             color: Colors.grey,
//           );
//   }

  @override
  Widget build(BuildContext context) {
    // final he = MediaQuery.of(context).size.height;
    // final wi = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
            ),
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  InkWell(
                    child: reel.isFavourite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.grey,
                          ),
                    onTap: () {
                      Provider.of<ReelController>(context, listen: false)
                          .changeIsFavourite(reel);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${reel.likes}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Icon(
                    Icons.comment_rounded,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${reel.comments.length}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: Icon(
                      Icons.send,
                      color: Colors.grey,
                    ),
                  ),
                  //SizedBox(height: MediaQuery.of(context).size.height*1/5,),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person, size: 18),
                      radius: 16,
                    ),
                    SizedBox(width: 6),
                    Text('flutter_developer02'),
                    SizedBox(width: 10),
                    Icon(Icons.verified, size: 15),
                    SizedBox(width: 10),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade300)),
                      onPressed: () {},
                      child: Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(width: 6),
                Text('${reel.title}'),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.music_note,
                      size: 15,
                    ),
                    Text('Original Audio - some music track--'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
