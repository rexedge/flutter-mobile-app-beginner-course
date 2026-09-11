# Coursework 07 — Functions, Parameters, Arrow Syntax

**Covers:** [Session 7 — Functions, Parameters, Arrow Syntax](../../sessions/07-functions-parameters-arrow-syntax/) · **23 exercises** · about 3 hours
**Solutions:** [solutions/07-functions-parameters-arrow-syntax.md](solutions/07-functions-parameters-arrow-syntax.md)

Same `coursework` project, one file per exercise: `bin/ex_7_1.dart` and so on.

From now on, **write your functions above `main()`**, and use `main()` only to call them — the shape Session 7 teaches. Everything from Sessions 4 to 7 is fair game. Lists and other collections are Session 8, so none of these need them.

---

## Warm-up ★

### 7.1 ★ Name the parts

**Explain.** Here's a function, and a call to it:

```dart
double calculateArea(double width, double height) {
  return width * height;
}

calculateArea(4.0, 2.5);
```

Identify each of these:

1. The return type
2. The function's name
3. The parameters
4. The arguments
5. The value that gets returned by that call

---

### 7.2 ★ Greet three people

**Write.** Write a `void` function `greet` that takes one `String` parameter called `name` and prints:

```
Hello, Ada! Welcome to Flutter.
```

Call it three times, with three different names.

---

### 7.3 ★ Square it

**Write.** Write a function `square` that takes an `int` and **returns** it multiplied by itself. Print `square(3)` and `square(12)`.

What's the difference between the way you called `greet` in 7.2 and the way you call `square` here?

---

### 7.4 ★ Make it an arrow

**Write.** Rewrite each function using arrow syntax (`=>`). Then call each once to check it still works.

```dart
int triple(int n) {
  return n * 3;
}

bool isAdult(int age) {
  return age >= 18;
}

String exclaim(String word) {
  return '$word!';
}
```

---

### 7.5 ★ void, or something back?

**Explain.** For each job, would the function be `void`, or return a value? If it returns a value, what type?

1. Printing a receipt on screen
2. Working out the VAT on a price
3. Checking whether a number is a valid percentage (0 to 100)
4. Showing a welcome banner
5. Converting kilometres to miles
6. Counting down from 10 and printing each number

---

## Practice ★★

### 7.6 ★★ Even, with a function

**Write.** Write `bool isEven(int n)` using arrow syntax. Then use a loop in `main()` to print:

```
1 is even: false
2 is even: true
...
10 is even: true
```

---

### 7.7 ★★ There and back again

**Write.** Write two functions:

- `double celsiusToFahrenheit(double c)` — multiply by 9, divide by 5, add 32
- `double fahrenheitToCelsius(double f)` — subtract 32, multiply by 5, divide by 9

Convert `100` Celsius to Fahrenheit, then feed that result straight back into the other function. Do you get `100` back?

---

### 7.8 ★★ Describe the age

**Write.** Write `String describeAge(int age)` that returns:

| Age | Returns |
|---|---|
| under 13 | `'Child'` |
| 13 to 19 | `'Teenager'` |
| 20 to 64 | `'Adult'` |
| 65 and over | `'Senior'` |

Test it with 5, 15, 30 and 70. Then test the edges: 12, 13, 19, 20, 64, 65. Do they all land where they should?

---

### 7.9 ★★ Fix it: the missing answer

**Fix.** Dart refuses this function.

```dart
String rateMovie(int stars) {
  if (stars >= 4) {
    return 'Great';
  } else if (stars >= 2) {
    return 'Okay';
  }
}
```

What does Dart say? Think about what happens when `stars` is `1`. Fix it so every possible number gets an answer.

---

### 7.10 ★★ Fix it: wrong number of arguments

**Fix.** Given:

```dart
int add(int a, int b) => a + b;
```

each of these calls is wrong. What does Dart say about each, and how do you fix it?

```dart
print(add(5));
print(add(5, 6, 7));
```

---

### 7.11 ★★ Fix it: nothing to keep

**Fix.**

```dart
void printTotal(int total) {
  print('Total: $total');
}

void main() {
  String message = printTotal(50);
  print(message);
}
```

Why can't you store the result of `printTotal` in a variable? Fix it by changing the **function**, so that `main()` can keep the message.

---

### 7.12 ★★ Fix it: wrong kind of value

**Fix.** Using `square` from 7.3:

```dart
print(square('5'));
```

What's wrong? Why is the error message a good thing, even though it stops your program?

---

### 7.13 ★★ Which calls work?

**Predict.** Given this function:

```dart
String introduce({required String name, int age = 18, String city = 'Lagos'}) {
  return '$name, $age, from $city';
}
```

Which of these calls are allowed? For the ones that are, what do they return? For the ones that aren't, why not?

```dart
introduce(name: 'Ada')                          // a
introduce('Ada')                                // b
introduce(age: 30)                              // c
introduce(city: 'Abuja', name: 'Ada')           // d
introduce(name: 'Ada', age: 25, city: 'Kano')   // e
```

---

### 7.14 ★★ Format a price

**Write.** Write a function `formatPrice` with **named** parameters:

- `amount` — a `double`, required
- `currency` — a `String`, default `'NGN'`
- `decimals` — an `int`, default `2`

It returns the currency, a space, then the amount with that many decimal places. Get all three of these from three calls:

```
NGN 1500.00
USD 19.99
NGN 1500
```

---

### 7.15 ★★ The biggest of three

**Write.** Write `int maxOfTwo(int a, int b)` that returns the larger number. Then write `int maxOfThree(int a, int b, int c)` — **without** writing any new comparisons. It should only call `maxOfTwo`.

---

### 7.16 ★★ Any times table

**Write.** Write `void printTimesTable(int n, {int upTo = 10})` that prints the times table for `n`, from 1 up to `upTo`.

Call it once as `printTimesTable(3, upTo: 5)` and once as `printTimesTable(9, upTo: 3)`. Then call it with no `upTo` at all. How many lines does that last one print?

---

### 7.17 ★★ Functions inside functions

**Predict.**

```dart
int doubleIt(int n) => n * 2;
int addOne(int n) => n + 1;

void main() {
  print(doubleIt(addOne(3)));
  print(addOne(doubleIt(3)));
  print(doubleIt(doubleIt(doubleIt(1))));
}
```

Work from the inside out. Why do the first two give different answers?

---

## Challenge ★★★

### 7.18 ★★★ Leap years, as functions

**Write.** Take the leap-year rule from exercise 6.18 and turn it into `bool isLeapYear(int year)`, using arrow syntax. Then write `int daysInYear(int year)` that **uses** `isLeapYear` to return 365 or 366.

Print:

```
1900 has 365 days
2000 has 366 days
2024 has 366 days
2025 has 365 days
```

---

### 7.19 ★★★ FizzBuzz, refactored

**Write.** Turn your FizzBuzz from 6.16 into a function `String fizzBuzz(int n)` that **returns** the right word — or the number, as a string. `main()` then loops from 1 to 15 and prints them all on one line:

```
1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz
```

Why is it useful that `fizzBuzz` *returns* a String instead of printing it?

---

### 7.20 ★★★ Primes, as functions

**Write.** Write `bool isPrime(int n)`, then `void printPrimesUpTo(int limit)` that uses it. `printPrimesUpTo(30)` should print:

```
Primes up to 30: 2 3 5 7 11 13 17 19 23 29
```

Hint: inside `isPrime`, the moment you find a number that divides evenly, you already know the answer. Session 7 taught you something `return` does that makes this very tidy.

---

### 7.21 ★★★ Triangles to order

**Write.** First write `String repeatText(String text, int times)` that returns `text` repeated `times` times — so `repeatText('ab', 3)` returns `'ababab'`.

Then write `void printTriangle(int height, {String symbol = '*'})` that **uses** `repeatText` to print a triangle. These two calls:

```dart
printTriangle(4);
printTriangle(3, symbol: '#');
```

should print:

```
*
**
***
****
#
##
###
```

Compare this with your triangle from 6.17. Which is easier to read?

---

### 7.22 ★★★ Refactor the restaurant

**Fix.** This works, but someone has copied and pasted the same logic three times.

```dart
void main() {
  double bill1 = 12000;
  double tip1 = bill1 * 0.1;
  double total1 = bill1 + tip1;
  print('Table 1: bill ${bill1.toStringAsFixed(2)}, tip ${tip1.toStringAsFixed(2)}, total ${total1.toStringAsFixed(2)}');

  double bill2 = 8500;
  double tip2 = bill2 * 0.1;
  double total2 = bill2 + tip2;
  print('Table 2: bill ${bill2.toStringAsFixed(2)}, tip ${tip2.toStringAsFixed(2)}, total ${total2.toStringAsFixed(2)}');

  double bill3 = 23000;
  double tip3 = bill3 * 0.15;
  double total3 = bill3 + tip3;
  print('Table 3: bill ${bill3.toStringAsFixed(2)}, tip ${tip3.toStringAsFixed(2)}, total ${total3.toStringAsFixed(2)}');
}
```

Run it first, and save the output. Then refactor it:

- a function `calculateTip` with a **required** named `bill` and a named `rate` that defaults to `0.1`
- a function `printBill` that prints one table's line
- `main()` shrinks to three calls — and table 3 still gets its 15% tip

Your output must be **identical** to the original. That's the test of a refactor.

---

### 7.23 ★★★ Sums and averages

**Write.** Write `int sumRange(int from, int to)` that adds up every whole number from `from` to `to`, inclusive. Then write `double averageRange(int from, int to)` that **uses** `sumRange`.

Check: `sumRange(1, 10)` is `55`, `averageRange(1, 10)` is `5.5`, and `averageRange(4, 6)` is `5.0`.

Watch out: how many numbers are there from 4 to 6? It's not `6 - 4`.

---

## Done?

- [ ] Every exercise attempted
- [ ] Every function sits above `main()`, with `main()` only calling them
- [ ] Your 7.22 refactor prints exactly the same output as the original
- [ ] You can explain parameter versus argument without looking
- [ ] You checked your answers against the [solutions](solutions/07-functions-parameters-arrow-syntax.md)
