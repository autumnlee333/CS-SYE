import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart'; 
import 'package:quiz_app/model/quiz_question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

enum Screen { start, question, results }

class ScreenController extends StatefulWidget {
  const ScreenController({super.key});

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  Screen currScreen = Screen.start;
  List<String> selectedAnswers = [];
  late List<QuizQuestion> activeQuestions;

  @override
  void initState() {
    super.initState();
    activeQuestions = List.of(questions);
    activeQuestions.shuffle();
  }

  void switchScreen() {
    setState(() {
      currScreen = Screen.question;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == activeQuestions.length) {
      setState(
        () {
          currScreen = Screen.results;
        },
      );
    }
  }

  void restartQuiz() {
    setState(
      () {
        selectedAnswers = [];
        currScreen = Screen.start;
        activeQuestions.shuffle();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(switchScreen);

    if (currScreen == Screen.question) {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
        questions: activeQuestions,
      );
    }

    if (currScreen == Screen.results) {
      activeScreen = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return activeScreen;
  }
}
