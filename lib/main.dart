import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:instagram/Functions/screenSize.dart';
import 'package:instagram/ScreenNavigation.dart';
import 'package:instagram/graphql/graphql.dart';
ValueNotifier<GraphQLClient> client ;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
client = graphQlInit();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GraphQLProvider(
        client: client,
        child: ScreenNavigation()),
    );
  }
}
