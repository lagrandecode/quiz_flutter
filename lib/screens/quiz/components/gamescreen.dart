import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/models/question_model.dart';

import '../../../models/questions.dart';
import '../../score/quizresult.dart';

class GameScreen extends StatefulWidget {
  GameScreen( {Key? key}) : super(key: key);


  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;

  // setting the timer for the quiz
  String _timer = "30";
  int setTimer = 30;
  Timer? timer;
  bool cancelTimer = false;
  ConfettiController? _confettiController;
  var questionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    _controller = PageController(initialPage: 0);
    _confettiController = ConfettiController(duration: Duration(seconds: 2));
    _confettiController!.play();
    genrandomarray();
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    timer = Timer.periodic(onesec, (Timer t) {
      if (mounted) {
        setState(() {
          if (setTimer == 0) {
            t.cancel();
            btnPressed = true;
            answered = true;
          } else if (cancelTimer == true) {
            t.cancel();
          } else {
            setTimer--;
          }
          _timer = setTimer.toString();
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (mounted) {
      timer!.cancel();
    }

    super.dispose();
  }

  // for willpopscope
  Future<bool?> showWarning(BuildContext context) async {
    return showDialog<bool?>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Exit Quiz"),
              content: Text("Are You Sure?"),
              actions: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.red),
                    )),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )),
              ],
            ));
  }

//generating random questions

  var random_array;

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10));
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: PageView.builder(
                controller: _controller!,
                onPageChanged: (page) {
                  if (page == questions.length - 1) {
                    setState(
                      () {
                        btnText = "See Results";
                      },
                    );
                  }
                  setState(() {
                    answered = false;
                    cancelTimer == true;
                  });
                },
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            setTimer == 0 ? "00:00" : "00:$_timer",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                color: setTimer < 11 ? Colors.red : null),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Question ${index + 1}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Divider(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 100.0,
                          child: Text(
                            "${questions[index].question}",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        for (int i = 0;
                            i < questions[index].answers!.length;
                            i++)
                          Container(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            width: double.infinity,
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(0)),
                              ),
                              fillColor: btnPressed
                                  ? questions[index].answers!.values.toList()[i]
                                      ? Colors.green
                                      : Colors.red
                                  : Theme.of(context).primaryColor,
                              onPressed: !answered
                                  ? () {
                                      if (questions[index]
                                          .answers!
                                          .values
                                          .toList()[i]) {
                                        score++;
                                        _confetti();
                                        print("yes");
                                      } else {
                                        print("no");
                                      }
                                      setState(
                                        () {
                                          btnPressed = true;
                                          answered = true;
                                          cancelTimer = true;
                                        },
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    questions[index].answers!.keys.toList()[i],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    )),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            if (_controller!.page?.toInt() ==
                                questions.length - 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          QuizResultScreen(score)));
                            } else {
                              _controller!.nextPage(
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeInExpo);
                              setState(() {
                                startTimer();
                                cancelTimer = false;
                                setTimer = 30;
                                btnPressed = false;
                              });
                            }
                          },
                          shape: StadiumBorder(),
                          fillColor: Theme.of(context).primaryColor,
                          padding: EdgeInsets.all(18.0),
                          elevation: 0.0,
                          child: Text(
                            btnText,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: questions.length,
              )),
        ),
      ),
    );
  }

  Widget _confetti() {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: _confettiController!,
        colors: [
          Colors.blue,
          Colors.red,
        ],
      ),
    );
  }
}
