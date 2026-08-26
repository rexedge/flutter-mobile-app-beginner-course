// bin/dart_practice.dart
//
// Session 6 starting point — carried over unchanged from Session 5's
// end state. String interpolation throughout, plus final/const values.
// If you still have your own dart_practice, use that instead; this copy
// is here in case you need a clean one.
//
// Session 6 adds an if/else-if/else grade calculator, a while-loop
// countdown, and a for-loop squares table. See final/dart_practice for
// the result. The `if (middleName == null)` check below is no longer
// ahead of schedule — Session 6 is its formal lesson.
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
}
