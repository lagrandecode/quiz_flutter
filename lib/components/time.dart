import 'package:flutter/material.dart';


class TimeScore extends StatefulWidget {
  const TimeScore({Key? key}) : super(key: key);

  @override
  _TimeScoreState createState() => _TimeScoreState();
}

class _TimeScoreState extends State<TimeScore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 50),
        Text("score: 0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text("00:00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        SizedBox(height: 30,),
      ],
    );
  }
}
