import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  String videoUrl;
  MyVideoPlayer({@required this.videoUrl});
  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      widget.videoUrl,
    );
    _videoPlayerController.addListener(() {
      setState(() {});
    });

    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize()
    .then((value) => _videoPlayerController.play());
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  showMuteOrUnmuteIcon(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            _videoPlayerController.value.volume != 0
                ? Icons.access_alarms
                : Icons.volume_mute,
            color: Colors.white,
            size: 40,
          ),
        ),
      );
    });
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 1));
    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            child: VideoPlayer(_videoPlayerController),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: _animation.value,
              child: Icon(Icons.favorite, color: Colors.white, size: 100),
            ),
          )
        ],
      ),
      onTap: () {
        if (_videoPlayerController.value.initialized) {
          if (_videoPlayerController.value.volume == 0.0) {
            _videoPlayerController.setVolume(1.0);
          } else {
            _videoPlayerController.setVolume(0.0);
          }
          showMuteOrUnmuteIcon(context);
        }
      },
      onDoubleTap: () {
        _animationController.forward().whenComplete(() async {
          await Future.delayed(Duration(milliseconds: 500));
          _animationController.reverse();
        });
      },
    );
  }
}
