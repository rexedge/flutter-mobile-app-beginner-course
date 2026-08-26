# Session 6 — Control Flow: if/else, switch, loops

**Module 1 — Dart From Zero** · Session 6 of 36 · about 18 minutes to read
**Code for this session:** [`code/starter/dart_practice`](code/starter/dart_practice) → [`code/final/dart_practice`](code/final/dart_practice)

---

## What you'll be able to do by the end

- Write `if` / `else if` / `else` chains that branch on conditions
- Write a `switch` statement, and know when it beats `if`/`else`
- Write `for` and `while` loops to repeat work automatically
- Recognise an infinite loop, escape it, and explain what caused it
- Pick the right tool — branch or loop — for a given problem

## Before you start

- Finish [Session 5](../05-operators-interpolation-final-const/). Today uses its comparison and logical operators in nearly every line.
- Same `dart_practice` project, still no emulator.

---

## The big idea

Here's a small program's output:

```
5
4
3
2
1
Liftoff!
```

Six lines — and there are **not** six `print()` statements behind it. One small piece of code counted down and printed every line itself.

By the end of today you write that exact program, plus something more useful alongside it: code that makes decisions on its own.

Session 4 gave you boxes to hold values. Session 5 gave you ways to compute and compare them. Today those comparisons finally get to *do* something — and you stop typing repetitive code by hand forever.

Two big ideas, both under one umbrella:

- **Branching** — choosing between outcomes
- **Looping** — repeating an action automatically

**These two ideas, combined, are what every program on every computer on Earth is ultimately built from.**

That sounds like a big claim, and it holds up. Every app you've ever used is, underneath, an enormous number of "if this, do that" decisions and "repeat this until done" loops, wired together.

---

## 1. `if` / `else if` / `else`

> **Control flow** — the order your code actually runs in.

Control flow is the general name for anything that changes *which* lines of code run, and in what order — instead of every line running top to bottom, every single time.

> **`if`** — run this code only when a condition is true.

You've seen `if` twice already: Session 4's null check, and a mention in Session 5. Here's the real lesson.

```dart
int score = 82;

if (score >= 90) {
  print('Grade: A');
} else if (score >= 80) {
  print('Grade: B');
} else if (score >= 70) {
  print('Grade: C');
} else {
  print('Grade: F');
}
```

```
Grade: B
```

> **Think of an `if`/`else if`/`else` chain like a bouncer checking IDs at a series of doors.** Each door asks one yes-or-no question. The moment one door says yes, you go through — and every door after that is skipped entirely.

Dart checked `score >= 90` first, got `false`. Moved to `score >= 80`, got `true`, printed "Grade: B", and **never even looked** at the remaining conditions.

### Order matters enormously

**"Why put `>= 80` before `>= 70`?"**

Because conditions are checked top to bottom, and the first `true` one wins. If `>= 70` came first, a score of 82 would stop there — 82 is also `>= 70` — and you'd get a C.

**When ranges overlap, always order from most specific to least specific.** This is the single most common logic bug in beginner `if` chains, and it produces no error at all. The program runs happily and gives you the wrong answer, which is much harder to spot than a crash.

---

## 2. `switch`

> **`switch`** — check one value against a list of exact matches.

`switch` solves a different shape of problem: not ranges, but exact matches against a single value.

```dart
String dayAbbreviation = 'Wed';
String dayName;

switch (dayAbbreviation) {
  case 'Mon':
    dayName = 'Monday';
    break;
  case 'Tue':
    dayName = 'Tuesday';
    break;
  case 'Wed':
    dayName = 'Wednesday';
    break;
  default:
    dayName = 'Unknown';
}

print(dayName);
```

```
Wednesday
```

Three pieces:

| Keyword | What it does |
|---|---|
| `case` | One exact possible value to match against |
| `break` | Stop checking further cases the moment a match is found |
| `default` | Catches anything that matched no listed case — the same job `else` does for `if` |

**Don't forget `break`.** Leave it out and execution can "fall through" into the next case, which is almost never what you want.

### Choosing between them

One clear rule:

| Reach for | When |
|---|---|
| `switch` | You're checking **one single value** against a specific, known list of **exact** options — days of the week, menu choices, status codes |
| `if`/`else` | **Ranges**, combined conditions, or anything using `&&` / `\|\|` |

Today's grade calculator genuinely needed `if`/`else`, because it's about ranges. The day-name lookup genuinely needed `switch`, because it's exact matches on one value.

---

## Try it yourself #1

Write your own `if`/`else if`/`else` chain — anything with **at least three branches**, using a variable and comparison operators from Session 5.

A grade calculator, a temperature description, anything. Run it and confirm the right branch fires.

<details>
<summary><strong>A worked example</strong></summary>

```dart
double temp = 15.0;

if (temp >= 30) {
  print('Hot');
} else if (temp >= 15) {
  print('Mild');
} else if (temp >= 0) {
  print('Cold');
} else {
  print('Freezing');
}
```

Any chain with 3+ branches, ordered correctly — most specific condition first when ranges overlap — and producing exactly **one** printed line, is correct.

If exactly one message printed, and it was the right one for your value, your code just made its first real decision on its own.
</details>

---

## 3. `for` loops

Decisions, done. Now repetition.

> **`for` loop** — repeat something a controlled, counted number of times.

```dart
for (int i = 1; i <= 5; i++) {
  print('Square of $i is ${i * i}');
}
```

```
Square of 1 is 1
Square of 2 is 4
Square of 3 is 9
Square of 4 is 16
Square of 5 is 25
```

> **Loop counter** (also called the iterator variable) — the `i` that starts, checks, and updates itself each time round.

Three parts, separated by semicolons, inside the parentheses:

```dart
for (int i = 1;   i <= 5;   i++) {
//   ↑ start      ↑ check    ↑ update
//   once         before     after
//                every      every
//                repeat     repeat
```

| Part | What it does |
|---|---|
| `int i = 1` | Start here. Runs once, before anything else |
| `i <= 5` | Keep going as long as this stays true. Checked **before** every repeat |
| `i++` | After each repeat, do this — short for "add one to `i`" |

Five lines came out, because `i` was 1, 2, 3, 4, then 5 — and the condition stopped being true the instant `i` would have become 6.

> **A `for` loop is like setting a timer** with a clear start, a clear stop condition, and an automatic step forward each time it rings. You don't manually reset it five separate times.

**"What does `i++` actually mean?"** It's shorthand for `i = i + 1` — add one to `i`, store it back into `i`. You'll see `i++` far more often than the longer version. Both do exactly the same thing.

---

## 4. `while` loops

> **`while` loop** — keep repeating as long as a condition stays true.

Simpler in shape — no three-part setup, just a condition, checked before every repeat.

```dart
int countdown = 5;

while (countdown > 0) {
  print(countdown);
  countdown--;
}

print('Liftoff!');
```

```
5
4
3
2
1
Liftoff!
```

**That's the program from the top of this session, built by you.**

Notice the difference in shape. With `while`, **you manage the counter yourself**: start it *before* the loop, check it in the loop's condition, and change it — `countdown--` — yourself, inside the loop's body.

`countdown--` is the mirror of `i++`: short for `countdown = countdown - 1`.

### The warning

> **Infinite loop** — a loop whose condition never becomes false.

If you forget that `countdown--` line, `countdown` stays 5 forever, `countdown > 0` never becomes false, and **your program never stops.**

We're going to trigger exactly this on purpose in a few minutes, so you know precisely what it looks like and how to escape it.

**"Is there a `do`-`while` loop too?"** Yes:

```dart
do {
  print(n);
  n++;
} while (n < 3);
```

Identical to `while`, except it always runs the body **at least once** before checking the condition — even if the condition starts out false. Less common than `for` and `while`, but worth recognising.

---

## 5. Build it: grade calculator + countdown

Both pieces from today, added properly to your practice file.

```dart
void main() {
  // ... your Session 4-5 code stays above ...

  int score = 82;
  String grade;

  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else {
    grade = 'F';
  }

  print('Score $score earns a grade of $grade.');

  print('Launch sequence starting...');
  int countdown = 5;
  while (countdown > 0) {
    print(countdown);
    countdown--;
  }
  print('Liftoff!');

  print('Squares from 1 to 5:');
  for (int i = 1; i <= 5; i++) {
    print('$i squared is ${i * i}');
  }
}
```

Running it adds this below your bio output:

```
Score 82 earns a grade of B.
Launch sequence starting...
5
4
3
2
1
Liftoff!
Squares from 1 to 5:
1 squared is 1
2 squared is 4
3 squared is 9
4 squared is 16
5 squared is 25
```

One file, now doing five genuinely different jobs: storing data, null-checking, branching on a value, counting down, and repeating a calculation. Everything from Sessions 4 through 6, together, in one program.

**One thing worth noticing:** `String grade;` is declared with no value, and every branch of the `if` chain assigns it one. Dart allows this because it can prove that *some* branch always runs — that's what the final `else` guarantees. Delete the `else` and Dart will refuse to compile, because now there's a path where `grade` never gets a value.

---

## Break it on purpose

Let's trigger the thing you were warned about, deliberately.

In your `while` loop, **delete the `countdown--;` line**:

```dart
int countdown = 5;
while (countdown > 0) {
  print(countdown);
  // countdown--;   <-- deleted
}
```

Run it.

```
5
5
5
5
5
5
5
... forever ...
```

**Look at what's happening.** It's not broken in the sense of showing an error. It's broken in a scarier way: it's running **exactly as written**, forever, because `countdown` never changes and `countdown > 0` never becomes false.

### How to escape

Press <kbd>Ctrl</kbd>+<kbd>C</kbd> in the terminal.

That forcibly stops a program that won't stop itself. It works on any operating system, on any stuck program, and it's worth committing to memory right now.

### The fix, and the habit

Put `countdown--;` back. Run it. Correct again.

The fix is simple once you know what to look for: **something inside the loop has to eventually make the condition false.**

Every `while` loop you write from today forward, ask yourself before running it:

> *"What, inside this loop, is going to change — and will it definitely make the condition false eventually?"*

If you can't answer that clearly, you probably have an infinite loop waiting to happen.

This is the first error in this course that isn't a compile error at all. Sessions 1, 3, 4, and 5 all had Dart stop and tell you something. This one Dart is perfectly happy with. **Now you know the feeling well enough to recognise it instantly and never panic over it.**

---

## Try it yourself #2

Write a `for` loop that prints the numbers 1 through 10, **but only the even ones.**

You'll need an `if` check inside the loop to decide which numbers to print. This combines both halves of today in one small program.

<details>
<summary><strong>Solution</strong></summary>

```dart
for (int i = 1; i <= 10; i++) {
  if (i % 2 == 0) {
    print(i);
  }
}
```

The `%` operator from Session 5 is the key. `i % 2 == 0` is true exactly when `i` divides evenly by 2 — no remainder.

If your output was `2, 4, 6, 8, 10` — five lines, not ten — you just combined branching and looping in the same block of code, which is what real programs do constantly.
</details>

---

## Three things to remember

1. **`if`/`else` picks a branch** by checking conditions top to bottom. First `true` wins; the rest are skipped.
2. **`switch` checks one value** against an exact list of options.
3. **`for` and `while` both repeat** — and every loop needs something inside it that eventually makes its condition false.

---

## Cheat sheet

**if / else if / else:**

```dart
if (score >= 90) {
  print('A');
} else if (score >= 80) {
  print('B');
} else {
  print('F');
}
```

Checked top to bottom. First `true` condition wins; everything after it is skipped.

**switch / case:**

```dart
switch (value) {
  case 'Mon':
    // ...
    break;
  default:
    // ...
}
```

Use for one value checked against a specific, exact list of options. Don't forget `break`.

**for loop:**

```dart
for (int i = 1; i <= 5; i++) {
  print(i);
}
```

Three parts: start once → check before every repeat → update after every repeat.

**while loop:**

```dart
int n = 5;
while (n > 0) {
  print(n);
  n--;
}
```

Simpler shape — you manage the counter yourself. Something inside the loop must eventually make the condition false, or it never stops.

**do-while (rare, but exists):**

```dart
int n = 0;
do {
  print(n);
  n++;
} while (n < 3);
```

Same as `while`, except the body always runs at least once before the condition is checked.

**Escape hatch:** <kbd>Ctrl</kbd>+<kbd>C</kbd> in the terminal stops any program that won't stop itself.

---

## When it goes wrong

| What you'll see | What it actually means | The fix |
|---|---|---|
| Your program runs forever, printing the same thing over and over | An infinite loop — the condition never becomes false | <kbd>Ctrl</kbd>+<kbd>C</kbd> to stop it, then find what should change inside the loop and make sure it actually does |
| The wrong branch fires, but there's no error at all | Your `if` conditions are in the wrong order, and an earlier, broader one is catching the value first | Reorder from most specific to least specific. `>= 90` before `>= 80` before `>= 70` |
| `A value of type 'String' can't be assigned to a variable of type 'int'` inside a switch | A `case` value isn't the same type as the thing being switched on | Make every `case` value match the type of the variable in `switch (...)` |
| More than one case's code runs when you expected only one | Missing `break` — execution fell through into the next case | Add `break;` at the end of each case block |
| `The non-nullable local variable 'grade' must be assigned before it can be used` | You declared a variable with no value, and Dart found a path where nothing assigns it | Add a final `else` so every possible path assigns a value — or give the variable a starting value when you declare it |

---

## Homework

**Estimated time: 25 minutes.**

Add one more `if`/`else` chain and one more loop — `for` or `while`, your choice — to your practice file. Any topic you like.

**You're done when:**

- [ ] The new `if`/`else` chain has at least 2 branches and uses a comparison or logical operator from Session 5
- [ ] The new loop runs a controlled, **finite** number of times — no infinite loops left in the file
- [ ] `dart run` completes cleanly, with all previous sessions' code still present and working

**Why this matters:** Session 7 turns loose code like this into reusable **functions**. The more comfortable this branching-and-looping shape feels now, the more natural it'll be to see it packaged into something callable next session.

### Stretch goal

Rewrite today's `for`-loop squares table as a `do`-`while` loop instead.

Notice you have to declare and initialise the counter *before* the loop, same as `while`. Then try setting the starting condition to something that would skip a `while` loop entirely — and watch the `do`-`while` run its body once anyway. That's the whole difference between them, seen rather than memorised.

---

## Check yourself

1. **In an if/else if/else chain, what happens once one condition is found true?**
   a) All remaining conditions are still checked
   b) The program crashes
   c) The matching branch runs, and every condition after it is skipped
   d) Nothing happens

2. **When is `switch` a better fit than `if`/`else`?**
   a) When checking a range of values
   b) When checking one value against a specific, exact list of options
   c) Never — they're interchangeable
   d) Only for numbers

3. **In `for (int i = 1; i <= 5; i++)`, what does the middle part do?**
   a) Sets the starting value
   b) Checked before every repeat — the loop continues only while this is true
   c) Runs after every repeat
   d) Declares the loop's name

4. **What causes an infinite loop?**
   a) Using `for` instead of `while`
   b) The loop's condition never becomes false
   c) Forgetting a `print()` statement
   d) Using `break` inside `switch`

5. **How do you forcibly stop a program stuck in an infinite loop?**
   a) Close and reopen your computer
   b) Wait for it to finish on its own
   c) <kbd>Ctrl</kbd>+<kbd>C</kbd> in the terminal
   d) Delete the file while it's running

<details>
<summary><strong>Answers</strong></summary>

1. **c** — Conditions are checked top to bottom; the first `true` one runs, and the rest are skipped entirely.
2. **b** — `switch` shines when checking a single value against a known, exact list of possibilities.
3. **b** — The middle part is the condition, checked before every repeat. The loop stops the moment it's false.
4. **b** — An infinite loop happens when nothing inside the loop ever makes its condition false.
5. **c** — <kbd>Ctrl</kbd>+<kbd>C</kbd> forcibly stops a running program on any operating system.
</details>

---

## New words from this session

`control flow` · `if` / `else if` / `else` · `switch` / `case` / `default` / `break` · `for` loop · `loop counter` · `while` loop · `infinite loop`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Next up

**Session 7 — Functions, Parameters, Arrow Syntax**

Everything you wrote today lives loose inside `main()`, in one long list. That works at this size and stops working fast.

Next session you learn to package logic into **functions** — named, reusable blocks you can call from anywhere, as many times as you like, with different inputs each time. It's the moment your code stops being a script and starts being software.

---

[← Session 5](../05-operators-interpolation-final-const/) · [Course home](../../README.md) · [Glossary](../../glossary.md)
