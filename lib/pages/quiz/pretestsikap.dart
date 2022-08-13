import 'package:flutter/material.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/models/pretest_sikap.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/widgets/finished.dart';
import 'package:stunting/widgets/quiz2.dart';

class PretestSikap extends StatefulWidget {
  const PretestSikap({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PretestSikapState createState() => _PretestSikapState();
}

class _PretestSikapState extends State<PretestSikap> {
  int _index = 0;
  int _totalScroe = 0;
  bool isFinish = false;
  _questionsAnswer(int score) {
    _totalScroe += score;

    setState(() {
      _index++;
    });
    if (_index < pretestSikap.length) {
      isFinish = false;
    } else {
      isFinish = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 46, 143, 228),
        body: isFinish == false
            ? Quiz(
                index: _index,
                questionsAnswer: _questionsAnswer,
                questions: pretestSikap,
              )
            : FinishScreen(
                onPressed: () async {
                  await AuthServices.nextMateri(4);
                  await AuthServices.HasilPretestSikap(_totalScroe);
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
