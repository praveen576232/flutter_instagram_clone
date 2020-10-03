import 'package:flutter/material.dart';
import 'package:instagram/widgets/Reels/Video.dart';

class Reels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
        return Container(
          
          child: Video(),
        );
      }),
    );
  }
}
