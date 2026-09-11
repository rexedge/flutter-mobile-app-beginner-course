// Coursework solutions — Session 5: Operators, Interpolation, final vs const
//
// Run every solution at once:
//   dart run session_05.dart
//
// Each exercise sits inside its own small function so they can share one
// file. You'll learn how functions work in Session 7 — for now, read the
// code inside each one. It's what you'd type inside main().
//
// Pure-explanation exercises (5.11, 5.16) have no code here. "Fix it"
// exercises (5.4, 5.8, 5.13, 5.14) show the FIXED version; the broken
// versions and their errors are in ../05-operators-interpolation-final-const.md.

void main() {
  exercise1();
  exercise2();
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
  exercise15();
  exercise17();
  exercise18();
  exercise19();
  exercise20();
}

// 5.1 — Arithmetic
void exercise1() {
  print('--- 5.1 ---');
  int a = 17;
  int b = 5;
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a ~/ b);
  print(a % b);
}

// 5.2 — Division always gives a double
void exercise2() {
  print('--- 5.2 ---');
  print(10 / 5);
  print(10 ~/ 5);
  print(9 / 3);
}

// 5.3 — Comparisons
void exercise3() {
  print('--- 5.3 ---');
  int x = 12;
  int y = 20;
  print(x == y);
  print(x != y);
  print(x < y);
  print(x > y);
  print(x >= 12);
  print(y <= 19);
}

// 5.4 — Fixed: the $ was missing
void exercise4() {
  print('--- 5.4 ---');
  String name = 'Chidi';
  print('Welcome, $name!');
}

// 5.5 — Interpolation with an expression
void exercise5() {
  print('--- 5.5 ---');
  String dish = 'Jollof rice';
  int portions = 3;
  double pricePerPortion = 2.5;
  print('$portions portions of $dish cost ${portions * pricePerPortion}.');
}

// 5.6 — Order of operations
void exercise6() {
  print('--- 5.6 ---');
  print(2 + 3 * 4);
  print((2 + 3) * 4);
  print(20 - 6 / 2);
  print((20 - 6) / 2);
}

// 5.7 — Interpolation traps
void exercise7() {
  print('--- 5.7 ---');
  int a = 4;
  int b = 6;
  print('$a + $b = ${a + b}');
  print('$a + $b = $a + $b');
  print('${a}0');
}

// 5.8 — Fixed: curly braces mark where the variable name ends
void exercise8() {
  print('--- 5.8 ---');
  int hours = 3;
  print('Meeting in ${hours}hrs');
}

// 5.9 — Minutes to hours and minutes
void exercise9() {
  print('--- 5.9 ---');
  int totalMinutes = 135;
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;
  print('$totalMinutes minutes is $hours hours and $minutes minutes.');
}

// 5.10 — Even or odd, as a bool
void exercise10() {
  print('--- 5.10 ---');
  int n = 17;
  bool isEven = n % 2 == 0;
  print('$n is even: $isEven');
}

// 5.12 — Cinema entry
void exercise12() {
  print('--- 5.12 ---');
  int age = 15;
  bool withAdult = true;
  bool hasTicket = true;
  bool canEnter = (age >= 18 || withAdult) && hasTicket;
  print('Can enter: $canEnter');

  // Same person, arriving alone
  bool withAdultToday = false;
  bool canEnterAlone = (age >= 18 || withAdultToday) && hasTicket;
  print('Can enter alone: $canEnterAlone');
}

// 5.13 — Fixed: a value that changes must not be final
void exercise13() {
  print('--- 5.13 ---');
  var year = 2026;
  year = 2027;
  print(year);
}

// 5.14 — Fixed: a value that depends on a variable must be final, not const
void exercise14() {
  print('--- 5.14 ---');
  int base = 10;
  final doubled = base * 2;
  print(doubled);
}

// 5.15 — const built from const is allowed
void exercise15() {
  print('--- 5.15 ---');
  const a = 10;
  const b = a * 2;
  print(b);
}

// 5.17 — Seconds to hours, minutes and seconds
void exercise17() {
  print('--- 5.17 ---');
  int totalSeconds = 3725;
  int hours = totalSeconds ~/ 3600;
  int minutes = (totalSeconds % 3600) ~/ 60;
  int seconds = totalSeconds % 60;
  print('$totalSeconds seconds is ${hours}h ${minutes}m ${seconds}s.');
}

// 5.18 — Temperature converter
void exercise18() {
  print('--- 5.18 ---');
  double celsius = 36.6;
  final fahrenheit = celsius * 9 / 5 + 32;
  final kelvin = celsius + 273.15;

  print(fahrenheit); // the raw value, floating-point noise and all
  print('$celsius C is ${fahrenheit.toStringAsFixed(1)} F');
  print('$celsius C is ${kelvin.toStringAsFixed(1)} K');
}

// 5.19 — Bill splitter
void exercise19() {
  print('--- 5.19 ---');
  const tipRate = 0.1;
  double subtotal = 18500.0;
  int people = 4;

  final tip = subtotal * tipRate;
  final total = subtotal + tip;
  final perPerson = total / people;

  print('Subtotal:   ${subtotal.toStringAsFixed(2)}');
  print('Tip (10%):  ${tip.toStringAsFixed(2)}');
  print('Total:      ${total.toStringAsFixed(2)}');
  print('Each of $people pays ${perPerson.toStringAsFixed(2)}');
}

// 5.20 — Age stats
void exercise20() {
  print('--- 5.20 ---');
  const daysPerYear = 365;
  const hoursPerDay = 24;
  int age = 25;

  final days = age * daysPerYear;
  final hours = days * hoursPerDay;
  final isTeenager = age >= 13 && age <= 19;
  final decade = age ~/ 10;

  print('Age: $age');
  print('Roughly $days days, or $hours hours.');
  print('Teenager: $isTeenager');
  print('Full decades lived: $decade');
}
