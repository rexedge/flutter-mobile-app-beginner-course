# Coursework 04 — Variables, Types, Null Safety

**Covers:** [Session 4 — Variables, Data Types, Null Safety](../../sessions/04-variables-types-null-safety/) · **16 exercises** · about 1.5 hours
**Solutions:** [solutions/04-variables-types-null-safety.md](solutions/04-variables-types-null-safety.md)

Work in your `coursework` project — one file per exercise, as described in the [workbook guide](README.md#setting-up-sessions-4-to-7). For exercise 4.1, that's `bin/ex_4_1.dart`, run with `dart run bin/ex_4_1.dart`.

**Only use what Session 4 taught.** That means `print()` with one value at a time. Combining text and variables in one line (`'$name is...'`) is Session 5 — hold off until then.

---

## Warm-up ★

### 4.1 ★ Your favourite film

**Write.** Declare four variables describing a film you like, each with its type written out in full:

- its title
- the year it came out
- your rating out of 10 (it can have a decimal point, like 8.5)
- whether you've seen it more than once

Print each one on its own line.

---

### 4.2 ★ Pick the type

**Explain.** Which of the four core types — `String`, `int`, `double`, `bool` — does each value belong to?

| | Value |
|---|---|
| 1 | `'Lagos'` |
| 2 | `42` |
| 3 | `3.14` |
| 4 | `false` |
| 5 | `'42'` |
| 6 | `42.0` |
| 7 | `'false'` |
| 8 | `-7` |
| 9 | `0.5` |
| 10 | `''` |

Three of these are traps. Look carefully at the quotes and the decimal points.

---

### 4.3 ★ Predict the output

**Predict.** Write down exactly what this prints, line by line, **before** you run it.

```dart
void main() {
  String city = 'Abuja';
  int population = 3800000;
  double temperature = 30.0;
  double distance = 2.50;
  bool isCapital = true;

  print(city);
  print(population);
  print(temperature);
  print(distance);
  print(isCapital);
}
```

Now run it. Did any line surprise you?

---

### 4.4 ★ From var to explicit

**Write.** Rewrite these four lines so each one states its type instead of using `var`. Keep the same names and values.

```dart
var greeting = 'Hello';
var daysInWeek = 7;
var shoeSize = 7.5;
var isRaining = false;
```

---

## Practice ★★

### 4.5 ★★ Error or fine?

**Predict.** For each line on its own, decide: does Dart **accept** it, or **refuse** it?

For the ones Dart accepts, also predict what `print()` would show for that variable.

| | Line |
|---|---|
| a | `int count = 5.0;` |
| b | `double price = 5;` |
| c | `String code = 404;` |
| d | `bool isOpen = 'true';` |
| e | `String? note = null;` |
| f | `int? level = null;` |
| g | `double? weight = 72;` |
| h | `bool done = null;` |

Then test your predictions — one line at a time, in a file with a `print()` after it. At least one of these will surprise you.

---

### 4.6 ★★ Fix it: age

**Fix.** This won't run. What's wrong, and how do you fix it?

```dart
void main() {
  int age = '25';
  print(age);
}
```

---

### 4.7 ★★ Fix it, two different ways

**Fix.** This won't run either.

```dart
void main() {
  String nickname = null;
  print(nickname);
}
```

There are **two** different correct fixes, and they mean different things. Write both, and explain when you'd choose each one.

---

### 4.8 ★★ Fix it: the type that got locked

**Fix.** What's wrong here, and how would you fix it?

```dart
void main() {
  var score = 10;
  score = 'ten';
  print(score);
}
```

What does this tell you about what `var` actually does?

---

### 4.9 ★★ Fix it: almost the same name

**Fix.**

```dart
void main() {
  String firstName = 'Ada';
  print(firstname);
}
```

What error do you get? What does it tell you about how Dart treats names?

---

### 4.10 ★★ Things change

**Predict.**

```dart
void main() {
  var level = 1;
  level = 2;
  level = 3;
  print(level);

  String greeting = 'Hi';
  greeting = 'Hello';
  print(greeting);
}
```

How many lines does it print, and what are they? Why?

---

### 4.11 ★★ Nullable or not?

**Explain.** You're designing the variables for a contact form. For each field, decide whether it should be **nullable** (`String?`, `int?`) or **non-nullable** (`String`, `int`). Give a one-line reason for each.

1. First name
2. Surname
3. Middle name
4. Phone number
5. Email address
6. Nickname
7. Age
8. Company name

Some of these are judgement calls. The reason matters more than the answer.

---

### 4.12 ★★ A variable with nothing in it

**Predict.** This declares variables with no value at all. Will it run? If so, what does it print?

```dart
void main() {
  int? highScore;
  String? favouriteColour;
  print(highScore);
  print(favouriteColour);
}
```

Now try removing the `?` from `int? highScore;` and see what Dart says when you try to print it.

---

## Challenge ★★★

### 4.13 ★★★ Four bugs

**Fix.** This program has **four** separate mistakes. Find all four, explain each one, and fix them.

```dart
void main() {
  String name = 'Tunde'
  int age = 29.5;
  bool isStudent = 'yes';
  String? email;
  print(Name);
  print(age);
  print(isStudent);
  print(email);
}
```

When you run it, pay attention to the **order** Dart lists the errors in. Is it the same order as the lines?

---

### 4.14 ★★★ Pet profile

**Write.** Build a profile for a pet — real or invented — with **eight** variables:

- its name, and its species (both text)
- its age in years (a whole number)
- its weight in kilograms (can have a decimal point)
- whether it's vaccinated
- how many vet visits it's had this year
- its microchip ID — which it **doesn't have yet**
- its favourite toy — which it **does** have, but that might not be true for every pet

Print all eight, one per line.

Then, below that, pretend a year has passed: change its age, give it a microchip ID, and print just those two again.

---

### 4.15 ★★★ Zero, empty, or nothing?

**Explain.** These three look like they all mean "nothing". They don't.

```dart
int items = 0;
String message = '';
String? reply = null;
```

Explain the difference between them in your own words. Then give a real-world example where each one would be the *correct* choice — for instance, an app where `0` is right and `null` would be wrong.

---

### 4.16 ★★★ Why null safety?

**Explain.** A friend who codes in an older language says: *"Null safety is just Dart being fussy. It slows me down."*

Write three or four sentences explaining to them why it exists and what problem it actually solves. Mention *when* Dart catches the problem.

---

## Done?

- [ ] Every exercise attempted
- [ ] Every **Predict** answer written down *before* running
- [ ] Every **Fix** exercise explains *why*, not just what you changed
- [ ] You checked your answers against the [solutions](solutions/04-variables-types-null-safety.md)
