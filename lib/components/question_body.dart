import 'package:flutter/material.dart';
import 'package:quiz_flutter/models/questions.dart';

class QuestionBody extends StatefulWidget {
  const QuestionBody({Key? key}) : super(key: key);

  @override
  _QuestionBodyState createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffaab8f5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sample_data[0]['question'],
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
