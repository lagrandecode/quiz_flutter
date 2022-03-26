import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'mainresult.dart';




class QuizResultScreen extends StatefulWidget {

  QuizResultScreen(this.fail, this.score, {Key? key}) : super(key: key);
  int? score;
  int? fail;

  @override
  _QuizResultScreenState createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> with TickerProviderStateMixin {
  bool _showingSplash = true;
  late AnimationController _lineController;
  late AnimationController _lottieController;

  @override
  void initState() {
    _lineController = AnimationController(
      vsync: this,
    )..addListener(() {
      setState(() {});
    });
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1090),
    )..addListener(() {
      if (_lottieController.isCompleted) {
        setState(() {
          _showingSplash = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _lineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_showingSplash) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                height: 300,
                child: Lottie.asset(
                  "assets/animations/1.json",
                  controller: _lineController,
                  onLoaded: (composite) {
                    _lottieController
                      ..duration = composite.duration
                      ..forward();
                    _lineController
                      ..duration =
                          composite.duration - const Duration(milliseconds: 100)
                      ..forward();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                width: 150,
                child: LinearProgressIndicator(
                  color: Color(0xffFF00CB),
                  backgroundColor: Colors.pink[200],
                  value: _lineController.value,
                  minHeight: 8,
                  // semanticsLabel: 'Linear progress indicator',
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 100,
            ),
          ],
        ),
      );
    }
    return MainResultScreen(widget.fail, widget.score,);
  }
}
