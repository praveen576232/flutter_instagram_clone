import 'package:flutter/material.dart';
import 'package:instagram/icons/instag_iconsdart_icons.dart';
import 'package:instagram/widgets/Poast.dart';
import 'package:instagram/widgets/Stores.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  bool showStrory = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
   
      if (_scrollController.offset > 100) {
        if (showStrory) {
          setState(() {
            showStrory = false;
          });
        }
      } else {
        if (!showStrory) {
          setState(() {
            showStrory = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(InstagIconsdart.camera,color: Colors.black,), onPressed: (){}),
         
        ),
        body: Container(
          child: ListView.builder(
              controller: _scrollController,
              itemCount: 10,
              itemBuilder: (context, index) {
                return index == 0
                    ? Column(
                        children: [
                          Stores(),
                          Poast(
                            pageurl: '',
                            description: 'ths is description odf the video ',
                            pageName: '  praveend',
                            time: '',
                            totleLike: '16511 likes',
                          )
                        ],
                      )
                    : Poast(
                        pageurl: '',
                        description: '',
                        pageName: '  pravee',
                        time: '',
                        totleLike: '',
                      );
              }),
        ),
      );
  }
}
