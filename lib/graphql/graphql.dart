import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

 graphQlInit() {
  HttpLink httpLink = new HttpLink(uri: 'http://10.0.2.2:3030/graphql');
  final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
          link: httpLink as Link,
          cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject)));
  return client;
}
