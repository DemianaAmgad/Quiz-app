import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final AppBrain appBrain = AppBrain();

// Color palette
const Color darkPrimaryColor = Color(0xFF616161);
const Color primaryColor = Color(0xFF9E9E9E);
const Color primaryText = Color(0xFF212121);
const Color secondaryText = Color(0xFFF5F5F5);
const Color dividerColor = Color(0xFFBDBDBD);
const Color accentColor = Color(0xFF9E9E9E);
const Color trueAnswerColor = Color(0xFF388E3C);
const Color falseAnswerColor = Color(0xFFD32F2F);

// Track the number of correct answers
int trueAnswer = 0;

void main() {
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: darkPrimaryColor,
          title: const Text('Quiz'),
        ),
        body: const QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> answerResults = [];
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    // Ensure questionNumber is within bounds
    if (questionNumber >= appBrain.getQuestionCount()) {
      // Delay the display of the final alert to avoid UI update issues
      Future.delayed(const Duration(milliseconds: 300), () {
        showFinalScoreAlert(context);
      });
      return Container();
    }

    // Get the current question and answer choices
    String? currentQuestionText = appBrain.getQuestionText(questionNumber);
    List<String?>? currentAnswerChoices =
        appBrain.getAnswerChoices(questionNumber);

    return Column(
      children: [
        Wrap(
          children: answerResults,
        ),
        result(),
        question(currentQuestionText),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: currentAnswerChoices != null
                ? currentAnswerChoices.map((choice) {
                    return choice != null ? answerButton(choice) : Container();
                  }).toList()
                : [],
          ),
        ),
      ],
    );
  }

  ElevatedButton answerButton(String answer) {
    return ElevatedButton(
      onPressed: () {
        bool isCorrect =
            (answer == appBrain.getQuestion(questionNumber).questionAnswer);

        setState(() {
          if (isCorrect) {
            trueAnswer++;
            answerResults.add(const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.check_circle,
                  color: trueAnswerColor,
                )));
          } else {
            answerResults.add(const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.cancel,
                  color: falseAnswerColor,
                )));
          }
          questionNumber++;

          // Check if this was the last question
          if (questionNumber >= appBrain.getQuestionCount()) {
            Future.delayed(const Duration(milliseconds: 300), () {
              showFinalScoreAlert(context);
            });
          }
        });
      },
      child: Text(
        answer,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }

  Text result() {
    return Text(
      'Right answers: $trueAnswer ',
      style: const TextStyle(fontSize: 30.0, color: primaryText),
    );
  }

  Widget question(String? questionData) {
    String textToDisplay = questionData ?? 'Default question text';
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              textToDisplay,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showFinalScoreAlert(BuildContext context) {
    Alert(
      context: context,
      title: "Quiz Finished",
      desc:
          'Your score is $trueAnswer out of ${appBrain.getQuestionCount()}',
      buttons: [
        DialogButton(
          child: const Text(
            "Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              trueAnswer = 0;
              answerResults.clear();
              questionNumber = 0;
            });
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }
}
