import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_task/controller/reel_controller.dart';
import 'package:flutter_application_task/model/reel.dart';
import 'package:flutter_application_task/model/user.dart';
import 'package:flutter_application_task/view/screen/options_screen.dart';
import 'package:flutter_application_task/view/widgets/like_icon.dart';
import 'package:flutter_application_task/view/widgets/user_item.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../constant.dart';

class ReelItem extends StatefulWidget {
  Reel reel;
  ReelItem({Key? key, required this.reel, })
      : super(key: key);

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.asset(widget.reel.video);
    await Future.wait([_videoPlayerController!.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onDoubleTap: () {
                  Provider.of<ReelController>(context, listen: false)
                          .changeIsFavourite(widget.reel);
                  setState(() {
                    _liked = !_liked;
                  });
                },
                child: Chewie(
                  controller: _chewieController!,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
        OptionsScreen(reel: widget.reel,)
      ],
    );
  }
}
