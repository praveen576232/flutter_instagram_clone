import 'package:flutter/material.dart';

Size size;

intilizeScreenSize(BuildContext context) {
  size = MediaQuery.of(context).size;
  print('called size');
  return size;
}
