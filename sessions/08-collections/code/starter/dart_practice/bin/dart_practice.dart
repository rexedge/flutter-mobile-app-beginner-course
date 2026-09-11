// bin/dart_practice.dart
//
// Session 8 starting point — carried over unchanged from Session 7's
// end state. calculateGrade, runCountdown, and printSquares are real
// functions now, but each is still only ever called with one hardcoded
// value at a time. If you still have your own dart_practice, use that
// instead; this copy is here in case you need a clean one.
//
// Session 8 adds a full grade report built from List, Set, and Map,
// running calculateGrade across many scores in one loop. See
// final/dart_practice for the result.
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
