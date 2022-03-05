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
        color: Colors.grey.withOpacity(0.2),
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
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0)),
                color: Colors.yellow
              ),
              child: Text("options",style: TextStyle(fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }
}
