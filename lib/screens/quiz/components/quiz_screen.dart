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
        onWillPop: ()async{
          return false;
        },
    child: Scaffold(
    body: Column(
    children: [
    Text("Score: 0", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
    ],
    ),
    ),
    );
  }
}
