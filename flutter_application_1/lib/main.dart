import 'package:flutter/material.dart';
import 'package:flutter_application_1/homapage.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:flutter_application_1/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/signup': (context) => signUp(),
        '/signin': (context) => signIn(),
      },
      debugShowCheckedModeBanner: false,
      title: 'home page',
      home: const homePage(),
    );
  }
}
