import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
    required this.questions,
  });

  final void Function(String answer) onSelectAnswer;
  final List<QuizQuestion> questions;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      widget.onSelectAnswer(answer);
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = widget.questions[questionIndex];
    return Center(
      child: Column(
        children: [
          Text(
            'Question ${questionIndex + 1}',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            currentQuestion.text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          for (String ans in currentQuestion.getShuffledAnswers())
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  answerQuestion(ans);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.yellow,
                ),
                child: Text(ans),
              ),
            ),
        ],
      ),
    );
  }
}
