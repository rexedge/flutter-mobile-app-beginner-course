// Coursework solutions — Session 7: Functions, Parameters, Arrow Syntax
//
// Run every solution at once:
//   dart run session_07.dart
//
// This time the functions ARE the answers. Every function each exercise
// asks for is defined at the top level of this file, above main(), the way
// Session 7 teaches. main() calls them in exercise order.
//
// "Fix it" exercises (7.9 to 7.12) show the FIXED version. The broken
// versions and their errors are in ../07-functions-parameters-arrow-syntax.md.
// Pure-explanation exercises (7.1, 7.5) have no code here.

// 7.2
void greet(String name) {
  print('Hello, $name! Welcome to Flutter.');
}

// 7.3
int square(int n) {
  return n * n;
}

// 7.4 — the three functions, rewritten with arrow syntax
int triple(int n) => n * 3;
bool isAdult(int age) => age >= 18;
String exclaim(String word) => '$word!';

// 7.6
bool isEven(int n) => n % 2 == 0;

// 7.7
double celsiusToFahrenheit(double c) => c * 9 / 5 + 32;
double fahrenheitToCelsius(double f) => (f - 32) * 5 / 9;

// 7.8
String describeAge(int age) {
  if (age < 13) {
    return 'Child';
  } else if (age <= 19) {
    return 'Teenager';
  } else if (age <= 64) {
    return 'Adult';
  } else {
    return 'Senior';
  }
}

// 7.9 — fixed: every path now returns something
String rateMovie(int stars) {
  if (stars >= 4) {
    return 'Great';
  } else if (stars >= 2) {
    return 'Okay';
  } else {
    return 'Skip it';
  }
}

// 7.10
int add(int a, int b) => a + b;

// 7.11 — fixed: a function whose result you want must return it
String totalMessage(int total) => 'Total: $total';

// 7.13
String introduce({required String name, int age = 18, String city = 'Lagos'}) {
  return '$name, $age, from $city';
}

// 7.14
String formatPrice({
  required double amount,
  String currency = 'NGN',
  int decimals = 2,
}) {
  return '$currency ${amount.toStringAsFixed(decimals)}';
}

// 7.15
int maxOfTwo(int a, int b) {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}

int maxOfThree(int a, int b, int c) => maxOfTwo(maxOfTwo(a, b), c);

// 7.16
void printTimesTable(int n, {int upTo = 10}) {
  for (int i = 1; i <= upTo; i++) {
    print('$n x $i = ${n * i}');
  }
}

// 7.17
int doubleIt(int n) => n * 2;
int addOne(int n) => n + 1;

// 7.18
bool isLeapYear(int year) =>
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;

int daysInYear(int year) {
  if (isLeapYear(year)) {
    return 366;
  } else {
    return 365;
  }
}

// 7.19
String fizzBuzz(int n) {
  if (n % 3 == 0 && n % 5 == 0) {
    return 'FizzBuzz';
  } else if (n % 3 == 0) {
    return 'Fizz';
  } else if (n % 5 == 0) {
    return 'Buzz';
  } else {
    return '$n';
  }
}

// 7.20
bool isPrime(int n) {
  if (n < 2) {
    return false;
  }
  for (int divisor = 2; divisor < n; divisor++) {
    if (n % divisor == 0) {
      return false; // return ends the function the moment we know
    }
  }
  return true;
}

void printPrimesUpTo(int limit) {
  String primes = '';
  for (int n = 2; n <= limit; n++) {
    if (isPrime(n)) {
      primes = '$primes$n ';
    }
  }
  print('Primes up to $limit: $primes');
}

// 7.21
String repeatText(String text, int times) {
  String result = '';
  for (int i = 1; i <= times; i++) {
    result = '$result$text';
  }
  return result;
}

void printTriangle(int height, {String symbol = '*'}) {
  for (int row = 1; row <= height; row++) {
    print(repeatText(symbol, row));
  }
}

// 7.22 — the refactor
double calculateTip({required double bill, double rate = 0.1}) => bill * rate;

void printBill({required String table, required double bill, double rate = 0.1}) {
  final tip = calculateTip(bill: bill, rate: rate);
  final total = bill + tip;
  print('$table: bill ${bill.toStringAsFixed(2)}, '
      'tip ${tip.toStringAsFixed(2)}, total ${total.toStringAsFixed(2)}');
}

// 7.23
int sumRange(int from, int to) {
  int sum = 0;
  for (int i = from; i <= to; i++) {
    sum = sum + i;
  }
  return sum;
}

double averageRange(int from, int to) {
  final count = to - from + 1;
  return sumRange(from, to) / count;
}

void main() {
  print('--- 7.2 ---');
  greet('Ada');
  greet('Emeka');
  greet('Zainab');

  print('--- 7.3 ---');
  print(square(3));
  print(square(12));

  print('--- 7.4 ---');
  print(triple(7));
  print(isAdult(16));
  print(exclaim('Hooray'));

  print('--- 7.6 ---');
  for (int i = 1; i <= 10; i++) {
    print('$i is even: ${isEven(i)}');
  }

  print('--- 7.7 ---');
  final f = celsiusToFahrenheit(100);
  print(f);
  print(fahrenheitToCelsius(f));

  print('--- 7.8 ---');
  print(describeAge(5));
  print(describeAge(15));
  print(describeAge(30));
  print(describeAge(70));

  print('--- 7.9 ---');
  print(rateMovie(5));
  print(rateMovie(3));
  print(rateMovie(1));

  print('--- 7.10 ---');
  print(add(5, 6));

  print('--- 7.11 ---');
  String message = totalMessage(50);
  print(message);

  print('--- 7.12 ---');
  print(square(5));

  print('--- 7.13 ---');
  print(introduce(name: 'Ada'));
  print(introduce(city: 'Abuja', name: 'Ada'));
  print(introduce(name: 'Ada', age: 25, city: 'Kano'));

  print('--- 7.14 ---');
  print(formatPrice(amount: 1500));
  print(formatPrice(amount: 19.99, currency: 'USD'));
  print(formatPrice(amount: 1500, decimals: 0));

  print('--- 7.15 ---');
  print(maxOfTwo(8, 3));
  print(maxOfThree(4, 11, 7));

  print('--- 7.16 ---');
  printTimesTable(3, upTo: 5);
  printTimesTable(9, upTo: 3);

  print('--- 7.17 ---');
  print(doubleIt(addOne(3)));
  print(addOne(doubleIt(3)));
  print(doubleIt(doubleIt(doubleIt(1))));

  print('--- 7.18 ---');
  print('1900 has ${daysInYear(1900)} days');
  print('2000 has ${daysInYear(2000)} days');
  print('2024 has ${daysInYear(2024)} days');
  print('2025 has ${daysInYear(2025)} days');

  print('--- 7.19 ---');
  String line = '';
  for (int i = 1; i <= 15; i++) {
    line = '$line${fizzBuzz(i)} ';
  }
  print(line);

  print('--- 7.20 ---');
  printPrimesUpTo(30);

  print('--- 7.21 ---');
  printTriangle(4);
  printTriangle(3, symbol: '#');

  print('--- 7.22 ---');
  printBill(table: 'Table 1', bill: 12000);
  printBill(table: 'Table 2', bill: 8500);
  printBill(table: 'Table 3', bill: 23000, rate: 0.15);

  print('--- 7.23 ---');
  print(sumRange(1, 10));
  print(averageRange(1, 10));
  print(averageRange(4, 6));
}
