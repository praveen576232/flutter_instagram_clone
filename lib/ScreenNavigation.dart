import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:instagram/screen/HomePage.dart';
import 'package:instagram/screen/Reels.dart';
import 'package:instagram/widgets/BottomNavigation.dart';

import 'Functions/screenSize.dart';

class ScreenNavigation extends StatefulWidget {
  @override
  _ScreenNavigationState createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {
  int index = 0;
  List<Widget> screen = [HomePage(), Reels(), HomePage(), Reels()];
  bool intilize = false;
  @override
  Widget build(BuildContext context) {
    if (!intilize) {
      intilizeScreenSize(context);
      intilize = true;
    }
    return Scaffold(
          body: Query(
        options: QueryOptions(documentNode: gql("""
      query{
defaultpoast(user_id:"test1",onlyvideo:["video"]){
  _id,
  poasts{
      _id,
      
poasturl
  }
}
}
       """)),

        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.loading) {
            return Center(
              child: Text("loading..."),
            );
          } else {
            
            return Center(
              child: Text(result.data.toString()),
            );
          }
        },

        // Scaffold(
        // body: screen[index],
        // bottomNavigationBar: BottomNavigation(
        //   widgets: [
        //     IconButton(
        //         icon: Icon(Icons.home),
        //         onPressed: () {
        //           setState(() {
        //             index = 0;
        //           });
        //         }),
        //     IconButton(
        //         icon: Icon(Icons.video_library),
        //         onPressed: () {
        //           setState(() {
        //             index = 1;
        //           });
        //         }),
        //     IconButton(
        //         icon: Icon(Icons.add_a_photo),
        //         onPressed: () {
        //           setState(() {
        //             index = 2;
        //           });
        //         }),
        //     IconButton(
        //         icon: Icon(Icons.favorite_border),
        //         onPressed: () {
        //           setState(() {
        //             index = 3;
        //           });
        //         }),
        //     CircleAvatar(
        //       backgroundColor: Colors.grey,
        //       maxRadius: 12.0,
        //     )
        //   ],
        // )),
      ),
    );
  }
}
