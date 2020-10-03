import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram/Functions/screenSize.dart';
import 'package:instagram/Functions/textformater.dart';
import 'package:instagram/icons/instag_iconsdart_icons.dart';
import 'package:instagram/widgets/Reels/AnimationContainer.dart';
import 'package:marquee/marquee.dart';

class VideoFooter extends StatefulWidget {
  String description;
  String pageName;
  String pageUrl;
  String songName;
  int totleLike;
  int totleCommente;
  @override
  _VideoFooterState createState() => _VideoFooterState();
}

class _VideoFooterState extends State<VideoFooter>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  String description =
      'descriptions bwshkdbc scbkwhfbcv wsfbrkucvwr cfkuwrbhcew vkrwegv bjbkdb bnujbv nujvdfv dfl nf  nfdv dfnvidf fdlvn dfl';
  bool longtext = true;
  bool removeMore = false;
  TapGestureRecognizer _onLessDescriptionRecongizer;
  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _onLessDescriptionRecongizer = TapGestureRecognizer()..onTap = _handelLess;
    super.initState();
  }

  _handelLess() {
    _animationController.reverse().whenComplete(() {
      setState(() {
        removeMore = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: Colors.grey[100],
                    ),
                    Text(
                      '  praveend',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text('  Follow',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.6,
                        child: InkWell(
                          child: Text.rich(TextSpan(
                              text: longtext
                                  ? textformater(description, 26)
                                  : description,
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text:
                                      longtext && !removeMore ? '.. more' : '',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ])),
                          onTap: () {
                            setState(() {
                              removeMore = true;
                            });
                            if (longtext) _animationController.forward();
                          },
                        ),
                      ),
                      longtext
                          ? Container(
                              width: size.width * 0.6,
                              child: SizeTransition(
                                sizeFactor: _animation,
                                child: Text.rich(TextSpan(
                                    text: description.substring(
                                        26, description.length),
                                    style: TextStyle(color: Colors.white),
                                    children: [
                                      TextSpan(
                                          text: longtext ? ' less' : '',
                                          style: TextStyle(color: Colors.grey),
                                          recognizer:
                                              _onLessDescriptionRecongizer)
                                    ])),
                              ),
                            )
                          : Offstage(),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Container(
                    width: size.width * 0.5,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: AnimationSmallContainer(),
                        ),
                        Container(
                          height: 17,
                          width: size.width * 0.5 - 40,
                          child: Marquee(
                            text: 'praveend',
                            blankSpace: 30.0,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            ),
                            onPressed: null),
                        IconButton(
                            icon: Icon(InstagIconsdart.comment,
                                color: Colors.grey),
                            onPressed: null),
                        IconButton(
                            icon: Icon(InstagIconsdart.img_516624,
                                color: Colors.grey),
                            onPressed: null),
                        IconButton(
                            icon: Icon(Icons.more_vert, color: Colors.grey),
                            onPressed: null),
                      ],
                    ),
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.favorite,
                                  size: 12, color: Colors.grey),
                              Text('2852',
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 10.0),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.favorite,
                                  size: 12, color: Colors.grey),
                              Text('2852',
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      )
                    ]),
                  ))
                ],
              )
            ],
          )),
    );
  }
}
