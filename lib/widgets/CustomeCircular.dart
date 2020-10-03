import 'package:flutter/material.dart';

class CustomeAvatar extends StatelessWidget {
  double height;
  CustomeAvatar({@required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [Colors.red, Colors.orange, Colors.orangeAccent])),
        ),
        Container(
          height: height-4,
          width:  height-4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2.0),
              image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/originals/14/09/ab/1409ab178fb9a2fb65c602aeae0741da.jpg',
                  ),
                  fit: BoxFit.fill)),
        ),
      ],
    ));
  }
}
