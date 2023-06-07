import 'package:flutter/material.dart';
import 'package:quizzler_flutter_project/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(child: QuizPage()),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizbrain = QuizBrain();

  clearScoreKeeper() {
    return scoreKeeper.clear();
  }

  void checkAnswer(bool userPickedOption) {
    bool correctAnswer = quizbrain.answerGetter();
    if (userPickedOption == correctAnswer) {
      setState(() {
        if (quizbrain.isFinished() == true) {
          Alert(
            context: context,
            type: AlertType.error,
            title: "Game Finished!",
            desc: "You ran out of questions!",
            buttons: [
              DialogButton(
                child: const Text(
                  "OKAY!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          quizbrain.reset();
          scoreKeeper = [];
        } else {
          quizbrain.nextQuestion();
        }
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
            size: 30,
          ),
        );
      });
    } else if (userPickedOption != correctAnswer) {
      setState(() {
        if (quizbrain.isFinished() == true) {
          Alert(
            context: context,
            type: AlertType.error,
            title: "Game Finished!",
            desc: "You ran out of questions!",
            buttons: [
              DialogButton(
                child: const Text(
                  "OKAY!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          quizbrain.reset();
          scoreKeeper = [];
        } else {
          quizbrain.nextQuestion();
        }
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
            size: 30,
          ),
        );
      });
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizbrain.questionGetter(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  "TRUE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  "FALSE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
