import 'package:flutter/material.dart';
import 'package:instagram/widgets/CustomeCircular.dart';

class Stores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CustomeAvatar(height: 65)
            );
          }),
    );
  }
}
