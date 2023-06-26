import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/question_summary.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAns, required this.shouldRestart});

  final void Function() shouldRestart;

  final List<String> choosenAns;

  List<Map<String, Object>> getSummaryDetails() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].questions,
        'correct_ans': questions[i].answers[0],
        'user_ans': choosenAns[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var quesLen = questions.length;
    final summaryDetails = getSummaryDetails();
    final correctAns = summaryDetails.where((data) {
      return data['correct_ans'] == data['user_ans'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAns out of $quesLen questions correctly',
              style: GoogleFonts.laila(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white60),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryDetails),
            OutlinedButton.icon(
              onPressed: shouldRestart,
              label: const Text(
                'Restart quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              icon: const Icon(Icons.restart_alt_rounded, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
