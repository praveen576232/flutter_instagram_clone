import 'package:flutter/material.dart';
import 'package:instagram/widgets/CustomeCircular.dart';

class Poast extends StatelessWidget {
  String pageName;
  String pageurl;
  String totleLike;
  String description;
  String time;
  Poast({@required this.pageName,
  @required this.pageurl,
  @required this.totleLike,
  @required this.description,
  @required this.time,
 });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [CustomeAvatar(height: 35), Text(pageName)],
                  ),
                ),
                IconButton(icon: Icon(Icons.more_vert), onPressed: null)
              ],
            ),
          ),
          Container(
            height: 300,
            color: Colors.green,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: null),
                  IconButton(icon: Icon(Icons.comment), onPressed: null),
                  IconButton(icon: Icon(Icons.share), onPressed: null)
                ],
              )),
              IconButton(icon: Icon(Icons.save), onPressed: null)
            ],
          ),
          Text(totleLike),
          Text(description),
          Text(' 3 comments'),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: CircleAvatar(
                  maxRadius: 12,
                  backgroundColor: Colors.grey,
                ),
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText: 'Add a comment...', border: InputBorder.none),
              )),
              IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 15,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 15,
                  ),
                  onPressed: null)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Text(
              '3 days ago',
              style: TextStyle(fontSize: 10.0, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
