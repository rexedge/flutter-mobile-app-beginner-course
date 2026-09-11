// bin/quiz_engine.dart
//
// Module 1's mini-app — a real, interactive console quiz, built with
// every tool from Sessions 4-9: variables, operators, control flow,
// functions, collections, and this session's new addition, classes
// (with inheritance and a mixin).
//
// This is Module 1's finish line. The "trailer" back in Session 4 was
// hardcoded and fake. This version genuinely reads what you type via
// `stdin.readLineSync()` (from dart:io) and responds to it.
//
// Make it yours — the questions below are Dart trivia, but the whole
// point is that you can put anything in that list.
//
// Scope note: `question is MultipleChoiceQuestion` in main() is a
// runtime type check — used just enough to make this work, not
// formally taught until the Advanced course. Trust the shape.

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

// A mixin: shared behavior any class can borrow with `with`, without
// joining Question's inheritance chain. Only question types that
// genuinely support a hint should have one — not every Question.
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
    MultipleChoiceQuestion(
      'What keyword declares a variable in Dart?',
      'var',
      ['func', 'var', 'class'],
    ),
    TrueFalseQuestion('Dart is null-safe by default.', 'true'),
    MultipleChoiceQuestion(
      'What symbol makes a type nullable?',
      '?',
      ['!', '?', '#'],
    ),
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
