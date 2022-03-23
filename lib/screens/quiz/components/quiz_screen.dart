import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizSection extends StatefulWidget {
  const QuizSection({Key? key}) : super(key: key);

  @override
  _QuizSectionState createState() => _QuizSectionState();
}


class _QuizSectionState extends State<QuizSection> {

  int timer = 30;
  String timerText = "30";
  Timer? _timer;

  void showTimer()async{
    final onsec = const Duration(seconds: 1);
    _timer = Timer.periodic(onsec, (Timer t) {
      setState(() {
        if(timer == 0){
          t.cancel();
        }
        else{
          timer --;
        }
        timerText = timer.toString();
      });
    });

  }
  @override
  void initState() {
    // TODO: implement initStat
    showTimer();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Score: 0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              const SizedBox(height: 10,),
              Text("00:$timerText", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),

            ],
          ),
        ),
      ),
    );
  }
}

