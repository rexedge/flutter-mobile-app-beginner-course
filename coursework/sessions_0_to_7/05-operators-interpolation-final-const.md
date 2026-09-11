# Coursework 05 — Operators, Interpolation, final vs const

**Covers:** [Session 5 — Operators, String Interpolation, final vs const](../../sessions/05-operators-interpolation-final-const/) · **20 exercises** · about 2 hours
**Solutions:** [solutions/05-operators-interpolation-final-const.md](solutions/05-operators-interpolation-final-const.md)

Same `coursework` project, one file per exercise: `bin/ex_5_1.dart`, `bin/ex_5_2.dart`, and so on.

**You can now use string interpolation** — `'$name'` and `'${a + b}'` — everywhere. You **can't** use `if`/`else` yet; that's Session 6. When an exercise asks a yes-or-no question, print the `bool` itself.

---

## Warm-up ★

### 5.1 ★ The six operators

**Predict.** Write down all six results before you run it.

```dart
void main() {
  int a = 17;
  int b = 5;
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a ~/ b);
  print(a % b);
}
```

---

### 5.2 ★ Division always has a point

**Predict.**

```dart
void main() {
  print(10 / 5);
  print(10 ~/ 5);
  print(9 / 3);
}
```

Why do two of these print a decimal point, even though the answers are whole numbers?

---

### 5.3 ★ Yes-or-no questions

**Predict.** Each line prints `true` or `false`. Which?

```dart
void main() {
  int x = 12;
  int y = 20;
  print(x == y);
  print(x != y);
  print(x < y);
  print(x > y);
  print(x >= 12);
  print(y <= 19);
}
```

---

### 5.4 ★ Fix it: the name that didn't appear

**Fix.** This runs, but prints the wrong thing. What does it print, and how do you fix it?

```dart
void main() {
  String name = 'Chidi';
  print('Welcome, name!');
}
```

---

### 5.5 ★ One sentence, three variables

**Write.** Given these variables:

```dart
String dish = 'Jollof rice';
int portions = 3;
double pricePerPortion = 2.5;
```

print exactly this sentence, with the total worked out by Dart inside the string:

```
3 portions of Jollof rice cost 7.5.
```

---

## Practice ★★

### 5.6 ★★ Which goes first?

**Predict.**

```dart
void main() {
  print(2 + 3 * 4);
  print((2 + 3) * 4);
  print(20 - 6 / 2);
  print((20 - 6) / 2);
}
```

What rule decides the order? (You already know it from maths class.)

---

### 5.7 ★★ Interpolation traps

**Predict.** Look very carefully at each string.

```dart
void main() {
  int a = 4;
  int b = 6;
  print('$a + $b = ${a + b}');
  print('$a + $b = $a + $b');
  print('${a}0');
}
```

Why do the first two lines print different things?

---

### 5.8 ★★ Fix it: where does the name end?

**Fix.** This won't run.

```dart
void main() {
  int hours = 3;
  print('Meeting in $hourshrs');
}
```

What error do you get, why, and what's the fix? (Hint: look at the third line of 5.7.)

---

### 5.9 ★★ Minutes to hours

**Write.** Given `int totalMinutes = 135;`, print:

```
135 minutes is 2 hours and 15 minutes.
```

Dart must work out the `2` and the `15`. Change `totalMinutes` to `200` and check it still gives the right answer.

---

### 5.10 ★★ Even or odd?

**Write.** Given `int n = 17;`, create a `bool` called `isEven` that is `true` when `n` is even and `false` when it's odd. Then print:

```
17 is even: false
```

Try it with `n = 42` too. Which operator makes this possible?

---

### 5.11 ★★ Truth tables

**Predict.** Fill in the result of each line. No running until you've written all ten.

| | Expression | Result |
|---|---|---|
| 1 | `true && true` | |
| 2 | `true && false` | |
| 3 | `false && true` | |
| 4 | `false && false` | |
| 5 | `true \|\| true` | |
| 6 | `true \|\| false` | |
| 7 | `false \|\| true` | |
| 8 | `false \|\| false` | |
| 9 | `!true` | |
| 10 | `!false` | |

In one sentence each: when is `&&` true? When is `||` true?

---

### 5.12 ★★ Can they come in?

**Write.** A cinema lets you in if you **have a ticket**, and you're **either 18 or over, or with an adult**.

```dart
int age = 15;
bool withAdult = true;
bool hasTicket = true;
```

Create a `bool canEnter` using those rules, and print `Can enter: true` (or `false`).

Then work out — before changing any code — what happens if the same person arrives without an adult. Change the code to check.

---

### 5.13 ★★ Fix it: the value that was locked

**Fix.**

```dart
void main() {
  final int year = 2026;
  year = 2027;
  print(year);
}
```

What does VS Code say? What does the terminal say when you `dart run`? What's the fix — and why might `final` have been the *right* choice if the value really shouldn't change?

---

### 5.14 ★★ Fix it: const too early

**Fix.**

```dart
void main() {
  int base = 10;
  const doubled = base * 2;
  print(doubled);
}
```

Why does Dart refuse this, and what one-word change fixes it?

---

### 5.15 ★★ const from const

**Predict.** Does this run? If so, what does it print?

```dart
void main() {
  const a = 10;
  const b = a * 2;
  print(b);
}
```

Now compare it with 5.14. What's the difference that makes one allowed and the other refused?

---

### 5.16 ★★ var, final or const?

**Explain.** Pick the best keyword for each value, and give a one-line reason.

1. The value of pi, 3.14159
2. The number of days in a week
3. A player's score, which goes up during a game
4. Someone's birth year, calculated from the age they typed in
5. The app's name, which never changes
6. A username chosen at sign-up, which can't be changed later
7. The current temperature reading, which updates every minute

---

## Challenge ★★★

### 5.17 ★★★ Seconds to h, m, s

**Write.** Given `int totalSeconds = 3725;`, print:

```
3725 seconds is 1h 2m 5s.
```

Every number must be worked out by Dart. Test it with `7384` and `59` as well.

Hint: an hour is 3600 seconds. Work out the hours first, then deal with what's left over.

---

### 5.18 ★★★ Temperature converter

**Write.** Given `double celsius = 36.6;`, work out:

- Fahrenheit: multiply by 9, divide by 5, add 32
- Kelvin: add 273.15

Store both in `final` variables. First, `print(fahrenheit)` on its own and look closely at the result. Then print both properly, rounded to one decimal place:

```
36.6 C is 97.9 F
36.6 C is 309.8 K
```

What did you notice about the raw `print(fahrenheit)`?

---

### 5.19 ★★★ Split the bill

**Write.** Four friends share a meal. The bill before tip is `18500.0`. They add a 10% tip, then split the total evenly.

- Store the tip rate as a `const`
- Store the tip, the total and each person's share in `final` variables
- Print a receipt, every amount with exactly two decimal places:

```
Subtotal:   18500.00
Tip (10%):  1850.00
Total:      20350.00
Each of 4 pays 5087.50
```

---

### 5.20 ★★★ Age stats

**Write.** Given `int age = 25;`, work out and print:

- roughly how many days old that is (use 365 days a year)
- roughly how many hours old
- whether they're a teenager — 13 to 19, inclusive — as a `bool`
- how many *full* decades they've lived (25 → 2)

Use `const` for the numbers that never change, like days per year. Print each on its own clearly labelled line.

---

## Done?

- [ ] Every exercise attempted
- [ ] Every **Predict** answer written down *before* running
- [ ] You can explain the difference between `/` and `~/` without looking
- [ ] You can explain when to use `var`, `final` and `const` without looking
- [ ] You checked your answers against the [solutions](solutions/05-operators-interpolation-final-const.md)
