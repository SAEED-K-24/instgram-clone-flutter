import 'package:flutter/material.dart';
import 'package:flutter_application_task/model/comment.dart';

class CommentItem extends StatefulWidget {
  Comment comment;
  CommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            //margin: EdgeInsetsDirectional.only(top: 8, end: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(widget.comment.image), fit: BoxFit.fill),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            widget.comment.comment,
            style: const TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            icon: widget.comment.isFavourite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border),
            onPressed: () {
              widget.comment.changeIsFavourite();
              setState(() {
                
              });
            },
          ),
        ],
      ),
    );
  }
}
