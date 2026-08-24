# Session 4 — Variables, Data Types, Null Safety

**Module 1 — Dart From Zero** · Session 4 of 36 · about 18 minutes to read
**Code for this session:** [`code/starter/dart_practice`](code/starter/dart_practice) → [`code/final/dart_practice`](code/final/dart_practice)

---

## What you'll be able to do by the end

- Create a plain Dart console project with `dart create`
- Declare variables using `var` and using explicit types
- Use Dart's four core types: `int`, `double`, `String`, `bool`
- Explain what null safety is and why Dart makes you opt in to "no value"
- Read and fix a null-safety error

## Before you start

- Finish [Module 0](../03-anatomy-and-hot-reload/) — Sessions 1 through 3.
- **No emulator today.** Just VS Code and a terminal. This is the first visible break from the Module 0 pattern, and it's deliberate.

No prior programming experience required. This is genuinely session one of real coding.

---

## The big idea

Here's a preview of something. Five sessions from now, in Session 9, you build a working **Quiz Engine** — a real program that asks questions, checks answers, and keeps score. Run in a terminal, it looks like this:

```
Welcome to the Dart Quiz Engine!

Question 1: What keyword declares a variable in Dart?
Your answer: var
Correct!

Question 2: What symbol makes a type nullable?
Your answer: ?
Correct!

Final Score: 2 / 2 — nice work!
```

**Notice something?** No emulator. No app icon. No phone screen — just a terminal window.

Today we're not touching Flutter at all. We're going underneath it, to the actual programming language that's been quietly running everything you've built so far: **Dart**.

Module 0 was three sessions about tools — installing things, running things, understanding what a Flutter project looks like. That's done. Module 1 is different: six sessions, zero installs, one focus. Learning to write Dart, the language every line of Flutter code is written in.

**Is this still the same course?** Completely — same 12 weeks, and this shift is intentional. Every professional Flutter developer knows Dart as its own thing, separate from Flutter's widgets. Learning it language-first means nothing from here forward is a mystery you're just copying.

---

## 1. Making somewhere to write code

You need a plain Dart project — not a Flutter app. Open a terminal and run:

```
cd flutter_course
dart create dart_practice
cd dart_practice
```

> **`dart create`** — `flutter create`'s plain-Dart cousin.

Recognise the move? In Session 2 you ran `flutter create` and got a full app. `dart create` does the same job for plain Dart — no phone, no widgets, just a program that runs in a terminal.

Open the project in VS Code and find `bin/dart_practice.dart`.

**One honest heads-up:** the generated file has a shortcut in it called string interpolation — that `${...}` thing you can see. We haven't learned that yet; it's next session's whole topic. **Delete everything in the file** and replace it with a blank start:

```dart
void main() {

}
```

Now run it:

```
dart run
```

Nothing happens, and that's correct — an empty `main()` has nothing to do yet. Let's give it something.

---

## 2. Variables

> **Variable** — a labelled box that holds a value.

A variable is a named container holding a piece of information your program can use, check, or change later.

> **Think of a variable like a labelled storage box.** You write a label on the outside — the variable's name — and put something inside. Later, anyone reading that label knows what's in the box without opening it and guessing.

Type this inside `main()`:

```dart
void main() {
  var name = 'Rex';
  print(name);
}
```

Run it with `dart run`:

```
Rex
```

> **`var`** — let Dart figure out the type for you.

`var` creates a variable and lets Dart work out what kind of information it's holding, based on what you put in it. Here, Dart sees text in quotes and knows this is a `String`.

### Saying the type out loud

> **Type annotation** — writing the type yourself, instead of letting Dart infer it.

You can be explicit:

```dart
String name = 'Rex';
```

Same result, same program. But now anyone reading this line knows immediately, without guessing, exactly what kind of value `name` is allowed to hold.

**While you're starting out, be explicit like this.** It's a few extra keystrokes and it makes mistakes far easier to catch early. This course writes types out in full nearly everywhere.

---

## 3. Dart's four core types

Four types you'll use constantly, starting today:

```dart
String name = 'Rex';
int age = 34;
double height = 1.8;
bool isLearningFlutter = true;
```

| Type | Holds | Example |
|---|---|---|
| `String` | Text, always in quotes | `'Rex'` |
| `int` | A whole number, no decimal point | `34` |
| `double` | A number that can have a decimal point | `1.8` |
| `bool` | Exactly one of two values: `true` or `false`, nothing in between | `true` |

Add a `print()` for each:

```dart
print(name);
print(age);
print(height);
print(isLearningFlutter);
```

Run it:

```
Rex
34
1.8
true
```

Four labelled boxes, four values, printed exactly as stored.

---

## Try it yourself #1

In your own `dart_practice` project, declare **four variables about yourself**:

- your name as a `String`
- your age as an `int`
- your height as a `double`
- one `bool` that's true or false about you

Print all four, and run it.

<details>
<summary><strong>A worked example</strong></summary>

```dart
void main() {
  String name = 'Alex';
  int age = 27;
  double height = 1.65;
  bool ownsAPet = false;

  print(name);
  print(age);
  print(height);
  print(ownsAPet);
}
```

If your four `print()` lines ran and showed your own values, you're done. There's no single right answer here beyond matching each value to its correct type.

If four values about *you* just printed to your own terminal, you've written and run real Dart, start to finish, for the first time.
</details>

---

## 4. Null, and null safety

New idea — and it's the one Dart cares about more than almost any other language.

> **`null`** — the deliberate absence of a value.

`null` means "no value here at all." Not zero, not empty text — a genuine, deliberate absence.

> **If a variable is a labelled box,** `null` is a label with an empty box behind it. Not a box with nothing written on the label — an intentionally empty box.

Try adding this:

```dart
String middleName = null;
```

Run it:

```
Error: A value of type 'Null' can't be assigned to a variable of type 'String'.
```

Dart refused to even run this. That's not an accident, and it's not Dart being difficult for no reason.

> **Null safety** — Dart forces you to plan for "no value" up front.

By default, **every variable you declare is a promise**: *"this will always hold a real value, guaranteed, never nothing."* Dart checks that promise while you're still writing the code — not later, when your app is running on someone's phone and unexpectedly crashes.

**Why does this matter so much?** Uncaught `null` values used to be one of the single most common causes of app crashes industry-wide, in nearly every programming language. Dart decided to make it a compile-time conversation instead of a crash-time surprise.

> **Reading older tutorials?** If you find Dart code where nobody worries about any of this, that's legacy code from before null safety existed. Every version of Dart this course uses requires the modern approach — what you're learning right now.

### Saying "this might be empty"

So how do you legitimately say "this might have no value"? One character.

> **Nullable type** — add a `?` after the type. `String?` means "this might be a String, or might be null."

```dart
String? middleName = null;
```

Run it. It works cleanly, no error.

> **Non-nullable type** — a type with no `?`. It must always hold a real value.

`String` by itself is non-nullable. `String?` is nullable — explicitly allowed to hold `null`. **You choose, on purpose, every single time you declare a variable.**

Now print it:

```dart
print(middleName);
```

```
null
```

There it is, printed honestly. Not an empty string, not an error — genuinely nothing, exactly as declared.

**The rule of thumb:** no `?` means "this can never be empty, ever." A `?` means "this might genuinely have nothing in it, and that's expected."

---

## 5. Build it: your bio script

No mini-app yet — Session 9 is where that happens. Today's build is a real, complete program: a short bio describing you, using every type from today plus one nullable field, handled properly.

```dart
void main() {
  String name = 'Rex';
  int age = 34;
  double height = 1.8;
  bool isLearningFlutter = true;
  String? middleName = null;

  print(name);
  print(age);
  print(height);
  print(isLearningFlutter);

  if (middleName == null) {
    print('No middle name on file.');
  } else {
    print(middleName);
  }
}
```

Run it:

```
Rex
34
1.8
true
No middle name on file.
```

**"That `if` line — is that new too?"** Yes, and don't worry about memorising it today. That's an `if` statement, and Session 6 is entirely about them. For now, trust that `middleName == null` is Dart's way of asking *"is this box actually empty?"* — and copy the shape.

A complete, real program: five variables, four types, one properly handled nullable field, and a safe check before ever touching a value that might not exist.

### A ten-second preview of next session

Right now you're printing four separate lines. There's a much nicer way to combine text and variables into one line:

```dart
print('$name is $age years old.');
```

That's called **string interpolation**. That's all we'll say about it today — Session 5, it's the whole first half of the session.

---

## Break it on purpose

Let's remove the safety net and see exactly what Dart does.

Change your nullable field back to non-nullable — delete the `?`:

```dart
String middleName = null;
```

Run it:

```
Error: A value of type 'Null' can't be assigned to a variable of type 'String'.
```

**Read that carefully.** It's not vague. It's telling you precisely what's wrong: you promised a `String`, always present, and then handed it `null`, a genuine absence. Dart caught the broken promise before the program ever ran.

There are exactly **two honest fixes**, and which one is correct depends on what you actually mean:

```dart
String? middleName = null;      // Option A: "no middle name" is genuinely possible
String middleName = 'Edge';     // Option B: it should always have a real value
```

Neither is more correct in general. The right one is whichever matches the truth about your data.

Keep it nullable here, since that's true to life. Fixed in about ten seconds, by reading exactly what Dart told you.

**This is a different flavour of error from the ones in Sessions 1 and 3.** Those were typos — a missing bracket, a misspelled name. This one is Dart catching a *logical* mistake: you told it one thing and did another. Same calm response, though: read it, find the line, fix it, move on.

---

## Try it yourself #2

Add **one more variable** to your own bio script — something that's genuinely allowed to be missing for you, like a nickname or a middle name.

Declare it nullable, and write the same `if` check to print something sensible either way.

<details>
<summary><strong>A worked example</strong></summary>

```dart
String? nickname = null;

if (nickname == null) {
  print('No nickname on file.');
} else {
  print(nickname);
}
```

If yours runs without a red error and prints the correct branch — depending on whether you gave it a real value or left it `null` — that's a complete, correct null check.

Try it both ways. Set it to `null`, run. Then set it to a real value, run again. Watch the different branch fire.
</details>

---

## Three things to remember

1. **Variables are labelled boxes**, declared with `var` or an explicit type.
2. **Four core types:** `String`, `int`, `double`, `bool`.
3. **Every variable is non-nullable by default.** You explicitly opt in with `?` if "no value" is a real possibility — and Dart checks that promise before your code ever runs.

---

## Cheat sheet

**Getting started:**

| Command | What it does |
|---|---|
| `dart create <name>` | Generates a new plain Dart console project (no Flutter) |
| `cd <name>` | Moves into that project's folder |
| `dart run` | Runs `bin/<name>.dart` for the current project |

**Declaring variables:**

```dart
var name = 'Rex';           // Dart infers the type (String)
String name = 'Rex';        // You state the type explicitly
```

**The four core types:**

| Type | Holds | Example |
|---|---|---|
| `String` | Text, always in quotes | `'Rex'` |
| `int` | A whole number | `34` |
| `double` | A number with a decimal point | `1.8` |
| `bool` | `true` or `false`, nothing else | `true` |

**Null safety:**

```dart
String name = 'Rex';        // Non-nullable — must always hold a real value
String? middleName = null;  // Nullable — explicitly allowed to hold null

if (middleName == null) {
  print('No middle name on file.');
} else {
  print(middleName);
}
```

---

## When it goes wrong

| What you'll see | What it actually means | The fix |
|---|---|---|
| `A value of type 'Null' can't be assigned to a variable of type 'String'.` | You assigned `null` to a non-nullable type | Either add `?` to the type if "no value" is genuinely valid, or assign a real value instead |
| `A value of type 'String' can't be assigned to a variable of type 'int'.` | You assigned the wrong kind of value for the declared type — e.g. text into an `int` | Check the value matches the type, or fix the type annotation to match what you actually meant to store |
| `Undefined name 'nmae'.` (or similar) | You referenced a variable that doesn't exist — usually a typo in its name | Check spelling and capitalisation match exactly between where you declared it and where you used it |
| `dart run` says it can't find the file | You're not inside the project folder | `cd` into `dart_practice` first. `dart run` only works from a project's own directory |

---

## Homework

**Estimated time: 25 minutes.**

Expand your bio script to **at least six variables total**, with at least one nullable field handled with a proper null check — the `if`/`else` pattern from today.

**You're done when:**

- [ ] At least six variables, using all four of today's types at least once each
- [ ] At least one variable is nullable (`Type?`), with a null check that prints something sensible in **both** the null and non-null case
- [ ] `dart run` completes without any red error text

**Why this matters:** every session for the rest of Module 1 builds directly on this file. Session 5 adds string interpolation and maths to it. Session 6 adds real control flow. By Session 9, exactly this kind of thinking becomes your Quiz Engine.

### Stretch goal

Add two more nullable variables — for example an `int? favoriteNumber` and a `bool? hasPet`. Leave one as `null` and give the other a real value. Write a null check for each.

Notice how the same `if (x == null) { ... } else { ... }` shape works identically no matter which type it's checking. That "pattern repeats across types" observation is exactly the instinct Session 6 builds on.

---

## Check yourself

1. **What does `var name = 'Rex';` do?**
   a) Creates a variable named `name`, letting Dart infer its type
   b) Creates a function called `name`
   c) Prints the word "Rex"
   d) Creates a nullable variable

2. **Which type would you use to store someone's exact height, like 1.8?**
   a) `int`
   b) `String`
   c) `double`
   d) `bool`

3. **What does `null` mean in Dart?**
   a) The number zero
   b) An empty piece of text
   c) The deliberate, genuine absence of a value
   d) A type of error

4. **What's the difference between `String` and `String?`**
   a) No difference, they're interchangeable
   b) `String` must always hold a real value; `String?` may hold `null`
   c) `String?` is faster
   d) `String` is for numbers, `String?` is for text

5. **You write `String city = null;` and run your program. What happens?**
   a) It runs fine, `city` is empty
   b) It runs fine, `city` becomes `"null"` as text
   c) Dart refuses to run it — a null-safety compile error
   d) It crashes only when you print it

<details>
<summary><strong>Answers</strong></summary>

1. **a** — `var` declares a variable and lets Dart infer its type from the value assigned to it.
2. **c** — `double` is for numbers that can include a decimal point, like a height of 1.8.
3. **c** — `null` represents a genuine, deliberate absence of a value. Not zero, not empty text.
4. **b** — The `?` is what makes a type nullable. Without it, the variable is a promise that it always holds a real value.
5. **c** — Assigning `null` to a non-nullable type is caught before the program ever runs, thanks to null safety.
</details>

---

## New words from this session

`variable` · `var` · `dart create` · `dart run` · `type annotation` · `int` · `double` · `String` · `bool` · `null` · `null safety` · `nullable type (?)` · `non-nullable type`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Next up

**[Session 5 — Operators, String Interpolation, `final` vs `const`](../05-operators-interpolation-final-const/)**

Next session pays off the preview from a few minutes ago: **string interpolation**, for real this time. Plus operators for doing actual maths and comparisons, and the difference between `final` and `const` — which sounds small and is not.

Five sessions from here, all of this becomes the Quiz Engine from the top of today.

---

[← Session 3](../03-anatomy-and-hot-reload/) · [Course home](../../README.md) · [Glossary](../../glossary.md) · [Session 5 →](../05-operators-interpolation-final-const/)
