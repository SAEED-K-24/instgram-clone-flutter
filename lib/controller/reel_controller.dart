import 'package:flutter/cupertino.dart';
import 'package:flutter_application_task/model/reel.dart';

class ReelController extends ChangeNotifier {
  final reels = [
    Reel('assets/videos/hw1-v.mp4', 'this is the first reel', 223),
    Reel('assets/videos/r1.mp4', 'this is the second reel', 6666),
    Reel('assets/videos/r2.mp4', 'this is the third reel', 12),
    Reel('assets/videos/r3.mp4', 'this is the fourth reel', 345),
  ];

  updateSingleReel(Reel reel) {
    int index = reels.indexOf(reel);
    reels[index] = reel;
    notifyListeners();
  }

  void changeIsFavourite(Reel reel) {
    reel.isFavourite = !reel.isFavourite;
    updateSingleReel(reel);
  }
}
