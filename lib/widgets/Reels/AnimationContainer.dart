import 'package:flutter/material.dart';
import 'package:instagram/Functions/screenSize.dart';

class AnimationSmallContainer extends StatefulWidget {
  @override
  _AnimationSmallContainerState createState() =>
      _AnimationSmallContainerState();
}

class _AnimationSmallContainerState extends State<AnimationSmallContainer>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  AnimationController _animationController2;
  Animation _animation2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 0.3, end: 1).animate(_animationController);
    _animation.addListener(() {
      setState(() {});
    });
    _animationController.repeat(reverse: true);

    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation2 =
        Tween<double>(begin: 1, end: 0.3).animate(_animationController2);
    _animation2.addListener(() {
      setState(() {});
    });
    _animationController2.repeat(reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  Widget myContainer(double height) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: 2,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
        children: [
          myContainer(_animation.value * 10),
          myContainer(_animation2.value * 10),
          myContainer(_animation.value * 10),
        ],
      ),
    );
  }
}
