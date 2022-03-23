// ignore_for_file: file_names


import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class MainResultScreen extends StatefulWidget {
  int? score;

  MainResultScreen(this.score, {Key? key}) : super(key: key);


  @override
  _MainResultScreenState createState() => _MainResultScreenState();
}

class _MainResultScreenState extends State<MainResultScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  bool _skyShot = false;
  double _bottom = -150;
  int averageScore = 50;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller!.addListener(() {
      if (_controller!.isCompleted) {
        setState(() {
          _skyShot = true;
          _bottom = MediaQuery.of(context).size.height * 10 / 100;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          if (!_skyShot)
            Lottie.asset(
              "assets/animations/2.json",
              fit: BoxFit.fitHeight,
              controller: _controller,
              repeat: false,
              onLoaded: (composition) {
                _controller!
                  ..duration =
                      composition.duration - const Duration(milliseconds: 1000)
                  ..forward();
              },
            ),
          if (_skyShot) Lottie.asset("assets/animations/3.json"),

          //   if (_skyShot) Lottie.asset("assets/animations/3.json"),
          // Image.asset(
          //   "assets/images/7k.png",
          //   height: 800,
          // ),

          ZoomIn(
            duration: const Duration(milliseconds: 2000),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Congratulations",
                    style: TextStyle(
                      color: Color(0xFFFF8C09),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "You Score",
                    style: TextStyle(
                      color: Color(0xFFFF8C09),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text( "${widget.score} Points",
                    style: TextStyle(
                      color: averageScore < 50 ? Colors.green : Colors.red,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_skyShot)
            Positioned(
              left: -width * 33 / 100,
              width: width,
              bottom: height * 13 / 100,
              child: FadeInLeft(
                child: SizedBox(
                  height: 300,
                  child: Lottie.asset(
                    "assets/animations/4.json",
                  ),
                ),
              ),
            ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            bottom: _bottom,
            width: width,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>QuizSection()));
                      // Navigator.pushReplacement((context), MaterialPageRoute(builder: (_)=>QuizSection()));
                      // Navigator.of(context).pop();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Container(
                      height: 40,
                      width: 140,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(10)),
                      ),
                      child: Text(
                        "Repeat the quiz",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Lottie.asset("assets/animations/4.json"),
          // Center(child: Lottie.asset("assets/animations/1.json")),
        ],
      ),
    );
  }
}
