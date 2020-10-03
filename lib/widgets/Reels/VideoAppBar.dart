import 'package:flutter/material.dart';
import 'package:instagram/Functions/screenSize.dart';

class VideoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Reels',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          IconButton(
              icon: Icon(
                Icons.camera,
                color: Colors.white,
                size: 25,
              ),
              onPressed: null),
        ],
      ),
    );
  }
}
