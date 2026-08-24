// bin/dart_practice.dart
//
// Session 4 end state — the bio script from the build section. Five
// variables covering all four of this session's core types, plus one
// nullable field handled safely with a null check.
//
// Yours should hold your own details, not these. The shape is what
// matters, not the values.
//
// The `if (middleName == null)` check below uses `if` before its
// formal lesson in Session 6. Trust the shape for now — you'll learn
// exactly how it works then.

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
