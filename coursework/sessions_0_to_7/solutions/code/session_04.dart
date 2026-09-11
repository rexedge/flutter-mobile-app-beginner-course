// Coursework solutions — Session 4: Variables, Types, Null Safety
//
// Run every solution at once:
//   dart run session_04.dart
//
// Each exercise sits inside its own small function (exercise1, exercise2,
// and so on) so they can share one file without their variable names
// clashing. You'll learn exactly how functions work in Session 7 — for now,
// read the code *inside* each one. It is exactly what you would type inside
// main() in your own project.
//
// Exercises that are pure explanation (4.2, 4.11, 4.15, 4.16) have no code.
// Their answers are in ../04-variables-types-null-safety.md.
//
// Exercises 4.6 to 4.9 and 4.13 are "fix it" exercises. What's below is the
// FIXED version. The broken versions, and the errors they produce, are in
// the solutions markdown.

void main() {
  exercise1();
  exercise3();
  exercise4();
  exercise5();
  exercise6();
  exercise7();
  exercise8();
  exercise9();
  exercise10();
  exercise12();
  exercise13();
  exercise14();
}

// 4.1 — Film variables
void exercise1() {
  print('--- 4.1 ---');
  String title = 'The Lion King';
  int releaseYear = 1994;
  double rating = 8.5;
  bool seenMoreThanOnce = true;

  print(title);
  print(releaseYear);
  print(rating);
  print(seenMoreThanOnce);
}

// 4.3 — Predict the output
void exercise3() {
  print('--- 4.3 ---');
  String city = 'Abuja';
  int population = 3800000;
  double temperature = 30.0;
  double distance = 2.50;
  bool isCapital = true;

  print(city);
  print(population);
  print(temperature);
  print(distance);
  print(isCapital);
}

// 4.4 — From var to explicit types
void exercise4() {
  print('--- 4.4 ---');
  String greeting = 'Hello';
  int daysInWeek = 7;
  double shoeSize = 7.5;
  bool isRaining = false;

  print(greeting);
  print(daysInWeek);
  print(shoeSize);
  print(isRaining);
}

// 4.5 — Error or fine? Only the lines that compile are here.
void exercise5() {
  print('--- 4.5 ---');
  double price = 5; // (b) fine — Dart stores 5 as 5.0
  String? note = null; // (e) fine
  int? level = null; // (f) fine
  double? weight = 72; // (g) fine — stored as 72.0

  print(price);
  print(note);
  print(level);
  print(weight);
}

// 4.6 — Fixed: the value in quotes was text, not a number
void exercise6() {
  print('--- 4.6 ---');
  int age = 25;
  print(age);
}

// 4.7 — Fixed, two different ways
void exercise7() {
  print('--- 4.7 ---');
  // Fix 1: give it a real value
  String nickname = 'Ace';
  print(nickname);

  // Fix 2: admit it might be empty
  String? otherNickname = null;
  print(otherNickname);
}

// 4.8 — Fixed: var locked the type to int, so keep it an int
void exercise8() {
  print('--- 4.8 ---');
  var score = 10;
  score = 20;
  print(score);
}

// 4.9 — Fixed: Dart names are case-sensitive
void exercise9() {
  print('--- 4.9 ---');
  String firstName = 'Ada';
  print(firstName);
}

// 4.10 — Variables can change
void exercise10() {
  print('--- 4.10 ---');
  var level = 1;
  level = 2;
  level = 3;
  print(level);

  String greeting = 'Hi';
  greeting = 'Hello';
  print(greeting);
}

// 4.12 — A nullable variable with no value starts as null
void exercise12() {
  print('--- 4.12 ---');
  int? highScore;
  String? favouriteColour;
  print(highScore);
  print(favouriteColour);
}

// 4.13 — The four-bug program, fixed
void exercise13() {
  print('--- 4.13 ---');
  String name = 'Tunde'; // bug 1: missing semicolon
  int age = 29; // bug 2: 29.5 is a double
  bool isStudent = true; // bug 3: 'yes' is a String
  String? email;
  print(name); // bug 4: Name with a capital N doesn't exist
  print(age);
  print(isStudent);
  print(email);
}

// 4.14 — Pet profile
void exercise14() {
  print('--- 4.14 ---');
  String petName = 'Biscuit';
  String species = 'Dog';
  int ageYears = 3;
  double weightKg = 12.4;
  bool isVaccinated = true;
  int vetVisitsThisYear = 2;
  String? microchipId = null;
  String? favouriteToy = 'Rope';

  print(petName);
  print(species);
  print(ageYears);
  print(weightKg);
  print(isVaccinated);
  print(vetVisitsThisYear);
  print(microchipId);
  print(favouriteToy);

  // A year later
  ageYears = 4;
  microchipId = 'MC-58213';

  print(ageYears);
  print(microchipId);
}
