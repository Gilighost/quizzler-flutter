import 'question.dart';

class Quiz {
  int _questionNumber = 0;
  bool isCompleted = false;
  int _numberCorrect = 0;

  List<Question> _questionBank = [
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

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      ++_questionNumber;
    } else {
      isCompleted = true;
    }
  }

  bool checkAnswer(bool userAnswer) {
    if (userAnswer == _questionBank[_questionNumber].questionAnswer) {
      ++_numberCorrect;
      return true;
    }

    return false;
  }

  String getQuestionText() => _questionBank[_questionNumber].questionText;

  double getScore() => _numberCorrect / _questionBank.length * 100;

  // bool getQuestionAnswer() => _questionBank[_questionNumber].questionAnswer;
}
