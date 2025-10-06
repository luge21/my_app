class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.correctAnswer);
  
  final String text;
  final List<String> answers;
  final String correctAnswer;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
