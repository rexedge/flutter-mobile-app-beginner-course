// bin/dart_practice.dart
//
// Session 5 starting point — carried over unchanged from Session 4's
// end state. If you still have your own dart_practice from Session 4,
// use that instead; this copy is here in case you need a clean one.
//
// Session 5 rewrites these print() calls using string interpolation
// and adds final/const values. See final/dart_practice for the result.
//
// The `if (middleName == null)` check below still uses `if` before its
// formal lesson in Session 6. Trust the shape for now.

void main() {
  String name = 'Rex';
  int age = 34;
  double height = 1.8;
  bool isLearningFlutter = true;
  String? middleName = null;

  print(name);
  print(age);
  print(height);
  print(isLearningFlutter);

  if (middleName == null) {
    print('No middle name on file.');
  } else {
    print(middleName);
  }
}
