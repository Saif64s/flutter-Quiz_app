import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 30),
                    decoration: BoxDecoration(
                      color: e['correct_ans'] == e['user_ans']
                          ? Colors.white
                          : Colors.white38,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      ((e['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.aladin(
                        color: Colors.black,
                      ),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['questions'] as String,
                        style: GoogleFonts.laila(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Correct Answer: ${e['correct_ans'] as String}',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Your Answer: ${e['user_ans'] as String}',
                        style: GoogleFonts.roboto(
                            color: e['correct_ans'] == e['user_ans']
                                ? Colors.white70
                                : Colors.white38,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
