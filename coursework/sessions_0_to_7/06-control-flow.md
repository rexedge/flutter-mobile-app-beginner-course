# Coursework 06 — Control Flow

**Covers:** [Session 6 — Control Flow: if/else, switch, loops](../../sessions/06-control-flow/) · **20 exercises** · about 2.5 hours
**Solutions:** [solutions/06-control-flow.md](solutions/06-control-flow.md)

Same `coursework` project, one file per exercise: `bin/ex_6_1.dart` and so on.

You can now use everything from Sessions 4, 5 and 6: variables, operators, interpolation, `final`/`const`, `if`/`else`, `switch`, and `for`/`while`/`do`-`while` loops. You **can't** write your own functions yet — that's Session 7. Everything goes inside `main()`.

> **If a program never stops,** press <kbd>Ctrl</kbd>+<kbd>C</kbd> in the terminal. You will need this at least once in this set.

---

## Warm-up ★

### 6.1 ★ Which branch?

**Predict.** What does this print when `temperature` is `25`? Then `30`? Then `19`?

```dart
void main() {
  int temperature = 25;
  if (temperature >= 30) {
    print('Hot');
  } else if (temperature >= 20) {
    print('Warm');
  } else {
    print('Cool');
  }
}
```

Pay special attention to `30`. Which branch catches it, and why?

---

### 6.2 ★ Positive, negative or zero

**Write.** Given `int n = -4;`, print whether it's positive, negative, or zero:

```
-4 is negative
```

Test it with `7` and `0` too. All three must work.

---

### 6.3 ★ Count to ten

**Write.** Use a `for` loop to print the numbers 1 to 10, one per line.

---

### 6.4 ★ Countdown

**Write.** Use a `for` loop to count down from 10 to 1, then print `Blast off!` once, after the loop.

---

### 6.5 ★ Traffic light

**Write.** Given `String light = 'amber';`, use a `switch` to print:

| `light` | Print |
|---|---|
| `'red'` | `Stop` |
| `'amber'` | `Get ready` |
| `'green'` | `Go` |
| anything else | `Unknown colour` |

---

## Practice ★★

### 6.6 ★★ Fix it: the distinction nobody gets

**Fix.** A student scored 95, but this prints `Pass`. No error, just the wrong answer.

```dart
void main() {
  int score = 95;
  if (score >= 50) {
    print('Pass');
  } else if (score >= 70) {
    print('Merit');
  } else if (score >= 90) {
    print('Distinction');
  } else {
    print('Fail');
  }
}
```

Explain why `Distinction` can never print, no matter what the score is. Then fix it.

---

### 6.7 ★★ Weekday or weekend

**Write.** Given `String day = 'Saturday';`, use **one** `switch` to print `Saturday is the weekend`, or `Tuesday is a weekday`, and so on. Anything that isn't a day prints `Blursday is not a day`.

Don't write the same `print` five times for the five weekdays. The chapter showed a way to make several cases share one body.

---

### 6.8 ★★ No break

**Predict.** Not one of these cases has a `break`. What does this print?

```dart
void main() {
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
```

If you've used another programming language before, your instinct may be wrong here. Run it.

---

### 6.9 ★★ Even numbers, two ways

**Write.** Print the even numbers from 2 to 20, all on **one line**, separated by spaces:

```
2 4 6 8 10 12 14 16 18 20
```

Do it **twice**, two different ways:

1. Loop through every number from 1 to 20, and only include the even ones.
2. Loop through *only* the even numbers, so the loop never even visits an odd one.

Hint for printing on one line: build up a `String` inside the loop with interpolation, then print it once after the loop.

---

### 6.10 ★★ Seven times table

**Write.** Print the 7 times table from 1 to 12:

```
7 x 1 = 7
7 x 2 = 14
...
7 x 12 = 84
```

Then change one thing so it prints the 9 times table instead. How many characters did you have to change?

---

### 6.11 ★★ Add them all up

**Write.** Use a loop to add up every whole number from 1 to 100. Print:

```
The sum of 1 to 100 is 5050.
```

You'll need a variable *outside* the loop to keep the running total. Why outside, not inside?

---

### 6.12 ★★ How many times?

**Predict.** For each loop, how many times does the body run, and what are the first and last values of `i`?

```dart
for (int i = 0; i < 5; i++) { ... }     // A
for (int i = 1; i <= 5; i++) { ... }    // B
for (int i = 0; i <= 5; i++) { ... }    // C
```

Then prove your answers by adding a counter to each loop and printing it afterwards.

---

### 6.13 ★★ Fix it: two loops that never end

**Fix.** Both of these run forever. **Don't run them** — or if you do, be ready with <kbd>Ctrl</kbd>+<kbd>C</kbd>.

**(a)**

```dart
int i = 0;
while (i < 5) {
  print(i);
}
```

**(b)**

```dart
for (int i = 10; i > 0; i++) {
  print(i);
}
```

For each: why does it never stop? What's the one-change fix?

(b) is the sneakier one. Read the update part carefully.

---

### 6.14 ★★ Always at least once

**Predict.** `n` starts at 10, and the loop condition is `n < 5` — false from the very start.

```dart
void main() {
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
```

How many lines does it print in total? What does each say?

---

### 6.15 ★★ Keep doubling

**Write.** Start with `int value = 1;`. Keep doubling it — printing each value — for as long as it's 1000 or less. Count how many doublings it takes. Finish with:

```
First value over 1000: 1024, after 10 doublings.
```

This is a `while` job, not a `for` job. Why?

---

## Challenge ★★★

### 6.16 ★★★ FizzBuzz

**Write.** The most famous beginner programming exercise in the world. For every number from 1 to 30:

- if it's divisible by 3 **and** 5, print `FizzBuzz`
- otherwise, if it's divisible by 3, print `Fizz`
- otherwise, if it's divisible by 5, print `Buzz`
- otherwise, print the number

The order of your checks matters enormously. Think about 6.6 before you start.

---

### 6.17 ★★★ Star triangle

**Write.** Print this triangle using loops — you're not allowed to type `*****` anywhere in your code:

```
*
**
***
****
*****
```

Then change a single number so it prints a triangle 8 rows tall.

Hint: you'll need a loop *inside* a loop. The outer loop picks the row. The inner loop builds that row's stars.

---

### 6.18 ★★★ Leap years

**Write.** A year is a leap year if:

- it's divisible by 4 **and not** divisible by 100
- **or** it's divisible by 400

Print every leap year from 1890 to 1910, then every leap year from 1990 to 2010.

Look at your output closely. Something happened to 1900, and something different happened to 2000. Explain both.

---

### 6.19 ★★★ Prime numbers

**Write.** A prime number is a whole number above 1 that divides evenly **only** by 1 and itself. Print every prime from 2 to 50 on a single line.

Hint: for each candidate number, assume it's prime (`bool isPrime = true;`), then use an inner loop to try dividing it by every number between 2 and itself. If any of them divides evenly, it isn't prime.

---

### 6.20 ★★★ ATM menu

**Write.** Simulate a cash machine. Start with:

```dart
double balance = 5000.0;
double amount = 1500.0;
int choice = 2;
```

Use a `switch` on `choice`:

| `choice` | What happens |
|---|---|
| `1` | Print the balance |
| `2` | Withdraw `amount` — but **only** if there's enough money. Otherwise print `Insufficient funds` |
| `3` | Deposit `amount`, and print the new balance |
| anything else | `Invalid option` |

Every amount prints with two decimal places. Test all four choices, and test option 2 with an `amount` bigger than the balance.

---

## Done?

- [ ] Every exercise attempted
- [ ] Every **Predict** answer written down *before* running
- [ ] You've used <kbd>Ctrl</kbd>+<kbd>C</kbd> to stop a runaway program at least once, calmly
- [ ] FizzBuzz works for all 30 numbers
- [ ] You checked your answers against the [solutions](solutions/06-control-flow.md)
