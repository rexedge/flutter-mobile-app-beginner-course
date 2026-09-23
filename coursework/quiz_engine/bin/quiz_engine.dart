import 'dart:io';

class Question {
  final String text;
  final String correctAnswer;

  Question(this.text, this.correctAnswer);

  bool checkAnswer(String userAnswer) {
    return userAnswer.trim().toLowerCase() ==
        correctAnswer.trim().toLowerCase();
  }
}

mixin Hintable {
  String get hint;

  void showHint() {
    print('Hint: $hint');
  }
}

class MultipleChoiceQuestion extends Question with Hintable {
  final List<String> options;

  MultipleChoiceQuestion(String text, String correctAnswer, this.options)
    : super(text, correctAnswer);

  @override
  String get hint => 'It starts with "${correctAnswer[0]}"';

  void display() {
    print(text);
    for (int i = 0; i < options.length; i++) {
      print('  ${i + 1}. ${options[i]}');
    }
  }
}

class TrueFalseQuestion extends Question {
  TrueFalseQuestion(String text, String correctAnswer)
    : super(text, correctAnswer);

  void display() {
    print('$text (true/false)');
  }
}

void main() {
  List<Question> questions = [
    MultipleChoiceQuestion('What keyword declares a variable in Dart?', 'var', [
      'func',
      'var',
      'class',
    ]),
    TrueFalseQuestion('Dart is null-safe by default.', 'true'),
    MultipleChoiceQuestion('What symbol makes a type nullable?', '?', [
      '!',
      '?',
      '#',
    ]),
    TrueFalseQuestion('A List in Dart can hold duplicate values.', 'true'),
  ];

  int score = 0;

  for (int i = 0; i < questions.length; i++) {
    Question question = questions[i];
    print('Question ${i + 1}:');

    if (question is MultipleChoiceQuestion) {
      question.display();
      question.showHint();
    } else if (question is TrueFalseQuestion) {
      question.display();
    }

    stdout.write('Your answer: ');
    String? userAnswer = stdin.readLineSync();

    if (userAnswer != null && question.checkAnswer(userAnswer)) {
      print('Correct!\n');
      score++;
    } else {
      print(
        'Not quite -- the correct answer was "${question.correctAnswer}".\n',
      );
    }
  }

  print('Final Score: $score / ${questions.length}');
}
