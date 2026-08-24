// bin/dart_practice.dart
//
// Session 5 end state — the bio script from the build section. Every
// print() now uses string interpolation instead of separate calls, and
// two new values (`birthYear`, `heightInCm`) are computed with
// arithmetic operators and declared `final`. `appVersion` is `const`,
// since its value is fixed and known before the program ever runs.
//
// Yours should hold your own details, not these. The shape is what
// matters, not the values.
//
// The `if (middleName == null)` check still uses `if` before its
// formal lesson in Session 6. `.toStringAsFixed(0)` is a one-line
// preview of method calls, taught properly from Session 9.

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
