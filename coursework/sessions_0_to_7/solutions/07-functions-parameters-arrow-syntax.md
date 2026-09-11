# Solutions 07 — Functions, Parameters, Arrow Syntax

[← Back to the exercises](../07-functions-parameters-arrow-syntax.md) · [Workbook guide](../README.md)

> Every output below is real. To run all of these solutions at once: [`code/session_07.dart`](code/session_07.dart).
>
> **This session's errors are worded differently in VS Code and in the terminal more than any other.** Every fix-it exercise shows both.

---

## 7.1 ★ Name the parts

1. **Return type:** `double`
2. **Name:** `calculateArea`
3. **Parameters:** `double width` and `double height` — the named placeholders in the definition
4. **Arguments:** `4.0` and `2.5` — the actual values handed over in the call
5. **Returned value:** `10.0` — `4.0 * 2.5`

The distinction to lock in: **parameters live in the definition, arguments live in the call.** The parameter `width` is a slot; the argument `4.0` is what goes in that slot this time.

---

## 7.2 ★ Greet three people

```dart
void greet(String name) {
  print('Hello, $name! Welcome to Flutter.');
}

void main() {
  greet('Ada');
  greet('Emeka');
  greet('Zainab');
}
```

```
Hello, Ada! Welcome to Flutter.
Hello, Emeka! Welcome to Flutter.
Hello, Zainab! Welcome to Flutter.
```

It's `void` because its whole job is printing — there's nothing to hand back.

---

## 7.3 ★ Square it

```dart
int square(int n) {
  return n * n;
}

void main() {
  print(square(3));
  print(square(12));
}
```

```
9
144
```

**The difference in the call:** `greet('Ada');` stands alone as a line of its own, because it gives nothing back. `square(3)` has to go *somewhere* — inside `print()`, into a variable, into a calculation — because it produces a value. Call `square(3);` on its own line and the answer is worked out, then thrown away.

---

## 7.4 ★ Make it an arrow

```dart
int triple(int n) => n * 3;
bool isAdult(int age) => age >= 18;
String exclaim(String word) => '$word!';

void main() {
  print(triple(7));
  print(isAdult(16));
  print(exclaim('Hooray'));
}
```

```
21
false
Hooray!
```

Each original body was just `return` and one expression, which is exactly when arrow syntax works. `=> expression` means `{ return expression; }`.

---

## 7.5 ★ void, or something back?

| | Job | Answer |
|---|---|---|
| 1 | Printing a receipt | `void` — printing *is* the job |
| 2 | Working out VAT | returns `double` — you need the number to use it |
| 3 | Is it a valid percentage? | returns `bool` — a yes-or-no answer |
| 4 | Showing a welcome banner | `void` |
| 5 | Kilometres to miles | returns `double` |
| 6 | Counting down and printing | `void` — it prints; nothing comes back |

**The test:** after calling it, will you need to *use* the result somewhere? Yes means a real return type. No means `void`.

---

## 7.6 ★★ Even, with a function

```dart
bool isEven(int n) => n % 2 == 0;

void main() {
  for (int i = 1; i <= 10; i++) {
    print('$i is even: ${isEven(i)}');
  }
}
```

```
1 is even: false
2 is even: true
3 is even: false
4 is even: true
5 is even: false
6 is even: true
7 is even: false
8 is even: true
9 is even: false
10 is even: true
```

A function call is an expression, so it can go straight inside `${...}`.

---

## 7.7 ★★ There and back again

```dart
double celsiusToFahrenheit(double c) => c * 9 / 5 + 32;
double fahrenheitToCelsius(double f) => (f - 32) * 5 / 9;

void main() {
  final f = celsiusToFahrenheit(100);
  print(f);
  print(fahrenheitToCelsius(f));
}
```

```
212.0
100.0
```

**Yes, you get 100 back.** One function's answer fed straight into the other. When two functions undo each other perfectly, it's good evidence both are right.

The brackets in `(f - 32)` are essential — the 32 must be taken away *before* multiplying. Without them, Dart would do `32 * 5 / 9` first.

---

## 7.8 ★★ Describe the age

```dart
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

void main() {
  print(describeAge(5));
  print(describeAge(15));
  print(describeAge(30));
  print(describeAge(70));
}
```

```
Child
Teenager
Adult
Senior
```

**The edges:**

| Age | Result |
|---|---|
| 12 | Child |
| 13 | Teenager |
| 19 | Teenager |
| 20 | Adult |
| 64 | Adult |
| 65 | Senior |

Testing the edges — the exact numbers where the answer changes — is where bugs hide. If you'd written `age < 19` instead of `age <= 19`, 19-year-olds would be called adults, and you'd only find out by testing 19 specifically.

---

## 7.9 ★★ Fix it: the missing answer

| Where | Message |
|---|---|
| VS Code | `The body might complete normally, causing 'null' to be returned, but the return type, 'String', is a potentially non-nullable type.` |
| Terminal | `A non-null value must be returned since the return type 'String' doesn't allow null.` |

**When `stars` is 1**, neither condition is true, so the function reaches its closing brace without ever hitting a `return`. It has no answer to give. But it promised to *always* return a `String` — so Dart refuses.

Add an `else`, so every possible number reaches a `return`:

```dart
String rateMovie(int stars) {
  if (stars >= 4) {
    return 'Great';
  } else if (stars >= 2) {
    return 'Okay';
  } else {
    return 'Skip it';
  }
}
```

```dart
print(rateMovie(5));   // Great
print(rateMovie(3));   // Okay
print(rateMovie(1));   // Skip it
```

This is the same idea as Session 6's "must be assigned before it can be used" — Dart checks every possible path through your code, and won't accept one that leads to no value.

---

## 7.10 ★★ Fix it: wrong number of arguments

**`add(5)` — too few:**

| Where | Message |
|---|---|
| VS Code | `2 positional arguments expected by 'add', but 1 found.` |
| Terminal | `Too few positional arguments: 2 required, 1 given.` |

**`add(5, 6, 7)` — too many:**

| Where | Message |
|---|---|
| VS Code | `Too many positional arguments: 2 expected, but 3 found.` |
| Terminal | `Too many positional arguments: 2 allowed, but 3 found.` |

**The fix is always the same:** look at the definition, count what it asks for, and match it. `add` takes exactly two:

```dart
print(add(5, 6));
```

```
11
```

If you genuinely wanted to add three numbers, you'd need a different function.

---

## 7.11 ★★ Fix it: nothing to keep

| Where | Message |
|---|---|
| VS Code | `This expression has a type of 'void' so its value can't be used.` |
| Terminal | `This expression has type 'void' and can't be used.` |

`printTotal` is `void` — it prints, and hands nothing back. There's no value to store in `message`.

**Fix the function, not `main()`:** make it *return* the message instead of printing it.

```dart
String totalMessage(int total) => 'Total: $total';

void main() {
  String message = totalMessage(50);
  print(message);
}
```

```
Total: 50
```

**This is a genuinely useful pattern.** A function that returns a `String` is more flexible than one that prints: the caller can print it, store it, combine it with other text, or show it on a screen later. A function that prints can only ever print.

---

## 7.12 ★★ Fix it: wrong kind of value

```
The argument type 'String' can't be assigned to the parameter type 'int'.
```

VS Code and the terminal agree on this one.

`'5'` is in quotes, so it's text. `square` asked for an `int`.

```dart
print(square(5));
```

```
25
```

**Why the error is a good thing:** without it, Dart would try to multiply the *text* "5" by itself, which means nothing. You'd get a crash, or a strange result, while the program was running — maybe on someone else's phone. Instead, Dart caught it the moment you typed it. That's the whole point of giving parameters types.

---

## 7.13 ★★ Which calls work?

| | Call | Result |
|---|---|---|
| a | `introduce(name: 'Ada')` | **Allowed** — `Ada, 18, from Lagos` |
| b | `introduce('Ada')` | **Refused** |
| c | `introduce(age: 30)` | **Refused** |
| d | `introduce(city: 'Abuja', name: 'Ada')` | **Allowed** — `Ada, 18, from Abuja` |
| e | `introduce(name: 'Ada', age: 25, city: 'Kano')` | **Allowed** — `Ada, 25, from Kano` |

**(b) is refused** because every parameter is inside `{ }` — they're *named*. There are no positional slots at all, so `'Ada'` has nowhere to go:

| Where | Message |
|---|---|
| VS Code | `Too many positional arguments: 0 expected, but 1 found.` |
| Terminal | `Too many positional arguments: 0 allowed, but 1 found.` |

VS Code also adds a second error for (b), because `name` still wasn't provided.

**(c) is refused** because `name` is `required`, and it's missing:

| Where | Message |
|---|---|
| VS Code | `The named parameter 'name' is required, but there's no corresponding argument.` |
| Terminal | `Required named parameter 'name' must be provided.` |

**(d) works** — named arguments can come in **any order**. That's one of the main reasons to use them.

**(a) and (d) show the defaults** filling in whatever you leave out: age 18 in both, and Lagos unless you say otherwise.

---

## 7.14 ★★ Format a price

```dart
String formatPrice({
  required double amount,
  String currency = 'NGN',
  int decimals = 2,
}) {
  return '$currency ${amount.toStringAsFixed(decimals)}';
}

void main() {
  print(formatPrice(amount: 1500));
  print(formatPrice(amount: 19.99, currency: 'USD'));
  print(formatPrice(amount: 1500, decimals: 0));
}
```

```
NGN 1500.00
USD 19.99
NGN 1500
```

**Two things to notice:**

- `amount: 1500` is fine even though `amount` is a `double`. Dart turns a whole number into a `double` for you — the same rule you saw in exercise 4.5.
- `decimals` is passed straight into `toStringAsFixed(...)`. A parameter can be used anywhere a value can.

When a function has three or more parameters, named ones make each call readable: `formatPrice(amount: 1500, decimals: 0)` says exactly what it means.

---

## 7.15 ★★ The biggest of three

```dart
int maxOfTwo(int a, int b) {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}

int maxOfThree(int a, int b, int c) => maxOfTwo(maxOfTwo(a, b), c);

void main() {
  print(maxOfTwo(8, 3));
  print(maxOfThree(4, 11, 7));
}
```

```
8
11
```

**How `maxOfThree` works:** find the bigger of `a` and `b`, then compare *that* with `c`. Two comparisons, both done by `maxOfTwo`. No new logic needed.

This is what functions are really for: once you've solved a small problem, you can build bigger solutions out of it without solving it again.

(If `a` and `b` are equal, `maxOfTwo` returns `b` — which is the same number, so the answer is still right.)

---

## 7.16 ★★ Any times table

```dart
void printTimesTable(int n, {int upTo = 10}) {
  for (int i = 1; i <= upTo; i++) {
    print('$n x $i = ${n * i}');
  }
}

void main() {
  printTimesTable(3, upTo: 5);
  printTimesTable(9, upTo: 3);
}
```

```
3 x 1 = 3
3 x 2 = 6
3 x 3 = 9
3 x 4 = 12
3 x 5 = 15
9 x 1 = 9
9 x 2 = 18
9 x 3 = 27
```

**With no `upTo`**, it uses the default and prints **10 lines** — for example, `printTimesTable(2)` goes from `2 x 1 = 2` to `2 x 10 = 20`.

A mix of both kinds of parameter: `n` is positional, because it's obvious what the one number means. `upTo` is named, because `printTimesTable(3, 5)` would leave a reader guessing which number is which.

---

## 7.17 ★★ Functions inside functions

```
8
7
8
```

Work from the **inside out**:

- `doubleIt(addOne(3))` → `addOne(3)` is 4 → `doubleIt(4)` is **8**
- `addOne(doubleIt(3))` → `doubleIt(3)` is 6 → `addOne(6)` is **7**
- `doubleIt(doubleIt(doubleIt(1)))` → 1 → 2 → 4 → **8**

**The first two differ because the order differs.** Adding one and then doubling isn't the same as doubling and then adding one — exactly like in maths, where `(3 + 1) × 2` isn't `(3 × 2) + 1`.

---

## 7.18 ★★★ Leap years, as functions

```dart
bool isLeapYear(int year) =>
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;

int daysInYear(int year) {
  if (isLeapYear(year)) {
    return 366;
  } else {
    return 365;
  }
}

void main() {
  print('1900 has ${daysInYear(1900)} days');
  print('2000 has ${daysInYear(2000)} days');
  print('2024 has ${daysInYear(2024)} days');
  print('2025 has ${daysInYear(2025)} days');
}
```

```
1900 has 365 days
2000 has 366 days
2024 has 366 days
2025 has 365 days
```

Compare this with 6.18. The rule is exactly the same — but now it has a **name**. `if (isLeapYear(year))` reads like plain English, and nobody has to decode the `%` logic every time they meet it.

---

## 7.19 ★★★ FizzBuzz, refactored

```dart
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

void main() {
  String line = '';
  for (int i = 1; i <= 15; i++) {
    line = '$line${fizzBuzz(i)} ';
  }
  print(line);
}
```

```
1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz
```

**`'$n'` turns the number into text**, because the function promised to return a `String` every time.

**Why returning beats printing:** in 6.16, FizzBuzz could only print one line per number. Because this version *returns* its answer, `main()` gets to decide what to do with it — here, joining all fifteen onto one line. The function doesn't care how its answer gets used. That's the same lesson as 7.11.

---

## 7.20 ★★★ Primes, as functions

```dart
bool isPrime(int n) {
  if (n < 2) {
    return false;
  }
  for (int divisor = 2; divisor < n; divisor++) {
    if (n % divisor == 0) {
      return false;
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

void main() {
  printPrimesUpTo(30);
}
```

```
Primes up to 30: 2 3 5 7 11 13 17 19 23 29
```

**The thing `return` does that makes this tidy: it ends the function immediately.** The moment a divisor goes in evenly, `return false` stops the loop and the function together — there's no point checking the rest. No `bool` flag needed, unlike 6.19.

If the loop gets all the way through without finding a divisor, the function reaches `return true` at the bottom.

The `n < 2` check at the top handles 0, 1 and negative numbers, none of which are prime.

---

## 7.21 ★★★ Triangles to order

```dart
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

void main() {
  printTriangle(4);
  printTriangle(3, symbol: '#');
}
```

```
*
**
***
****
#
##
###
```

**Compared with 6.17:** the nested loop is gone from sight. The inner loop still exists — it's inside `repeatText` — but `printTriangle` now reads as one clear idea: *for each row, print the symbol that many times*. Each function does one job and has a name that says what it is.

`repeatText` is also useful on its own. `repeatText('-', 20)` gives you a divider line.

---

## 7.22 ★★★ Refactor the restaurant

```dart
double calculateTip({required double bill, double rate = 0.1}) => bill * rate;

void printBill({required String table, required double bill, double rate = 0.1}) {
  final tip = calculateTip(bill: bill, rate: rate);
  final total = bill + tip;
  print('$table: bill ${bill.toStringAsFixed(2)}, '
      'tip ${tip.toStringAsFixed(2)}, total ${total.toStringAsFixed(2)}');
}

void main() {
  printBill(table: 'Table 1', bill: 12000);
  printBill(table: 'Table 2', bill: 8500);
  printBill(table: 'Table 3', bill: 23000, rate: 0.15);
}
```

```
Table 1: bill 12000.00, tip 1200.00, total 13200.00
Table 2: bill 8500.00, tip 850.00, total 9350.00
Table 3: bill 23000.00, tip 3450.00, total 26450.00
```

**This is byte-for-byte identical to the original's output** — checked by running both and comparing them. That's the test of a real refactor: the code got better, and the behaviour didn't change at all.

**What you gained:**

- `main()` went from twelve lines to three, and each line says what it does.
- The tip logic lives in one place. Change the rule once, and every table follows.
- Table 3's different rate is one named argument — `rate: 0.15` — instead of a number hidden in the middle of a copy-pasted block.
- In the original, a fourth table meant copying four more lines and renaming every variable. Now it's one line.

---

## 7.23 ★★★ Sums and averages

```dart
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
  print(sumRange(1, 10));
  print(averageRange(1, 10));
  print(averageRange(4, 6));
}
```

```
55
5.5
5.0
```

**The watch-out:** from 4 to 6 there are **three** numbers — 4, 5 and 6 — but `6 - 4` is only 2. When you count both ends, you have to add one: `to - from + 1`. This is the off-by-one from Session 6's loop exercises, showing up in arithmetic this time.

**Why it returns a `double`:** an average often isn't a whole number — the average of 1 to 10 is 5.5 — and `/` always gives a `double` anyway.
