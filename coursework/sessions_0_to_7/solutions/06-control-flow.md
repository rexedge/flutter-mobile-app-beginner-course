# Solutions 06 — Control Flow

[← Back to the exercises](../06-control-flow.md) · [Workbook guide](../README.md)

> Every output below is real. To run all of these solutions at once: [`code/session_06.dart`](code/session_06.dart). (The broken loops from 6.13 aren't in there — they'd never finish.)

---

## 6.1 ★ Which branch?

| `temperature` | Prints |
|---|---|
| `25` | `Warm` |
| `30` | `Hot` |
| `19` | `Cool` |

**30 is the one to understand.** `30 >= 30` is `true` — "greater than or equal" includes equal. So the very first condition catches it, prints `Hot`, and Dart skips everything else in the chain.

19 fails both checks (`19 >= 30` and `19 >= 20` are both false), so it falls all the way to `else`.

---

## 6.2 ★ Positive, negative or zero

```dart
void main() {
  int n = -4;
  if (n > 0) {
    print('$n is positive');
  } else if (n < 0) {
    print('$n is negative');
  } else {
    print('$n is zero');
  }
}
```

```
-4 is negative
```

`7` prints `7 is positive` and `0` prints `0 is zero`.

Notice zero doesn't need its own condition. If a number isn't above zero and isn't below it, the only thing left is zero — so `else` is enough.

---

## 6.3 ★ Count to ten

```dart
void main() {
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}
```

```
1
2
3
4
5
6
7
8
9
10
```

`<= 10`, not `< 10`. With `< 10` you'd stop at 9 — a classic off-by-one.

---

## 6.4 ★ Countdown

```dart
void main() {
  for (int i = 10; i >= 1; i--) {
    print(i);
  }
  print('Blast off!');
}
```

```
10
9
8
7
6
5
4
3
2
1
Blast off!
```

All three parts of the loop header flip compared with 6.3: **start** high (`10`), **keep going while** `i >= 1`, and **count down** with `i--`.

`Blast off!` sits *after* the closing `}` of the loop, so it runs once, when the loop is finished. Put it inside the braces and it prints ten times.

---

## 6.5 ★ Traffic light

```dart
void main() {
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
```

```
Get ready
```

One value, checked against an exact list of options — the perfect job for `switch`. The `break`s are optional in Dart 3 (see 6.8), but most Dart code includes them.

---

## 6.6 ★★ Fix it: the distinction nobody gets

**Why `Distinction` can never print:** conditions are checked top to bottom, and the first one that's true wins. Any score of 90 or above is *also* 50 or above — so `score >= 50` catches it first, prints `Pass`, and the rest of the chain is skipped. The `>= 90` check is never even reached.

The same thing blocks `Merit`.

**The fix: most specific first.**

```dart
void main() {
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
```

```
Distinction
```

This bug never gives an error. The code is perfectly legal — it's just wrong. That makes it one of the hardest kinds to spot, and one of the most common.

---

## 6.7 ★★ Weekday or weekend

```dart
void main() {
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
```

```
Saturday is the weekend
```

**Empty cases share the next case's body.** `case 'Monday':` has nothing under it, so it drops straight through to the next case that *does* have a body. Five weekday cases, one `print`.

This is the one place Dart still "falls through" — and only because the case is completely empty. See 6.8 for what happens when a case isn't empty.

---

## 6.8 ★★ No break

```
Medium
Done
```

Just **`Medium`**, then `Done`. Not `Medium`, `Large`, `Unknown`.

**In Dart 3, a case that matches runs its own body, and then the whole `switch` ends** — with or without `break`. It never runs on into the next case.

If you've used C, Java or JavaScript, you'd expect the opposite. In those languages, leaving out `break` makes execution "fall through" and run every case below the match too. Dart deliberately doesn't do that, because it caused so many bugs.

So why does most Dart code still write `break`? Habit, consistency with other languages, and because it's harmless. Write it or don't — just know what it does.

---

## 6.9 ★★ Even numbers, two ways

```dart
void main() {
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
```

```
2 4 6 8 10 12 14 16 18 20
2 4 6 8 10 12 14 16 18 20
```

**Way 1** visits all 20 numbers and uses `%` to keep only the even ones. **Way 2** starts at 2 and jumps by 2 each time, so it only ever visits the ten even numbers — half the work.

**Building a line:** `way1 = '$way1$i ';` means "take what's already in `way1`, add this number and a space, and store the result back." After the loop, the string holds every number, and one `print` shows them all.

(The line ends with an invisible trailing space. That's fine — there's no way to see it.)

---

## 6.10 ★★ Seven times table

```dart
void main() {
  for (int i = 1; i <= 12; i++) {
    print('7 x $i = ${7 * i}');
  }
}
```

```
7 x 1 = 7
7 x 2 = 14
7 x 3 = 21
7 x 4 = 28
7 x 5 = 35
7 x 6 = 42
7 x 7 = 49
7 x 8 = 56
7 x 9 = 63
7 x 10 = 70
7 x 11 = 77
7 x 12 = 84
```

**For the 9 times table you had to change two characters** — both `7`s. Miss one, and you get nonsense like `9 x 3 = 21`.

The better way is to put the number in a variable once:

```dart
int table = 9;
for (int i = 1; i <= 12; i++) {
  print('$table x $i = ${table * i}');
}
```

Now changing tables means changing one thing, in one place. Hold on to that feeling — it's exactly what Session 7's functions are for.

---

## 6.11 ★★ Add them all up

```dart
void main() {
  int sum = 0;
  for (int i = 1; i <= 100; i++) {
    sum = sum + i;
  }
  print('The sum of 1 to 100 is $sum.');
}
```

```
The sum of 1 to 100 is 5050.
```

**Why outside the loop:** the running total has to survive from one repeat to the next. A variable declared *inside* the loop's braces is created fresh every time round — it would be reset to 0 on every repeat, and you'd lose the total. Declared *before* the loop, it's created once and keeps growing.

The `print` also has to be outside, or you'd print a running total a hundred times.

---

## 6.12 ★★ How many times?

| Loop | Runs | First `i` | Last `i` |
|---|---|---|---|
| A — `i = 0; i < 5` | **5** | 0 | 4 |
| B — `i = 1; i <= 5` | **5** | 1 | 5 |
| C — `i = 0; i <= 5` | **6** | 0 | 5 |

The proof:

```dart
void main() {
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
```

```
A runs 5 times, B runs 5 times, C runs 6 times
```

**C is the trap:** starting at 0 *and* using `<=` counts both ends — 0, 1, 2, 3, 4, 5 is six numbers. When a loop needs to run exactly N times, the two safe shapes are A and B. Pick one and use it every time.

---

## 6.13 ★★ Fix it: two loops that never end

**(a) The counter never changes.** `i` starts at 0 and nothing inside the loop ever changes it, so `i < 5` is true forever. It prints `0` endlessly.

Fix: add `i++` inside the loop.

```dart
int i = 0;
while (i < 5) {
  print(i);
  i++;
}
```

**(b) It counts the wrong way.** `i` starts at 10, and the loop keeps going while `i > 0` — but `i++` makes `i` *bigger* every time: 10, 11, 12... It moves further away from ever reaching 0, never closer.

Fix: count down.

```dart
for (int i = 10; i > 0; i--) {
  print(i);
}
```

(b) is sneakier because it *looks* like it has an update — there's an `i++` right there. The update exists; it just pushes the wrong way. **Every loop needs an update that moves it *toward* the stopping point.**

---

## 6.14 ★★ Always at least once

**Three lines:**

```
Running with 10
Finished at 11
Finished at 10
```

- The **`do`-`while`** runs its body *first* and checks the condition *afterwards*. So it prints `Running with 10` and bumps `n` to 11. Only then does it check `11 < 5` — false — and stop.
- The **`while`** checks *first*. `10 < 5` is false straight away, so its body never runs at all, and `m` stays 10.

**That's the entire difference between them:** a `do`-`while` always runs at least once. A `while` might run zero times.

---

## 6.15 ★★ Keep doubling

```dart
void main() {
  int value = 1;
  int steps = 0;
  while (value <= 1000) {
    print(value);
    value = value * 2;
    steps++;
  }
  print('First value over 1000: $value, after $steps doublings.');
}
```

```
1
2
4
8
16
32
64
128
256
512
First value over 1000: 1024, after 10 doublings.
```

**It's a `while` job because you don't know in advance how many times it'll run.** A `for` loop is built around counting to a known number. Here, the loop runs *until something happens* — the value passing 1000 — and working out how many steps that takes is the whole point of the exercise.

Notice 1024 is never printed inside the loop. The loop doubles 512 to 1024, then checks `1024 <= 1000`, which is false, and stops before printing again.

---

## 6.16 ★★★ FizzBuzz

```dart
void main() {
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
```

```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
```

**The "both" check has to come first** — for exactly the reason in 6.6. Put `i % 3 == 0` first, and 15 is caught as `Fizz` before the chain ever reaches the FizzBuzz check. Most specific condition first, always.

(Something divisible by both 3 and 5 is divisible by 15, so `i % 15 == 0` works too.)

---

## 6.17 ★★★ Star triangle

```dart
void main() {
  int height = 5;
  for (int row = 1; row <= height; row++) {
    String line = '';
    for (int star = 1; star <= row; star++) {
      line = '$line*';
    }
    print(line);
  }
}
```

```
*
**
***
****
*****
```

Change `height` to `8` for an 8-row triangle.

**How the two loops work together:** the outer loop picks the row — 1, then 2, then 3. For each row, the inner loop runs `row` times, adding one `*` each time. Row 3's inner loop adds three stars.

**Where `line` is declared matters.** It's *inside* the outer loop, so it starts empty for every row. Move it outside, and each row keeps the previous row's stars and adds more — try it and see what happens.

---

## 6.18 ★★★ Leap years

```dart
void main() {
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
```

```
1892
1896
1904
1908
1992
1996
2000
2004
2008
```

**1900 is missing** — even though it divides by 4. It also divides by 100, so the first half of the rule is false. And it doesn't divide by 400, so the second half is false too. Not a leap year.

**2000 is there** — it also divides by 100, so the first half is false. But it *does* divide by 400, so the second half rescues it.

That's why the rule has two halves joined by `||`, and why the brackets matter: they keep the "by 4 and not by 100" part together as one condition.

---

## 6.19 ★★★ Prime numbers

```dart
void main() {
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
```

```
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47
```

**The `bool` flag is the trick.** Assume every number is prime, then try to prove otherwise. If any divisor goes in evenly, flip the flag to `false`. Once the inner loop has tried everything, the flag tells you the answer.

`isPrime` is declared *inside* the outer loop so it's reset to `true` for each new candidate — the same idea as `line` in 6.17.

**For 2, the inner loop runs zero times** — the divisor starts at 2, and `2 < 2` is false straight away. Nothing proves 2 isn't prime, so the flag stays `true`. Correct: 2 is prime.

This version keeps checking even after it finds a divisor, which is wasted work. In Session 7 you'll see a neater way to stop the moment the answer is known.

---

## 6.20 ★★★ ATM menu

```dart
void main() {
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
```

With `choice = 2`:

```
Withdrew 1500.00. New balance: 3500.00
```

With the other choices:

| `choice` | Prints |
|---|---|
| `1` | `Your balance is 5000.00` |
| `2`, `amount = 9000.0` | `Insufficient funds` |
| `3` | `Deposited 1500.00. New balance: 6500.00` |
| `7` | `Invalid option` |

**An `if` inside a `case`.** That's allowed and completely normal: the `switch` picks *which* operation, and the `if` decides whether that operation is *allowed*. Choosing the right tool for each decision is the real skill of this session.

The long `print` lines are split across two lines with two strings side by side. Dart joins strings that sit next to each other, with nothing between them, into one — the same trick your practice file used in Session 5.
