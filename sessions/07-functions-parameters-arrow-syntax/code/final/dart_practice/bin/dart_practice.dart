// bin/dart_practice.dart
//
// Session 7 end state — the grade calculator, countdown, and squares
// table from Session 6 are refactored into three named functions
// (calculateGrade, runCountdown, printSquares), each called from
// main() instead of living as loose, one-shot code. Same output as
// Session 6, but every piece is now reusable with different inputs.
//
// Yours should hold your own details and your own examples. The shapes
// are what matter, not the values.
//
// `.toStringAsFixed(0)` is still just a one-line preview of method
// calls, properly taught starting around Session 9.

String calculateGrade(int score) {
  if (score >= 90) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else {
    return 'F';
  }
}

void runCountdown(int from) {
  int countdown = from;
  while (countdown > 0) {
    print(countdown);
    countdown--;
  }
  print('Liftoff!');
}

void printSquares(int upTo) {
  for (int i = 1; i <= upTo; i++) {
    print('$i squared is ${i * i}');
  }
}

void main() {
  const appVersion = '1.0.0';

  String name = 'Rex';
  int age = 34;
  double height = 1.8;
  bool isLearningFlutter = true;
  String? middleName = null;

  final birthYear = 2026 - age;
  final heightInCm = height * 100;

  print('Bio Script v$appVersion');
  print(
    '$name is $age years old and ${height}m tall '
    '(${heightInCm.toStringAsFixed(0)}cm).',
  );
  print('Born around $birthYear.');
  print('Learning Flutter: $isLearningFlutter');

  if (middleName == null) {
    print('No middle name on file.');
  } else {
    print('Middle name: $middleName');
  }

  print('Score 82 earns a grade of ${calculateGrade(82)}.');
  print('Score 95 earns a grade of ${calculateGrade(95)}.');

  print('Launch sequence starting...');
  runCountdown(5);

  print('Squares from 1 to 5:');
  printSquares(5);
}
