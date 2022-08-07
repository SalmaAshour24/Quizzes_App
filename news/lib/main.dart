import 'package:flutter/material.dart';
import 'package:task4/screenview/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: homescreen(),
    );
  }
}
