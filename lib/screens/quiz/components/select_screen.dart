import 'package:flutter/material.dart';
import 'package:quiz_flutter/screens/quiz/components/quiz_screen.dart';


class SelectScreen extends StatelessWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(10),),
              ),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>QuizScreen())),
                  child: const Text("Play Game", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}
