import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

enum answerValidity {
  correct,
  incorrect,
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int questionIndex = 0;

  List<Question> questions = [
    Question(
      question: 'The capital of Libya is Benghazi.',
      answer: false,
    ),
    Question(
      question: 'Albert Einstein was awarded the Nobel Prize in Physics.',
      answer: true,
    ),
    Question(
      question: 'The first name of Kramer in Seinfeld is Cosmo',
      answer: true,
    ),
    Question(
      question: 'Gone with the Wind takes place in Savannah, Georgia',
      answer: false,
    ),
  ];

  void answerQuestion({int questionNumber, bool userAnswer}) {
    addToScoreKeeper(userAnswer == questions[questionNumber].questionAnswer
        ? answerValidity.correct
        : answerValidity.incorrect);
  }

  void addToScoreKeeper(answerValidity answer) {
    setState(() {
      scoreKeeper.add(answer == answerValidity.correct
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red));
      ++questionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionIndex].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                answerQuestion(
                  questionNumber: questionIndex,
                  userAnswer: true,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                answerQuestion(
                  questionNumber: questionIndex,
                  userAnswer: false,
                );
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
