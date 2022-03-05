import 'package:flutter/material.dart';


class QuestionBody extends StatefulWidget {
  const QuestionBody({Key? key}) : super(key: key);

  @override
  _QuestionBodyState createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.zero,bottomRight: Radius.circular(10),),

          ),
        ),
      ],
    );
  }
}
