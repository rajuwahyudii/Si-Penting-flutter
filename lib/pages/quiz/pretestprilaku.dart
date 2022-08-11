import 'package:flutter/material.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/models/pretest_ganda.dart';
import 'package:stunting/models/pretest_prilaku.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/widgets/finished.dart';
import 'package:stunting/widgets/quiz2.dart';

class PretestPrilaku extends StatefulWidget {
  const PretestPrilaku({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PretestPrilakuState createState() => _PretestPrilakuState();
}

class _PretestPrilakuState extends State<PretestPrilaku> {
  int _index = 0;
  int _totalScroe = 0;
  bool isFinish = false;
  _questionsAnswer(int score) {
    _totalScroe += score;

    setState(() {
      _index++;
    });
    if (_index < pretestPrilaku.length) {
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
                questions: pretestPrilaku,
              )
            : FinishScreen(
                onPressed: () async {
                  await AuthServices.nextMateri(5);
                  // ignore: use_build_context_synchronously
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Menu(),
                    ),
                  );
                },
                totalScore: _totalScroe,
              ),
      ),
    );
  }
}
