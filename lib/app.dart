import 'package:flutter/material.dart';
import 'home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}