import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  List<Widget> widgets;
  BottomNavigation({@required this.widgets});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 2, color: Colors.black.withOpacity(0.2)))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: widgets),
    );
  }
}
