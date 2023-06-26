import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/result_screen.dart';

import 'home_page.dart';
import 'questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;
  List<String> selectedAns = [];

  @override
  void initState() {
    currentScreen = HomePage(switchScreen);
    super.initState();
  }

  int correctAnsNo() {
    return selectedAns.length;
  }

  void choosenAns(String ans) {
    selectedAns.add(ans);

    if (selectedAns.length == questions.length) {
      setState(() {
        currentScreen = ResultScreen(
          choosenAns: selectedAns,
          shouldRestart: shoudlRestart,
        );
      });
    }
  }

  void switchScreen() {
    setState(() {
      currentScreen = Questions(selectedAns: choosenAns);
    });
  }

  void shoudlRestart() {
    setState(() {
      selectedAns = [];
      currentScreen = HomePage(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 187, 118, 27),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
