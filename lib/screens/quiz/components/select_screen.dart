
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'gamescreen.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}
class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180.0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 30, left: 15, right: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light? Colors.grey.withOpacity(0.3): Color(0x222222FF),
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.zero),
              ),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>GameScreen()));
                },
                child: Lottie.network("https://assets6.lottiefiles.com/packages/lf20_z35UZP.json",errorBuilder: (_, url, error)=>  Image.asset("assets/loading.png"),),),
              //alternative for the lottie
              // child: Lottie.asset("assets/quiz.json",),
            ),
          ],
        ),
      ),
    );
  }
}

