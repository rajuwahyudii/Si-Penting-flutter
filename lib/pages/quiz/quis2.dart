import 'package:flutter/material.dart';
import 'package:stunting/models/pretest.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/finished.dart';
import 'package:stunting/widgets/quiz2.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;
  int _totalScroe = 0;
  bool isFinish = false;
  _questionsAnswer(int score) {
    _totalScroe += score;

    setState(() {
      _index++;
    });
    if (_index < pretestGanda.length) {
      isFinish = false;
    } else {
      isFinish = true;
    }
  }

  void _resetQuiz() {
    setState(() {
      isFinish = false;
      _index = 0;
      _totalScroe = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 46, 143, 228),
        body: isFinish == false
            ? Quiz(
                index: _index,
                questionsAnswer: _questionsAnswer,
                questions: pretestGanda,
              )
            : FinishScreen(
                onPressed: () {
                  _resetQuiz();
                },
                totalScore: _totalScroe,
              ),
      ),
    );
  }
}
