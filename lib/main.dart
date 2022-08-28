import 'package:flutter/material.dart';
import 'package:mynewapplication/loadingdemo.dart';
import 'package:mynewapplication/pages/homeScreen.dart';
import 'package:mynewapplication/pages/loadingScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) =>  loadingScreen(),
        "/homeScreen" : (context) => homeScreen() ,
        "/loadingScreen" : (context) => loadingScreen() ,
      }
    );
  }
}

