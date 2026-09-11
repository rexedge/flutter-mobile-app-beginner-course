// bin/dart_practice.dart
//
// Session 8 end state — the two hardcoded calculateGrade() calls from
// Session 7 are replaced with a full grade report: a List built from
// two smaller lists (spread) plus a conditional bonus score
// (collection-if), run through calculateGrade in a for-in loop, with
// results tallied into a Set (unique grades) and a Map (grade counts).
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

  // --- Session 8: the full grade report ---
  List<int> morningScores = [82, 95, 61];
  List<int> afternoonScores = [74, 88];
  bool includeBonusRound = true;

  List<int> allScores = [
    ...morningScores,
    ...afternoonScores,
    if (includeBonusRound) 100,
  ];

  Set<String> gradesSeen = <String>{};
  Map<String, int> gradeCounts = {};

  print('--- Grade Report ---');
  for (int score in allScores) {
    String grade = calculateGrade(score);
    print('Score $score: $grade');

    gradesSeen.add(grade);
    gradeCounts[grade] = (gradeCounts[grade] ?? 0) + 1;
  }

  print('Unique grades this round: $gradesSeen');
  print('Grade counts: $gradeCounts');

  print('Launch sequence starting...');
  runCountdown(5);

  print('Squares from 1 to 5:');
  printSquares(5);
}
