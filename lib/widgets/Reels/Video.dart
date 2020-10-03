import 'package:flutter/material.dart';
import 'package:instagram/Functions/screenSize.dart';
import 'package:instagram/widgets/Reels/VideoAppBar.dart';
import 'package:instagram/widgets/Reels/VideoFooter.dart';
import 'package:instagram/widgets/Reels/VideoPlayer.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      color: Colors.black,
      child: SafeArea(
        child: Stack(
          children: [
            MyVideoPlayer(
              videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
            ),
            Positioned(top: 0, child: VideoAppBar()),
            Positioned(bottom: 20, child: VideoFooter()),
          ],
        ),
      ),
    );
  }
}
