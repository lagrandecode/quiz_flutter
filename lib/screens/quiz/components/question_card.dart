import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/question_controller.dart';
import '../../../models/questions.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard(this.question);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question!

          ),
          SizedBox(height: 10),
          ...List.generate(
            question.options!.length,
                (index) => Option(index: index, text: question.options[index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
