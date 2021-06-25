import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();

  void addIconToList(bool isCorrect) => setState(() {
        if (quizBrain.canGotoNext()) {
          isCorrect = (isCorrect == quizBrain.getQuestion().answer);
          scoreKeeper.add(findIconForAnswer(isCorrect));
          quizBrain.nextQuestion();
        } else {
          Alert(
            context: context,
            title: "Warning",
            desc: "Answered all questions",
          ).show();
        }
      });

  Icon findIconForAnswer(bool isCorrect) {
    if (isCorrect) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion().question,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.all(10),
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                addIconToList(
                  true,
                );
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                addIconToList(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
