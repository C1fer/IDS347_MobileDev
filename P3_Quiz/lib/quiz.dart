import 'package:flutter/material.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _idx = 0;
  int correctAnswers = 0;

  List<Widget> iconList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    Question.questions[_idx].question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            answerButton(Colors.green, 'True'),
            answerButton(Colors.red, 'False'),
            Row(children: iconList),
          ],
        )));
  }

  Widget answerButton(bgColor, label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(bgColor),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            setState(() {
              if (Question.questions[_idx].answer == true) {
                iconList.add(Icon(Icons.check, color: Colors.green));
                correctAnswers++;
              } else {
                iconList.add(Icon(Icons.close, color: Colors.red));
              }
              if (_idx < Question.questions.length - 1) {
                _idx++;
              } else {
                Alert(
                  context: context,
                  style: AlertStyle(
                    isCloseButton: false,
                  ),
                  title: 'Quiz finished',
                  desc: 'Score: $correctAnswers/${Question.questions.length}',
                ).show();
                // Reset game variables
                iconList.clear();
                _idx = 0;
                correctAnswers = 0;
                Question.questions.shuffle(); // Shuffle questions list
              }
            });
          },
        ),
      ),
    );
  }
}
