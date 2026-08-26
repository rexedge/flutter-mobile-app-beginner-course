// bin/dart_practice.dart
//
// Session 6 end state — adds an if/else-if/else grade calculator, a
// while-loop countdown, and a for-loop squares table, on top of
// everything from Sessions 4-5. One file now does five genuinely
// different jobs: storing data, null-checking, branching, counting
// down, and repeating a calculation.
//
// Yours should hold your own details and your own examples. The shapes
// are what matter, not the values.
//
// `.toStringAsFixed(0)` is still just a one-line preview of method
// calls, properly taught starting around Session 9.

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

  // --- Session 6: branching ---
  int score = 82;
  String grade;

  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else {
    grade = 'F';
  }

  print('Score $score earns a grade of $grade.');

  // --- Session 6: while loop (the countdown from the top of the session) ---
  print('Launch sequence starting...');
  int countdown = 5;
  while (countdown > 0) {
    print(countdown);
    countdown--;
  }
  print('Liftoff!');

  // --- Session 6: for loop ---
  print('Squares from 1 to 5:');
  for (int i = 1; i <= 5; i++) {
    print('$i squared is ${i * i}');
  }
}
