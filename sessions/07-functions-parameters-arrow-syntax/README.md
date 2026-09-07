# Session 7 — Functions, Parameters, Arrow Syntax

**Module 1 — Dart From Zero** · Session 7 of 36 · about 18 minutes to read
**Code for this session:** [`code/starter/dart_practice`](code/starter/dart_practice) → [`code/final/dart_practice`](code/final/dart_practice)

---

## What you'll be able to do by the end

- Define a function with a return type, a name, and typed parameters — and call it
- Tell a `void` function apart from one that returns a value, and know which you need
- Use positional parameters, named parameters with default values, and `required` named parameters
- Write one-line functions with arrow syntax (`=>`)
- Take the loose code from Session 6 and repackage all of it into functions you can call by name

## Before you start

- Finish [Session 6](../06-control-flow/). Today rebuilds the exact code you wrote there — the grade calculator, the countdown, the squares table.
- Same `dart_practice` project. Still no emulator.

---

## The big idea

Here's the grade calculator you wrote last session:

```dart
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
```

Twelve lines of real logic. And it grades exactly one score: 82.

Want to grade a second score? Right now your only option is to copy all twelve lines, paste them below, and change the number. Want a third? Copy them again. Want to fix a bug in the logic later? Now you have to find and fix it in three places, correctly, every time.

Today you learn the escape from that, and it looks like this:

```dart
print(calculateGrade(82));
print(calculateGrade(95));
print(calculateGrade(61));
```

```
B
A
F
```

Same logic. Three different scores. Zero copy-pasting — and if the logic ever needs fixing, there's exactly one place to fix it.

That's the whole session. It is one of the biggest levers you will ever pull as a programmer, and you pull it today.

---

## 1. What a function actually is

> **Function** — a named, reusable block of code you write once and can run as many times as you want.

You've been calling functions since Session 1 without anyone naming them. `print()` is a function — somebody else wrote the code that puts text on your screen, and you just call it by name. `main()` is a function too: it's the one Dart calls for you when your program starts.

Today you stop only calling other people's functions and start writing your own.

**The analogy:** a function is a recipe card. You write the recipe down once. Every time you want the dish, you don't rewrite the recipe from scratch — you pull out the card and follow it again, maybe with slightly different ingredients this time.

Here is the whole grade calculator as a function, with every part labelled:

```dart
String calculateGrade(int score) {
//  ↑         ↑          ↑
//  |         |          └── parameter: a typed input this function expects
//  |         └── name: what you'll call it by
//  └── return type: the kind of value this function promises to hand back

  if (score >= 90) {
    return 'A';       // ← return statement: sends this value back to the caller
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else {
    return 'F';
  }
}
```

Four pieces, always in that order: **return type**, **name**, **parameters in parentheses**, **body in braces**.

### Parameter vs argument

These two words get mixed up constantly, and the difference is genuinely simple once you see both halves side by side.

```dart
String calculateGrade(int score) { ... }
//                    ^^^^^^^^^  the PARAMETER — a named placeholder in the definition

calculateGrade(82);
//             ^^   the ARGUMENT — the real value you hand over for this one call
```

> **Parameter** — the named, typed input listed in the function's definition.
> **Argument** — the actual value you pass in when you call it.

The parameter `score` is a promise: "give me an `int` and I'll call it `score` while I work." The argument `82` is you keeping that promise for one particular call. Next call, the same parameter holds `95` instead.

### `return` does two things

This is the part that trips people up, so it's worth being blunt about it.

`return 'B';` sends `'B'` back to whoever called the function — **and immediately ends the function**. Nothing after it runs. That's why the version above doesn't need the `String grade;` variable from Session 6 any more: each branch hands its answer straight back and stops.

```dart
String demo() {
  return 'first';
  print('this line never runs');  // Dart will warn you: dead code
}
```

### Where functions go in your file

Top level, outside `main()`, conventionally above it:

```
bin/dart_practice.dart
├── calculateGrade()   ← your functions
├── runCountdown()
├── printSquares()
└── main()             ← last, as a short summary of what the program does
```

Dart doesn't strictly require this — a function defined *below* `main()` still works, and Dart even allows a function nested inside another function. But keeping your functions above `main()` and `main()` last means anyone opening the file reads "what this program does" as a short list at the bottom, with the details above.

---

## 2. `void` — functions that don't hand anything back

Not every function has an answer to give you. Some just *do* something.

```dart
void sayHello(String name) {
  print('Hello, $name!');
}

sayHello('Rex');
```

```
Hello, Rex!
```

> **`void`** — a return type meaning "this function hands nothing back, and that's intentional."

`sayHello` is genuinely useful — it prints. But it doesn't produce a value you could store or reuse. There's nothing to `return`.

**How do you know which one you need?** Ask one question: *after calling this, do I need to use a result somewhere else?*

- **Yes** — store it in a variable, print it, do maths on it → give it a real return type (`String`, `int`, `bool`…).
- **No** — its whole job is to do the thing → `void`.

`calculateGrade` returns `String`, because you want the grade to use. `printSquares` will be `void`, because printing *is* the job.

One consequence worth knowing now: you can't use a `void` function's result, because there isn't one.

```dart
String result = sayHello('Rex');   // error — sayHello returns nothing
```

---

## Try it yourself #1

Write two functions in your practice file, above `main()`:

1. One `void` function that prints something.
2. One function that returns a value.

Then call each of them **twice**, with different arguments each time.

<details>
<summary><strong>A worked solution</strong></summary>

```dart
void printBanner(String title) {
  print('=== $title ===');
}

int doubleIt(int n) {
  return n * 2;
}

void main() {
  printBanner('Session 7');
  printBanner('Functions');

  print(doubleIt(5));
  print(doubleIt(21));
}
```

```
=== Session 7 ===
=== Functions ===
10
42
```

Notice the difference at the call site: `printBanner(...)` stands alone as its own statement, because there's no value coming back. `doubleIt(...)` has to sit inside something — here, inside `print()` — because it produces a value that needs somewhere to go.
</details>

If two different functions ran, each more than once, with different inputs — you've written reusable code. This is no longer a one-off script.

---

## 3. Positional parameters

Every parameter you've written so far is a **positional** parameter: required, and matched purely by order.

```dart
int add(int a, int b) {
  return a + b;
}

print(add(3, 4));    // 7
```

`3` fills `a` and `4` fills `b`, entirely because of where they sit. Dart doesn't know or care what you *meant* — first argument goes to the first parameter, second to the second.

With `add` that's harmless, since `3 + 4` and `4 + 3` are the same. With most functions it isn't:

```dart
int subtract(int a, int b) {
  return a - b;
}

print(subtract(10, 3));   // 7
print(subtract(3, 10));   // -7  — no error, just wrong
```

Positional parameters are also all **required**. Leave one out and Dart refuses to compile — you'll see that for yourself in the break-it drill below.

---

## 4. Named parameters

Wrap your parameters in curly braces and something changes: they're passed **by name** at the call site instead of by position, and they can have default values.

```dart
String greet({String greeting = 'Hello', required String name}) {
  return '$greeting, $name!';
}

print(greet(name: 'Rex'));
print(greet(name: 'Rex', greeting: 'Welcome back'));
```

```
Hello, Rex!
Welcome back, Rex!
```

Two different kinds of named parameter are in play there:

> **Optional named parameter** — `{String greeting = 'Hello'}`. It has a default, so callers may skip it. Skipping it uses `'Hello'`.
>
> **Required named parameter** — `{required String name}`. No default, marked `required`, so callers must supply it — but still by name.

The rule is simple: a named parameter needs **either** a default value **or** the `required` keyword. Dart won't accept one with neither, because it would have no idea what to put there when a caller leaves it out.

Since they're matched by name, order at the call site is entirely up to you — `greet(greeting: 'Hi', name: 'Rex')` works exactly the same.

**The analogy:** named parameters are ordering coffee by describing it. "Oat milk, extra shot" makes sense in any order, and the barista fills in "regular size" because you didn't say otherwise. Positional parameters are a strict paper form where field one must always come first.

**Which should you use?** Positional for a small number of parameters where the order is obvious — `add(a, b)`, `square(x)`. Named once you have three or more, or whenever someone reading the call site couldn't guess what a value means. Compare:

```dart
createUser('Rex', 34, true, false);
createUser(name: 'Rex', age: 34, isActive: true, isAdmin: false);
```

Both are valid Dart. Only one of them can be read six months from now. You'll see Flutter itself lean heavily on named parameters starting in Module 2 — this is why.

---

## 5. Arrow syntax

When a function's entire body is a single expression being returned, Dart offers a shorthand.

```dart
int square(int x) => x * x;

print(square(5));    // 25
```

> **Arrow syntax (`=>`)** — shorthand for a function body that is one expression. `=> expression` means exactly `{ return expression; }`.

These two are the same function, written two ways:

```dart
int square(int x) => x * x;
int square(int x) { return x * x; }
```

No braces, no `return` keyword — the arrow implies it.

**The limit:** one expression. The moment your body needs a second statement, an `if` statement, or a loop, go back to curly braces. `calculateGrade` can't use arrow syntax, because its body is a whole `if`/`else if`/`else` chain.

A `void` function can use an arrow too, as long as it's a single call:

```dart
void sayHi() => print('Hi!');
```

---

## 6. Build it: refactor everything

Time to do to your whole practice file what you did to the grade calculator at the top.

Open `bin/dart_practice.dart`. Above `main()`, add three functions:

```dart
String calculateGrade(int score) {
  if (score >= 90) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else {
    return 'F';
  }
}

void runCountdown(int from) {
  int countdown = from;
  while (countdown > 0) {
    print(countdown);
    countdown--;
  }
  print('Liftoff!');
}

void printSquares(int upTo) {
  for (int i = 1; i <= upTo; i++) {
    print('$i squared is ${i * i}');
  }
}
```

Look at what each one took as a parameter. Session 6's countdown always started at 5 because `5` was typed directly into it. Now the starting number arrives as `from`, so the same function counts down from anything. Same with `printSquares` and its `upTo`.

Now delete the loose Session 6 code from inside `main()` — the `if`/`else` chain, the `while` loop, the `for` loop — and replace all of it with calls:

```dart
void main() {
  // ... all your Session 4-5 variable code stays exactly as it is ...

  print('Score 82 earns a grade of ${calculateGrade(82)}.');
  print('Score 95 earns a grade of ${calculateGrade(95)}.');

  print('Launch sequence starting...');
  runCountdown(5);

  print('Squares from 1 to 5:');
  printSquares(5);
}
```

Notice `${calculateGrade(82)}` inside the string. Session 5 taught you that `${...}` runs an expression and drops the result into the text — a function call is an expression, so it works there like anything else.

Run it:

```
dart run
```

```
Bio Script v1.0.0
Rex is 34 years old and 1.8m tall (180cm).
Born around 1992.
Learning Flutter: true
No middle name on file.
Score 82 earns a grade of B.
Score 95 earns a grade of A.
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

Almost identical to Session 6's output — one extra grade line, and that's the point. Adding a second graded score cost you one line instead of twelve. `runCountdown` now works from any number, `printSquares` up to any limit, and `calculateGrade` will check as many scores as you ever want without you touching its logic again.

The refactor changed *how the code is organised*, not what it does. That's what a refactor is.

---

## Break it on purpose

Functions are a contract: the definition states exactly what it needs, and Dart enforces it at every call. Let's violate the contract on purpose, twice.

**First, give it too little.** Change `runCountdown(5);` to:

```dart
runCountdown();
```

```
dart run
```

```
Error: Too few positional arguments: 1 required, 0 given.
  runCountdown();
  ^
```

Read it literally: `runCountdown` requires one positional argument, and it got zero.

**Now the other direction.** Change it to:

```dart
runCountdown(5, 10);
```

```
Error: Too many positional arguments: 1 allowed, but 2 found.
  runCountdown(5, 10);
              ^
```

Same contract, opposite failure. Dart checks calls against definitions exactly as strictly as it checks types.

Put it back to `runCountdown(5);` and confirm it runs clean.

### The fix, and the habit

The fix is the same move every time: **go back to the function's definition, count exactly what it asks for, and match the call to it.**

This will be one of the most common errors you hit for the rest of the course — and one of the friendliest, because Dart tells you the required count, the given count, and the exact line. It's a fixable error, caught before your program ever runs. Compare that to Session 6's infinite loop, which Dart was perfectly happy to compile.

---

## Try it yourself #2

Take one of the additions you wrote for Session 6's homework — your extra `if`/`else` chain, or your extra loop — and rewrite it as a real function. Call it at least twice with different arguments.

<details>
<summary><strong>A worked solution</strong></summary>

Turning a temperature-describing `if`/`else` chain into a function:

```dart
String describeTemp(double temp) {
  if (temp >= 30) {
    return 'Hot';
  } else if (temp >= 15) {
    return 'Mild';
  } else {
    return 'Cold';
  }
}

print(describeTemp(32.0));
print(describeTemp(10.0));
```

```
Hot
Cold
```

The shape is always the same: whatever the old code *varied on* becomes the parameter, and whatever it *produced* becomes the return type. Here the temperature varied and a description came out — so `double` in, `String` out.
</details>

---

## Three things to remember

1. **A function packages code under a name** — return type, name, typed parameters, body. Call it as often as you like, with different arguments each time.
2. **`void` means nothing comes back.** A real return type means something does, and `return` both sends it and ends the function.
3. **Parameters are positional (by order, always required) or named (in `{}`, by name, with a default or marked `required`).**

---

## Cheat sheet

**Anatomy:**

```dart
String calculateGrade(int score) {
  return 'B';
}
// ^return type  ^name  ^parameter  ^return statement
```

**`void` vs returning a value:**

```dart
void sayHello(String name) {      // does something, hands nothing back
  print('Hello, $name!');
}

int square(int x) {               // hands a value back
  return x * x;
}
```

**Positional parameters** — required, matched by order:

```dart
int add(int a, int b) => a + b;

add(3, 4);      // a = 3, b = 4
```

**Named parameters** — matched by name, wrapped in `{}`:

```dart
String greet({String greeting = 'Hello', required String name}) {
  return '$greeting, $name!';
}

greet(name: 'Rex');                             // uses the default greeting
greet(name: 'Rex', greeting: 'Welcome back');   // overrides it
```

Each named parameter needs either a default value (`= 'Hello'`) making it optional, or the `required` keyword making it mandatory.

**Arrow syntax** — single-expression bodies only:

```dart
int square(int x) => x * x;
// identical to:
int square(int x) { return x * x; }
```

---

## When it goes wrong

| What you'll see | What it actually means | The fix |
|---|---|---|
| `Too few positional arguments: 1 required, 0 given.` | You called a function without supplying an argument it requires | Check the definition and supply every required argument |
| `Too many positional arguments: 1 allowed, but 2 found.` | You passed more arguments than the definition accepts | Remove the extra one, or check you meant a different function |
| `The named parameter 'name' is required, but there's no corresponding argument.` | You skipped a named parameter marked `required` | Add `name: value` to the call |
| `The argument type 'String' can't be assigned to the parameter type 'int'.` | The value you passed doesn't match the parameter's declared type | Check the parameter's type in the definition and pass a matching value |
| `The body might complete normally, causing 'null' to be returned, but the return type is a potentially non-nullable type.` | A value-returning function has a path through it that never hits a `return` | Add a final `else` so every path returns — same idea as Session 6's "must be assigned" error |
| `Closure: (int) => int` printed instead of a number | You wrote `print(square)` instead of `print(square(5))` — that refers to the function itself rather than calling it | Add the parentheses and the argument. A function only runs when you call it |
| `Dead code` warning on a line inside a function | That line sits after a `return` in the same block, so it can never run | Move it above the `return`, or delete it |
| No error, but the result is wrong | Positional arguments passed in the wrong order — `subtract(3, 10)` instead of `subtract(10, 3)` | Check the definition's parameter order, or switch to named parameters so order stops mattering |

---

## Homework

**Estimated time: 25 minutes.**

Write one more function that uses **named** parameters — at least one with a default value, and at least one marked `required`. Then call it twice, with different combinations of arguments.

**You're done when:**

- [ ] The function's parameters are wrapped in `{}`, with at least one default value and at least one `required`
- [ ] It's called at least twice — one call relying on the default, one call overriding it
- [ ] `dart run` completes with no red error text, and the two calls produce visibly different output
- [ ] All of your previous sessions' code is still in the file and still working

**Why this matters:** Session 8 introduces `List`, `Set`, and `Map` — and from there on, the functions you write will very often take a collection as a parameter. Getting comfortable with parameters now, especially named ones, pays off immediately. Flutter itself is built almost entirely out of named parameters.

### Stretch goal

Add an optional named parameter to `calculateGrade`: `{bool verbose = false}`.

When `verbose` is `true`, return a longer string like `'Score 82 → Grade B'` instead of just `'B'`. Call it once with the default and once with `verbose: true`, and compare.

That's your first function with two modes of behaviour, chosen by the caller — a pattern you'll see everywhere in Flutter.

---

## Check yourself

1. **In `String calculateGrade(int score)`, what is `int score`?**
   a) The return type
   b) The function's name
   c) A parameter
   d) An argument

2. **What does a `void` return type mean?**
   a) The function returns the number zero
   b) The function doesn't hand any value back to the caller
   c) The function has no parameters
   d) The function will cause an error

3. **Which is a correctly called named parameter?**
   a) `greet('Rex')`
   b) `greet(name: 'Rex')`
   c) `greet(name = 'Rex')`
   d) `greet{name: 'Rex'}`

4. **What does marking a named parameter `required` do?**
   a) Gives it a default value
   b) Makes it positional instead of named
   c) Forces callers to supply it, even though it's still passed by name
   d) Makes it optional

5. **Which function body could correctly use arrow syntax (`=>`)?**
   a) One with an `if`/`else` chain and multiple return points
   b) One with a `for` loop inside it
   c) One that just returns `x * x` and nothing else
   d) One that prints three separate lines

<details>
<summary><strong>Answers</strong></summary>

1. **c** — `int score` is a parameter: a named, typed input listed in the definition. The argument is the actual value, like `82`, passed at the call site.
2. **b** — `void` means the function performs an action but hands nothing back to be used elsewhere.
3. **b** — Named parameters are passed as `name: value` at the call site.
4. **c** — `required` means the named parameter has no default and must always be supplied, but it's still passed by name.
5. **c** — Arrow syntax works only when the entire body is a single expression. Anything needing multiple statements, an `if`, or a loop needs braces.
</details>

---

## New words from this session

`function` · `parameter` · `argument` · `return type` · `return` · `void` · `positional parameter` · `named parameter` · `required` · `arrow syntax (=>)` · `refactor`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Next up

**Session 8 — Collections: `List`, `Set`, `Map`**

Every function you wrote today handles exactly one value at a time. One score. One countdown. One limit.

That's a ceiling, and next session removes it. `List`, `Set`, and `Map` let a single variable hold many values at once — so `calculateGrade` can eventually run across an entire class of scores in one pass, instead of one call per student.

That's also the exact shape the Quiz Engine needs, two sessions from now: a question isn't one value, it's a question plus several possible answers plus the correct one.

---

[← Session 6](../06-control-flow/) · [Course home](../../README.md) · [Glossary](../../glossary.md)
