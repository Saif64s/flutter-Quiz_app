import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({
    super.key,
    required this.selectedAns,
  });

  final void Function(String ans) selectedAns;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int currentIndex = 0;

  void answeredQues(String ans) {
    widget.selectedAns(ans);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQues = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQues.questions,
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQues.getShuffledAns().map(
                  (e) => AnswerButton(
                      answerText: e,
                      onTap: () {
                        answeredQues(e);
                      }),
                ),
          ],
        ),
      ),
    );
  }
}
