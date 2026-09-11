// Coursework solutions — Session 6: Control Flow
//
// Run every solution at once:
//   dart run session_06.dart
//
// Each exercise sits inside its own small function so they can share one
// file. You'll learn how functions work in Session 7 — for now, read the
// code inside each one. It's what you'd type inside main().
//
// "Fix it" exercises (6.6, 6.13) show the FIXED version. The infinite-loop
// versions from 6.13 are deliberately NOT in this file — running them would
// never finish. They're explained in ../06-control-flow.md.

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
  exercise11();
  exercise12();
  exercise13();
  exercise14();
  exercise15();
  exercise16();
  exercise17();
  exercise18();
  exercise19();
  exercise20();
}

// 6.1 — Predict the branch (three temperatures)
void exercise1() {
  print('--- 6.1 ---');
  int temperature = 25;
  if (temperature >= 30) {
    print('Hot');
  } else if (temperature >= 20) {
    print('Warm');
  } else {
    print('Cool');
  }

  temperature = 30;
  if (temperature >= 30) {
    print('Hot');
  } else if (temperature >= 20) {
    print('Warm');
  } else {
    print('Cool');
  }

  temperature = 19;
  if (temperature >= 30) {
    print('Hot');
  } else if (temperature >= 20) {
    print('Warm');
  } else {
    print('Cool');
  }
}

// 6.2 — Positive, negative or zero
void exercise2() {
  print('--- 6.2 ---');
  int n = -4;
  if (n > 0) {
    print('$n is positive');
  } else if (n < 0) {
    print('$n is negative');
  } else {
    print('$n is zero');
  }
}

// 6.3 — Count to ten
void exercise3() {
  print('--- 6.3 ---');
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}

// 6.4 — Countdown
void exercise4() {
  print('--- 6.4 ---');
  for (int i = 10; i >= 1; i--) {
    print(i);
  }
  print('Blast off!');
}

// 6.5 — Traffic light
void exercise5() {
  print('--- 6.5 ---');
  String light = 'amber';
  switch (light) {
    case 'red':
      print('Stop');
      break;
    case 'amber':
      print('Get ready');
      break;
    case 'green':
      print('Go');
      break;
    default:
      print('Unknown colour');
  }
}

// 6.6 — Fixed: most specific condition first
void exercise6() {
  print('--- 6.6 ---');
  int score = 95;
  if (score >= 90) {
    print('Distinction');
  } else if (score >= 70) {
    print('Merit');
  } else if (score >= 50) {
    print('Pass');
  } else {
    print('Fail');
  }
}

// 6.7 — Weekday or weekend, with grouped cases
void exercise7() {
  print('--- 6.7 ---');
  String day = 'Saturday';
  switch (day) {
    case 'Monday':
    case 'Tuesday':
    case 'Wednesday':
    case 'Thursday':
    case 'Friday':
      print('$day is a weekday');
      break;
    case 'Saturday':
    case 'Sunday':
      print('$day is the weekend');
      break;
    default:
      print('$day is not a day');
  }
}

// 6.8 — Dart 3 does not fall through
void exercise8() {
  print('--- 6.8 ---');
  String size = 'M';
  switch (size) {
    case 'S':
      print('Small');
    case 'M':
      print('Medium');
    case 'L':
      print('Large');
    default:
      print('Unknown');
  }
  print('Done');
}

// 6.9 — Even numbers from 2 to 20, two ways
void exercise9() {
  print('--- 6.9 ---');
  // Way 1: check every number
  String way1 = '';
  for (int i = 1; i <= 20; i++) {
    if (i % 2 == 0) {
      way1 = '$way1$i ';
    }
  }
  print(way1);

  // Way 2: only visit even numbers
  String way2 = '';
  for (int i = 2; i <= 20; i = i + 2) {
    way2 = '$way2$i ';
  }
  print(way2);
}

// 6.10 — Seven times table
void exercise10() {
  print('--- 6.10 ---');
  for (int i = 1; i <= 12; i++) {
    print('7 x $i = ${7 * i}');
  }
}

// 6.11 — Sum of 1 to 100
void exercise11() {
  print('--- 6.11 ---');
  int sum = 0;
  for (int i = 1; i <= 100; i++) {
    sum = sum + i;
  }
  print('The sum of 1 to 100 is $sum.');
}

// 6.12 — Count the lines
void exercise12() {
  print('--- 6.12 ---');
  int countA = 0;
  for (int i = 0; i < 5; i++) {
    countA++;
  }
  int countB = 0;
  for (int i = 1; i <= 5; i++) {
    countB++;
  }
  int countC = 0;
  for (int i = 0; i <= 5; i++) {
    countC++;
  }
  print('A runs $countA times, B runs $countB times, C runs $countC times');
}

// 6.13 — Both infinite loops, fixed
void exercise13() {
  print('--- 6.13 ---');
  // (a) the counter never changed — add i++
  int i = 0;
  while (i < 5) {
    print(i);
    i++;
  }

  // (b) counting up while checking for "greater than 0" — count down instead
  for (int j = 10; j > 0; j--) {
    print(j);
  }
}

// 6.14 — do-while always runs once
void exercise14() {
  print('--- 6.14 ---');
  int n = 10;
  do {
    print('Running with $n');
    n++;
  } while (n < 5);
  print('Finished at $n');

  int m = 10;
  while (m < 5) {
    print('Running with $m');
    m++;
  }
  print('Finished at $m');
}

// 6.15 — Keep doubling
void exercise15() {
  print('--- 6.15 ---');
  int value = 1;
  int steps = 0;
  while (value <= 1000) {
    print(value);
    value = value * 2;
    steps++;
  }
  print('First value over 1000: $value, after $steps doublings.');
}

// 6.16 — FizzBuzz, 1 to 30
void exercise16() {
  print('--- 6.16 ---');
  for (int i = 1; i <= 30; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');
    } else if (i % 3 == 0) {
      print('Fizz');
    } else if (i % 5 == 0) {
      print('Buzz');
    } else {
      print(i);
    }
  }
}

// 6.17 — Star triangle
void exercise17() {
  print('--- 6.17 ---');
  int height = 5;
  for (int row = 1; row <= height; row++) {
    String line = '';
    for (int star = 1; star <= row; star++) {
      line = '$line*';
    }
    print(line);
  }
}

// 6.18 — Leap years
void exercise18() {
  print('--- 6.18 ---');
  for (int year = 1890; year <= 1910; year++) {
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
      print(year);
    }
  }
  for (int year = 1990; year <= 2010; year++) {
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
      print(year);
    }
  }
}

// 6.19 — Prime numbers up to 50
void exercise19() {
  print('--- 6.19 ---');
  String primes = '';
  for (int candidate = 2; candidate <= 50; candidate++) {
    bool isPrime = true;
    for (int divisor = 2; divisor < candidate; divisor++) {
      if (candidate % divisor == 0) {
        isPrime = false;
      }
    }
    if (isPrime) {
      primes = '$primes$candidate ';
    }
  }
  print(primes);
}

// 6.20 — ATM menu
void exercise20() {
  print('--- 6.20 ---');
  double balance = 5000.0;
  double amount = 1500.0;
  int choice = 2;

  switch (choice) {
    case 1:
      print('Your balance is ${balance.toStringAsFixed(2)}');
      break;
    case 2:
      if (amount <= balance) {
        balance = balance - amount;
        print('Withdrew ${amount.toStringAsFixed(2)}. '
            'New balance: ${balance.toStringAsFixed(2)}');
      } else {
        print('Insufficient funds');
      }
      break;
    case 3:
      balance = balance + amount;
      print('Deposited ${amount.toStringAsFixed(2)}. '
          'New balance: ${balance.toStringAsFixed(2)}');
      break;
    default:
      print('Invalid option');
  }
}
