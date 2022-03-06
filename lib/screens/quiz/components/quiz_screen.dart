import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop(),
    child: Scaffold(
    body: Column(
    children: [
    Text("Score: 0", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
    ],
    ),
    ),
    );
  }

  _onWillPop() async {

      final shouldPop = await showDialog(context: context, builder: (__) =>
          AlertDialog(
            title: Text("Alausasabi",),
            content: Text("Are you sure You want to Exit?",),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop(context, false);
              }, child: Text("cancel"),),
              TextButton(onPressed: () {
                Navigator.of(context).pop(context, true);
              }, child: Text("Yes"),),
            ],
          ),);

      return shouldPop ?? false;


  }

}
