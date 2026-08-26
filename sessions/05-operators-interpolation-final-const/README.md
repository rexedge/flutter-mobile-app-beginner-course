# Session 5 — Operators, String Interpolation, `final` vs `const`

**Module 1 — Dart From Zero** · Session 5 of 36 · about 18 minutes to read
**Code for this session:** [`code/starter/dart_practice`](code/starter/dart_practice) → [`code/final/dart_practice`](code/final/dart_practice)

---

## What you'll be able to do by the end

- Do real maths in Dart with `+ - * / ~/ %`
- Ask true/false questions with `== != < > <= >=`, and combine them with `&& || !`
- Weave variables straight into readable sentences with string interpolation
- Choose correctly between `var`, `final`, and `const` for any value you declare
- Read and fix the error you get from reassigning a `final`

## Before you start

- Finish [Session 4](../04-variables-types-null-safety/).
- **No new project today.** Open the same `dart_practice` project from Session 4 and keep editing that file. No emulator, same as last time.

**"Why not start fresh?"** Because real projects work this way. You'll spend far more of your career editing existing files than starting blank ones, and getting comfortable reopening yesterday's work is its own skill.

---

## The big idea

Remember the four separate `print()` lines from the end of Session 4? Add this below them:

```dart
print('$name is $age years old and ${height}m tall.');
```

Run it:

```
Rex is 34 years old and 1.8m tall.
```

**That.** One line, three variables, a real sentence. You got ten seconds of it last session and were told to wait. Today you get the whole trick, plus the rest of the toolkit that makes it possible.

Session 4 gave you boxes to hold values in. Those boxes were quiet, though — you could only really print what you put in them. Three things change that today:

1. **Operators** — so you can compute new values from old ones
2. **String interpolation** — so you can weave variables into real sentences
3. **`final` and `const`** — two new ways to lock a value down on purpose

---

## 1. Operators

> **Operator** — a symbol that does something with values.

An operator takes one or more values and produces a new one. You've already used exactly one without it being named: the `=` that assigns a value to a variable.

### Arithmetic operators

Six symbols, and five of them you know from school. Add these to your file:

```dart
int a = 10;
int b = 3;

print(a + b);   // 13
print(a - b);   // 7
print(a * b);   // 30
print(a / b);   // 3.3333333333333335
```

Plus, minus, times — exactly what you expect.

**Division is where Dart gets particular.** `/` always gives you a `double`, even when dividing two whole numbers, because the honest answer might have a remainder.

Two you haven't seen before:

```dart
print(a ~/ b);  // 3
print(a % b);   // 1
```

| Operator | What it does |
|---|---|
| `~/` | **Truncating division** — divides and throws away everything after the decimal point, giving you a whole `int` back |
| `%` | **Modulo** — gives you exactly what's left over |

Ten divided by three, truncated, is three — with one left over. Both lines just proved it.

These two look obscure but they're everywhere in real apps: splitting a list into pages, working out change, checking whether a number is even.

### Comparison operators

> **Comparison operators** — ask a true/false question about two values.

These don't compute a new number. They ask a yes-or-no question and hand back a `bool`.

```dart
print(a == b);  // false
print(a != b);  // true
print(a > b);   // true
print(a < b);   // false
print(a >= 10); // true
print(a <= 10); // true
```

> **Think of them like a scale at the doctor's office.** You're not creating a new number — you're asking a question, and the only two possible answers are `true` or `false`.

**"Why two equals signs, `==`, instead of one?"** Because a single `=` already has a job: assigning a value. Dart needed a different symbol to ask "are these equal?" without confusing the two.

This mix-up is one of the most common early mistakes in nearly every programming language, not just Dart. You're not the first person it trips up and you won't be the last.

### Logical operators

> **Logical operators** — combine or flip true/false values.

Three more, for combining `bool` values:

```dart
bool isAdult = age >= 18;
bool hasID = true;

print(isAdult && hasID);   // true  — both must be true
print(isAdult || hasID);   // true  — at least one must be true
print(!isAdult);           // false — flips true to false, and back
```

| Operator | Meaning |
|---|---|
| `&&` | **and** — both sides have to be true |
| `\|\|` | **or** — at least one side has to be true |
| `!` | **not** — flips a `bool` to its opposite |

**We're not using these to make decisions yet.** That's Session 6, in full. Today, just know they exist and know what they produce.

---

## Try it yourself #1

In your own file, write and print:

- **three arithmetic expressions** using variables from your own bio script
- **two comparison expressions** that produce `true` or `false`

Run all five.

<details>
<summary><strong>A worked example</strong></summary>

Using `age = 27` and `height = 1.65`:

```dart
print(age * 2);          // 54
print(age + 10);         // 37
print(height / 2);       // 0.825
print(age > 18);         // true
print(height == 1.65);   // true
```

Any five expressions that compile and print sensible results are correct. There's no single right answer here — only correct operator usage.

If five real computed results just printed using your own values, that's five working expressions of actual logic. Not copied — computed.
</details>

---

## 2. String interpolation

Back to the trick from the top, now for real.

> **String interpolation** — drop a variable straight into a string with `$`.

Instead of gluing text and variables together awkwardly, you put a dollar sign right in front of a variable name, inside the string:

```dart
print('$name is $age years old.');
```

```
Rex is 34 years old.
```

One line, readable exactly like a normal sentence.

### When you need the curly braces

For anything more complex than a single variable — doing maths inline, or accessing something with a dot — wrap it in curly braces after the dollar sign:

```dart
print('In five years, ${name} will be ${age + 5}.');
```

```
In five years, Rex will be 39.
```

See the difference? `$age` alone works because it's just a variable name. `${age + 5}` needs the braces because it's doing maths right there inside the string — Dart needs to know where the expression starts and ends.

**"Do I always need the curly braces?"** Only when there's more than a bare variable name inside: a calculation, a method call, anything with extra symbols. A plain `$name` is completely fine, and it's what you'll type most often.

---

## 3. `var` vs `final` vs `const`

Less about syntax, more about a promise you make on purpose.

> **`final`** — set once, then locked. But it can wait until the program runs to know its value.

A `final` variable can be assigned exactly once. After that first assignment, it's locked.

```dart
final birthYear = 2026 - age;
print(birthYear);
```

Notice this value depends on `age` — something only known once the program is actually running. `final` is fine with that. It just means: **after this one assignment, never again.**

> **`const`** — locked, *and* its value must be known before the program even runs.

`const` is stricter. A `const` value must be fully knowable at compile time — not computed from something that only exists while the program is running.

```dart
const appVersion = '1.0.0';
print(appVersion);
```

Now try this and watch it fail:

```dart
const birthYear = 2026 - age;
```

```
Error: Const variables must be initialized with a constant value.
```

`age` isn't fixed like that — it came from a variable you set yourself, so Dart won't allow it as `const`.

> **Immutability** — can't be changed after it's created.

Both `final` and `const` create immutable variables. Only `const` additionally demands the value be fixed and knowable before the program even starts.

> **Think of `const` like a fact printed on a birth certificate** — fixed and known the moment it's created, permanently. **Think of `final` like a wedding ring going on for the first time** — locked in place after that one moment, but the exact moment it happens can depend on real, live circumstances.

### The rule

| | Can it change later? | When must the value be known? |
|---|---|---|
| `var` | Yes | Whenever |
| `final` | No — set once | At runtime (can depend on other variables) |
| `const` | No — set once | Before the program even runs (fixed value) |

**The test that actually works, every time:** ask yourself *"do I know this value right now, while I'm typing it, with zero computation needed?"*

- Yes → `const`
- No, but it's only ever set once → `final`
- It genuinely needs to change later → `var`

That one question solves it more reliably than memorising rules. And it's worth saying: `final` versus `const` trips up developers well past their first year. It's a genuinely subtle distinction, not a beginner's blind spot.

---

## 4. Build it: rewriting your bio script

Take everything from Session 4 and make it genuinely good, using everything from today.

```dart
void main() {
  const appVersion = '1.0.0';

  String name = 'Rex';
  int age = 34;
  double height = 1.8;
  bool isLearningFlutter = true;
  String? middleName = null;

  final birthYear = 2026 - age;
  final heightInCm = height * 100;

  print('Bio Script v$appVersion');
  print(
    '$name is $age years old and ${height}m tall '
    '(${heightInCm.toStringAsFixed(0)}cm).',
  );
  print('Born around $birthYear.');
  print('Learning Flutter: $isLearningFlutter');

  if (middleName == null) {
    print('No middle name on file.');
  } else {
    print('Middle name: $middleName');
  }
}
```

Run it:

```
Bio Script v1.0.0
Rex is 34 years old and 1.8m tall (180cm).
Born around 1992.
Learning Flutter: true
No middle name on file.
```

Compare that to Session 4's version for a second. Five separate, plain `print()` calls turned into readable sentences. One computed value that couldn't have existed without operators. And a `const` right at the top declaring something that will never, ever change.

**"What's `.toStringAsFixed(0)` doing?"** A small preview, not a lesson. It's a method that rounds a `double` to a given number of decimal places — here, zero. You'll meet methods properly around Session 9. For now, know it turns `180.0` into `'180'` cleanly.

**"Why is that one `print()` split across several lines?"** Two strings sitting next to each other with nothing between them get joined into one automatically. It's purely for keeping long lines readable — the output is identical either way.

---

## Break it on purpose

Let's break the lock, deliberately.

Right below `final birthYear = 2026 - age;`, add a second assignment:

```dart
birthYear = 1990;
```

Run it:

```
Error: The final variable 'birthYear' can only be set once.
```

Read it carefully — it isn't cryptic. It's telling you exactly what you did: you promised, back when you wrote `final`, that this value would be set exactly once. Then you tried to set it again.

**This is a different flavour of error from anything so far in this course.** Not a typo, not a missing bracket, not a null-safety violation. This is Dart holding you to a promise *you made yourself*, a few lines earlier.

**The fix isn't to remove `final`.** That would quietly let the bug back in later. The fix is recognising you didn't actually need to change it — you just typed a second assignment you didn't mean to write. Delete it, done.

---

## Try it yourself #2

Add your own `const` value and your own `final` value computed from one of your existing variables.

Then, just once, deliberately try to reassign the `final` one and watch the error appear. Then delete that line and move on.

<details>
<summary><strong>A worked example</strong></summary>

```dart
const maxScore = 100;
final nextBirthday = 2026 - age + 1;

print(maxScore);
print(nextBirthday);

// nextBirthday = 2030;   // uncommenting this triggers:
// "The final variable 'nextBirthday' can only be set once."
```

If you saw that exact error message and then removed the reassignment line, you've completed the challenge correctly.
</details>

---

## Three things to remember

1. **Operators compute and compare.** Arithmetic gives new values; comparison and logical operators give you `bool`s.
2. **String interpolation** replaces scattered `print()` calls with real sentences, using `$` and `${}`.
3. **`final` locks after one runtime assignment. `const` must be known before the program even starts.**

---

## Cheat sheet

**Arithmetic operators** (with `a = 10`, `b = 3`):

| Operator | Meaning | Result |
|---|---|---|
| `+` | Add | `13` |
| `-` | Subtract | `7` |
| `*` | Multiply | `30` |
| `/` | Divide — always returns `double` | `3.333...` |
| `~/` | Divide, truncate to whole number | `3` |
| `%` | Remainder | `1` |

**Comparison operators** (produce `bool`): `==` `!=` `<` `>` `<=` `>=`

**Logical operators** (combine `bool`s): `&&` (and) · `||` (or) · `!` (not)

**String interpolation:**

```dart
print('$name is $age years old.');    // bare variable
print('Next year: ${age + 1}.');      // expression — needs { }
```

**Choosing `var` vs `final` vs `const`:**

| | Can it change later? | When must the value be known? |
|---|---|---|
| `var` | Yes | Whenever |
| `final` | No — set once | At runtime (can depend on other variables) |
| `const` | No — set once | Before the program even runs |

Quick test: *"Do I know this value right now, with zero computation needed?"* Yes → `const`. No, but it's only set once → `final`. Might change later → `var`.

---

## When it goes wrong

| What you'll see | What it actually means | The fix |
|---|---|---|
| `The final variable 'x' can only be set once.` | You tried to assign a new value to a variable already declared `final` | Remove the second assignment — or use `var` instead, if it genuinely needs to change |
| `Const variables must be initialized with a constant value.` | You declared something `const` using a value that isn't known until the program runs, like another variable | Use `final` instead, if the value depends on something computed at runtime |
| A string prints literally as `$name` instead of the value | Either the `$` is missing, or the variable name doesn't match exactly | Check the `$` is there and the name is spelled and capitalised exactly as declared |
| `Undefined name 'x'` inside a string | You interpolated a variable that doesn't exist in this scope — often a typo, or a variable declared after the `print()` | Declare the variable above the line that uses it, and check the spelling |

---

## Homework

**Estimated time: 25 minutes.**

Rewrite **every** `print()` line in your bio script using string interpolation. Add one more `final` value computed from something you already have, and one more `const` value.

**You're done when:**

- [ ] No `print()` call in the file uses separate arguments or glued-together strings — all use `$variable` or `${expression}`
- [ ] At least one new `final` value, computed using an arithmetic operator on an existing variable
- [ ] At least one new `const` value, with a fixed value known at write-time
- [ ] `dart run` completes without any red error text

**Why this matters:** Session 6 uses comparison and logical operators inside real decisions. The more automatic these feel now, the less friction next session.

### Stretch goal

Add a line using `~/` and a line using `%` on two of your own numeric variables, and interpolate both results into a single sentence. For example:

```dart
print('Splitting $totalItems into groups of $groupSize gives '
      '${totalItems ~/ groupSize} full groups with '
      '${totalItems % groupSize} left over.');
```

That's the exact pattern real apps use for things like pagination and splitting bills.

---

## Check yourself

1. **What does `10 / 3` return in Dart?**
   a) `3`
   b) `3.3333333333333335`
   c) `1`
   d) An error

2. **What does `10 % 3` return?**
   a) `3`
   b) `3.33`
   c) `1`
   d) `0`

3. **Which is correct string interpolation for a bare variable named `score`?**
   a) `print('Score: ' + score);`
   b) `print('Score: $score');`
   c) `print('Score: %score%');`
   d) `print('Score: {score}');`

4. **When must you use `${}` instead of just `$`?**
   a) Never, they're identical
   b) When you're interpolating more than a bare variable name, like an expression
   c) Only with `int` values
   d) Only inside `print()`

5. **You want a value that's fixed and known before your program even runs. Which keyword?**
   a) `var`
   b) `final`
   c) `const`
   d) Any of the three work identically

<details>
<summary><strong>Answers</strong></summary>

1. **b** — `/` always returns a `double` in Dart, even when dividing two whole numbers.
2. **c** — `%` returns the remainder: 10 divided by 3 is 3, with 1 left over.
3. **b** — `$score` drops a bare variable directly into a string.
4. **b** — `${}` is required for anything beyond a plain variable name, like `${age + 1}`.
5. **c** — `const` requires the value to be fully known at compile time, before the program runs. `final` only requires it be set once, but can wait until runtime.
</details>

---

## New words from this session

`operator` · `arithmetic operators (+ - * / ~/ %)` · `comparison operators (== != < > <= >=)` · `logical operators (&& || !)` · `string interpolation` · `final` · `const` · `immutability`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Next up

**[Session 6 — Control Flow: if/else, switch, loops](../06-control-flow/)**

Next session is where today's comparison and logical operators finally get to *do* something: make real decisions. `if`, `else`, `switch`, and loops that repeat work for you instead of you typing it five times.

You've seen a tiny preview of `if` twice now. Session 6 is the real thing, in full.

---

[← Session 4](../04-variables-types-null-safety/) · [Course home](../../README.md) · [Glossary](../../glossary.md) · [Session 6 →](../06-control-flow/)
