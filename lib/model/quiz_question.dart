class QuizQuestion {
  const QuizQuestion(this.text, this.answers); 

  final String text; 
  final List<String> answers; 

  // shuffle questions
  List<String> getShuffledAnswers(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList; 
  }
}