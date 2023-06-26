class QuizQuestion {
  const QuizQuestion(this.questions, this.answers);

  final String questions;
  final List<String> answers;

  List<String> getShuffledAns() {
    final shuffledAns = List.of(answers);
    shuffledAns.shuffle();
    return shuffledAns;
  }
}
