import 'package:catinboxanimaltion/src/screens/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "cat animation",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}
