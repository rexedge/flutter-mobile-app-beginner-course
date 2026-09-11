# Session 9 — Classes, Inheritance, Mixins — and the Quiz Engine

**Module 1 — Dart From Zero** · Session 9 of 36 · about 24 minutes to read
**Code for this session:** [`code/starter/quiz_engine`](code/starter/quiz_engine) → [`code/final/quiz_engine`](code/final/quiz_engine)

> **This is Module 1's finish line.** By the end of this chapter you'll have built a real, interactive program — one that reads what you type and responds to it — using every single thing from Sessions 4 through 9.

---

## What you'll be able to do by the end

- Define a class with fields, a constructor, and methods, and create objects from it
- Build a class hierarchy with `extends`, hand values up with `super(...)`, and mark replacements with `@override`
- Share behaviour across classes with a `mixin` and `with`
- Read real input typed by a person, and respond to it
- Assemble all of it into a working mini-app: the Quiz Engine

## Before you start

- Finish [Session 8](../08-collections/). The Quiz Engine's backbone is a `List`, and you'll loop over it.
- **This session starts a brand-new project.** After five sessions in `dart_practice`, you're building something standalone. Keep `dart_practice` — you're just not adding to it today.

---

## The big idea

Back in Session 4, this ran on screen:

```
Question 1: What keyword declares a variable in Dart?
Your answer: var
Correct!
```

It was fake. Hardcoded `print()` statements pretending to have a conversation with you — a trailer for something that didn't exist yet.

Today you build the real one. Here's the actual program, actually running, with answers actually typed in:

```
Question 1:
What keyword declares a variable in Dart?
  1. func
  2. var
  3. class
Hint: It starts with "v"
Your answer: var
Correct!

Question 2:
Dart is null-safe by default. (true/false)
Your answer: true
Correct!

Question 3:
What symbol makes a type nullable?
  1. !
  2. ?
  3. #
Hint: It starts with "?"
Your answer: !
Not quite -- the correct answer was "?".

Final Score: 2 / 3
```

Nothing there is hardcoded. It read what was typed, checked it, kept score.

You have almost everything you need already. Variables hold the data. Operators compare answers. Control flow decides right from wrong. Functions package the logic. Collections hold the questions. **One piece is missing** — a way to describe a *thing*.

A question isn't one value. It's the question text, *plus* the correct answer, *plus* maybe a list of options, *plus* the ability to check an answer — all one unit. Sessions 4 through 8 gave you no way to say that.

Classes do. That's today.

---

## 1. Classes and objects

> **Class** — a blueprint describing what a kind of thing has, and what it can do.
> **Object** (or **instance**) — one specific thing built from that blueprint.

**The analogy:** a class is a cookie cutter. It isn't a cookie — it's the shape that stamps out cookies. Every cookie shares the shape, but each one is its own cookie with its own sprinkles.

Here's the class the whole Quiz Engine is built on:

```dart
class Question {
  final String text;
  final String correctAnswer;

  Question(this.text, this.correctAnswer);

  bool checkAnswer(String userAnswer) {
    return userAnswer.trim().toLowerCase() ==
        correctAnswer.trim().toLowerCase();
  }
}
```

Four new ideas in nine lines. Let's name each one.

### Fields

> **Field** — a variable that belongs to a class. Each object gets its own copy.

`text` and `correctAnswer` are fields. Every `Question` object you create has its own `text` and its own `correctAnswer`. They're `final` because a question's wording shouldn't change after it's created — exactly the `final` from Session 5, now living inside a class.

### Constructors

> **Constructor** — the special function that builds a new object. It has the same name as the class.

```dart
Question(this.text, this.correctAnswer);
```

That's the whole constructor. It runs the moment you create a `Question`.

> **`this`** — the object currently being built or used.

`this.text` is a Dart shorthand that means *"take the value passed in here and store it straight into this object's `text` field."* Without the shorthand you'd write:

```dart
Question(String text, String correctAnswer) {
  this.text = text;
  this.correctAnswer = correctAnswer;
}
```

Same result, four extra lines. You'll use the short form in nearly every constructor you ever write.

### Methods

> **Method** — a function that belongs to a class.

`checkAnswer` is a method. The important part is what it *doesn't* need:

```dart
bool checkAnswer(String userAnswer) {
  return userAnswer.trim().toLowerCase() ==
      correctAnswer.trim().toLowerCase();
}
```

It takes `userAnswer` as a parameter, but it never asks for `correctAnswer` — because it's already inside the object that owns it. A method can reach its own fields directly. That's the real difference between a method and the plain functions from Session 7.

Notice `.trim().toLowerCase()` on both sides too. That's what makes the quiz forgiving: `"  VAR "` and `"var"` both pass, because both get trimmed of spaces and lowercased before comparing.

### Creating and using an object

```dart
Question q = Question('What is 2 + 2?', '4');

print(q.text);              // What is 2 + 2?
print(q.checkAnswer('4'));  // true
print(q.checkAnswer('5'));  // false
```

`Question('What is 2 + 2?', '4')` calls the constructor and builds one real object. Then the dot means *"reach into this specific object."*

### The thing that just clicked

You've been using classes since Session 1.

`List` is a class. `String` is a class. When you wrote `names.length`, you were reading a field on a `List` object. When you wrote `names.add('Kai')`, you were calling its method. `.trim()` and `.toLowerCase()` are methods on `String`.

Every dot you've ever typed was you using somebody else's class. Today you write your own — and from here on, the dot stops being magic.

---

## 2. Inheritance

Real quizzes have different *kinds* of question. Multiple choice has a list of options; true/false doesn't. Both still have text, still have a correct answer, still need checking.

Writing two complete classes would mean writing `checkAnswer` twice. Inheritance is how you avoid that.

> **Inheritance / `extends`** — building a new class on top of an existing one, getting everything it already has.
> **Superclass** — the class being built on. **Subclass** — the new one.

```dart
class MultipleChoiceQuestion extends Question {
  final List<String> options;

  MultipleChoiceQuestion(String text, String correctAnswer, this.options)
      : super(text, correctAnswer);

  void display() {
    print(text);
    for (int i = 0; i < options.length; i++) {
      print('  ${i + 1}. ${options[i]}');
    }
  }
}
```

`MultipleChoiceQuestion` gets `text`, `correctAnswer`, **and** `checkAnswer()` for free — automatically, just from writing `extends Question`. It only adds what's genuinely different: a list of options and a way to display them.

**The analogy:** inheritance is a specialised job title building on a general one. Every *manager* is still an *employee* underneath, with everything an employee has, plus extra responsibilities on top.

### `super`

> **`super(...)`** — hands values up to the superclass's own constructor.

```dart
MultipleChoiceQuestion(String text, String correctAnswer, this.options)
    : super(text, correctAnswer);
```

Read the punctuation carefully, because it's unusual. The `:` after the parameter list starts an **initializer** — work that happens before the constructor body runs. `super(text, correctAnswer)` calls `Question`'s constructor with those two values, so the inherited fields actually get filled in.

Every subclass constructor has to do this when its parent needs arguments. Dart will not guess which values you meant — and you'll see exactly what happens when you skip it, in the break-it drill below.

### The second subclass

```dart
class TrueFalseQuestion extends Question {
  TrueFalseQuestion(String text, String correctAnswer)
      : super(text, correctAnswer);

  void display() {
    print('$text (true/false)');
  }
}
```

Same pattern, simpler class. **And `checkAnswer()` was never written twice.** Both subclasses inherit it. That's the actual point of inheritance: write shared behaviour once, and write only the differences.

### `@override`

> **`@override`** — a label marking a method that intentionally replaces one from the superclass or mixin.

Neither `display()` above is marked `@override`, because neither *replaces* anything — `Question` has no `display()`. They're brand-new methods that only the subclasses have.

You'll see `@override` in a moment, on the mixin. It's a note to Dart and to anyone reading: *this replacement is deliberate, not an accident.*

---

## 3. Mixins

Only some questions should offer a hint. A multiple-choice question can hint at its answer; a true/false question hinting "it starts with t" would be absurd.

Inheritance is the wrong tool here — you'd have to put `showHint()` on `Question`, giving it to *everything*. A mixin solves exactly this.

> **Mixin** — a bundle of shared behaviour any class can borrow with `with`, without joining its inheritance chain.

```dart
mixin Hintable {
  String get hint;

  void showHint() {
    print('Hint: $hint');
  }
}
```

```dart
class MultipleChoiceQuestion extends Question with Hintable {
  // ... fields and constructor unchanged ...

  @override
  String get hint => 'It starts with "${correctAnswer[0]}"';
}
```

`MultipleChoiceQuestion` now **extends** `Question` *and* **has** `Hintable`. `TrueFalseQuestion` doesn't, and can't be asked for a hint.

**The analogy:** if inheritance is a job title building on a more general one, a mixin is a certification you can bolt onto any job, whatever the title. A `Hintable` question can be multiple-choice today and something else entirely tomorrow, without touching the family tree.

### Wait — what is `get`?

New syntax, and worth stopping on, because it isn't in the vocabulary list anywhere.

> **Getter** — a method that behaves like a field. You call it *without* parentheses.

```dart
String get hint => 'It starts with "${correctAnswer[0]}"';
```

That's a method: it runs code, and it uses arrow syntax from Session 7. But because it's declared with `get`, you use it like a field:

```dart
question.hint      // correct — no parentheses
question.hint()    // error: The expression doesn't evaluate to a function
```

Getters are for values that are *computed* but *feel* like data. `hint` isn't stored anywhere — it's built fresh from `correctAnswer[0]` each time you ask. (`correctAnswer[0]` is the first character of the string; `String` supports indexing just like `List`.)

The mixin declares `String get hint;` with **no body at all**. That's a requirement: *any class using me must supply a `hint`.* `MultipleChoiceQuestion` fills it in, which is why that one *is* marked `@override`. Leave it out and Dart refuses to compile.

---

## 4. Reading what someone types

One last tool, and this is the one that makes the program *interactive*.

```dart
import 'dart:io';
```

`dart:io` is a built-in toolbox for input, output and files. You need exactly two pieces of it:

```dart
stdout.write('Your answer: ');       // print with no line break after
String? userAnswer = stdin.readLineSync();
```

`stdin.readLineSync()` **pauses your program**, waits for someone to type a line and press <kbd>Enter</kbd>, and hands back what they typed.

Two details matter:

- **`stdout.write` instead of `print`.** `print` always ends the line. `write` doesn't — so the cursor stays put and the person types on the same line as the prompt.
- **The result is `String?`, not `String`.** Nullable, from Session 4. Input can genuinely fail, so Dart makes you handle that possibility. You'll check `userAnswer != null` before using it.

Don't worry about the rest of `dart:io` today. Two pieces, used as shown.

---

## Try it yourself #1

Before building the real thing, write a small class of your own — anything, it doesn't have to be quiz-related. It needs:

1. At least 2 fields
2. A constructor using the `this.field` shorthand
3. One method that uses those fields

Then create an object and call the method.

<details>
<summary><strong>A worked solution</strong></summary>

```dart
class Pet {
  final String name;
  final String sound;

  Pet(this.name, this.sound);

  void speak() {
    print('$name says $sound!');
  }
}

void main() {
  Pet dog = Pet('Bruno', 'Woof');
  Pet cat = Pet('Misu', 'Meow');

  dog.speak();
  cat.speak();
}
```

```
Bruno says Woof!
Misu says Meow!
```

Two objects, one blueprint, each carrying its own data. That's the whole idea of a class in five lines.
</details>

If you built an object from your own blueprint and it did something with its own data, you've written real object-oriented Dart.

---

## 5. Build it: the Quiz Engine

### Make the project

This is a new, standalone project. In your course folder:

```
dart create quiz_engine
cd quiz_engine
```

`dart create` generates a working sample program — `lib/`, `test/`, a `CHANGELOG.md`, and a `bin/quiz_engine.dart` containing a hello-world that imports from `lib/`. **Open `bin/quiz_engine.dart` and delete everything in it.** Replace the whole file with:

```dart
void main() {

}
```

You can ignore `lib/` and `test/` entirely today. Everything goes in `bin/quiz_engine.dart`.

### Build it up

Now assemble the pieces, top to bottom. First the import and the base class:

```dart
import 'dart:io';

class Question {
  final String text;
  final String correctAnswer;

  Question(this.text, this.correctAnswer);

  bool checkAnswer(String userAnswer) {
    return userAnswer.trim().toLowerCase() ==
        correctAnswer.trim().toLowerCase();
  }
}
```

Then the mixin, and the two subclasses:

```dart
mixin Hintable {
  String get hint;

  void showHint() {
    print('Hint: $hint');
  }
}

class MultipleChoiceQuestion extends Question with Hintable {
  final List<String> options;

  MultipleChoiceQuestion(String text, String correctAnswer, this.options)
      : super(text, correctAnswer);

  @override
  String get hint => 'It starts with "${correctAnswer[0]}"';

  void display() {
    print(text);
    for (int i = 0; i < options.length; i++) {
      print('  ${i + 1}. ${options[i]}');
    }
  }
}

class TrueFalseQuestion extends Question {
  TrueFalseQuestion(String text, String correctAnswer)
      : super(text, correctAnswer);

  void display() {
    print('$text (true/false)');
  }
}
```

And finally `main()` — the part that uses all of it:

```dart
void main() {
  List<Question> questions = [
    MultipleChoiceQuestion(
      'What keyword declares a variable in Dart?',
      'var',
      ['func', 'var', 'class'],
    ),
    TrueFalseQuestion('Dart is null-safe by default.', 'true'),
    MultipleChoiceQuestion(
      'What symbol makes a type nullable?',
      '?',
      ['!', '?', '#'],
    ),
  ];

  int score = 0;

  for (int i = 0; i < questions.length; i++) {
    Question question = questions[i];
    print('Question ${i + 1}:');

    if (question is MultipleChoiceQuestion) {
      question.display();
      question.showHint();
    } else if (question is TrueFalseQuestion) {
      question.display();
    }

    stdout.write('Your answer: ');
    String? userAnswer = stdin.readLineSync();

    if (userAnswer != null && question.checkAnswer(userAnswer)) {
      print('Correct!\n');
      score++;
    } else {
      print(
        'Not quite -- the correct answer was "${question.correctAnswer}".\n',
      );
    }
  }

  print('Final Score: $score / ${questions.length}');
}
```

### Two things in `main()` worth explaining

**`List<Question>` holds both kinds of question.** A `MultipleChoiceQuestion` *is* a `Question`, so it's allowed in the list. That's inheritance paying off — one list, mixed types, all guaranteed to have `checkAnswer()`.

**`question is MultipleChoiceQuestion`** checks what an object actually is at runtime.

```dart
if (question is MultipleChoiceQuestion) {
  question.display();
  question.showHint();
}
```

Why is that needed? Because the variable is declared `Question`, and `Question` has no `display()` or `showHint()` — only the subclasses do. Try calling it directly and Dart stops you:

```
The method 'display' isn't defined for the type 'Question'.
```

The `is` check tells Dart *"inside this block, treat it as a `MultipleChoiceQuestion`"* — and then the subclass's methods become available. This is called type promotion, and it gets a proper treatment later in the course. For now: recognise the shape, and know exactly why it's there.

### Run it

```
dart run
```

Answer the questions as they come. **Type the answer itself, not the option number** — see the note below.

```
Question 1:
What keyword declares a variable in Dart?
  1. func
  2. var
  3. class
Hint: It starts with "v"
Your answer: var
Correct!

Question 2:
Dart is null-safe by default. (true/false)
Your answer: true
Correct!

Question 3:
What symbol makes a type nullable?
  1. !
  2. ?
  3. #
Hint: It starts with "?"
Your answer: !
Not quite -- the correct answer was "?".

Final Score: 2 / 3
```

That's a real program. Three classes, one mixin, a list, a loop, and live input — built out of six sessions of tools.

### Two quirks you'll notice immediately

**The numbers are decoration.** The options print as `1. func / 2. var / 3. class`, but `checkAnswer` compares your input against the *answer text*. Type `2` and you'll be marked wrong even though `var` is option 2. That's not a bug you introduced — it's a genuine rough edge in this first version, and fixing it is the stretch goal below.

**The hint sometimes gives it away.** `'It starts with "${correctAnswer[0]}"'` is fine for `var` → `"v"`. For the answer `?`, the first character *is* the whole answer, so the hint reads `It starts with "?"`. Also fixable, also below. Noticing things like this in your own code is a real skill, and you just did it.

---

## Break it on purpose

Inheritance has one mistake nearly everyone makes once. Let's make it deliberately.

In `TrueFalseQuestion`, delete the `super(...)` call:

```dart
TrueFalseQuestion(String text, String correctAnswer);
// : super(text, correctAnswer)   <-- deleted
```

```
dart run
```

```
Error: The implicitly invoked unnamed constructor from 'Question' has
required parameters.
```

Read it slowly, because the wording is dense. With `super(...)` gone, Dart still has to build the `Question` part of the object — so it falls back to calling `Question`'s constructor with **no arguments at all**. And `Question`'s constructor requires two. Hence "implicitly invoked" (you didn't write the call, Dart did) and "has required parameters" (and it needed things you didn't give it).

Put the `: super(text, correctAnswer)` back and confirm it runs.

### The habit

A subclass constructor is responsible for its parent's fields as well as its own. If the parent's constructor takes arguments, the child has to hand them up — every time, explicitly. Dart will not guess which of your parameters were meant for the parent.

This is the single most common early mistake with class hierarchies, in every object-oriented language there is. Now you know the error on sight.

---

## Try it yourself #2

Add a fourth question to your `questions` list — either type — and play the quiz again.

<details>
<summary><strong>A worked solution</strong></summary>

```dart
TrueFalseQuestion('A List in Dart can hold duplicate values.', 'true'),
```

Drop it anywhere in the list. The loop picks it up automatically — no other change needed anywhere, because the loop was never written around a fixed number of questions.

That's worth pausing on. Adding a feature cost you one line and changed nothing else. That's what all of today's structure bought you.
</details>

---

## Three things to remember

1. **A class is a blueprint; an object is one thing built from it**, with its own fields and its own methods.
2. **`extends` builds on an existing class**, `super(...)` fills in the inherited fields, and shared behaviour gets written exactly once.
3. **A `mixin` hands abilities to exactly the classes that should have them**, without touching the inheritance chain.

---

## Cheat sheet

**Define a class:**

```dart
class Question {
  final String text;              // field
  final String correctAnswer;

  Question(this.text, this.correctAnswer);   // constructor

  bool checkAnswer(String userAnswer) {      // method
    return userAnswer.trim().toLowerCase() ==
        correctAnswer.trim().toLowerCase();
  }
}
```

**Create and use an object:**

```dart
Question q = Question('2 + 2 = ?', '4');
print(q.text);            // read a field
q.checkAnswer('4');       // call a method
```

**Inherit:**

```dart
class TrueFalseQuestion extends Question {
  TrueFalseQuestion(String text, String correctAnswer)
      : super(text, correctAnswer);
}
```

**Mix in shared behaviour:**

```dart
mixin Hintable {
  String get hint;                 // required — users must supply it
  void showHint() => print('Hint: $hint');
}

class MultipleChoiceQuestion extends Question with Hintable {
  @override
  String get hint => 'It starts with "${correctAnswer[0]}"';
}
```

**Read input:**

```dart
import 'dart:io';

stdout.write('Your answer: ');
String? answer = stdin.readLineSync();
```

**Quick reference:**

| Syntax | Means |
|---|---|
| `class X { }` | Define a blueprint |
| `X(this.field)` | Constructor with shorthand field assignment |
| `X obj = X(...)` | Create an object |
| `obj.field` / `obj.method()` | Reach into one object |
| `class Y extends X` | Y inherits everything X has |
| `: super(...)` | Hand values up to the parent constructor |
| `mixin M { }` | A reusable bundle of behaviour |
| `class Y extends X with M` | Y inherits from X *and* has M |
| `@override` | This deliberately fills in or replaces a parent's slot |
| `Type get name => ...` | A getter — called without parentheses |
| `obj is Type` | Is this object actually that type? |

---

## When it goes wrong

| What you'll see | What it actually means | The fix |
|---|---|---|
| `The implicitly invoked unnamed constructor from 'Question' has required parameters.` | A subclass constructor never handed values up to its parent | Add `: super(arg1, arg2)` after the constructor's parameter list |
| `The method 'display' isn't defined for the type 'Question'.` | You called a subclass's method on a variable declared as the superclass | Wrap it in `if (question is MultipleChoiceQuestion) { ... }` first, or check the spelling and that the method is inside the class braces |
| `Missing concrete implementation of 'getter Hintable.hint'.` | A class uses `with Hintable` but never supplies the `hint` getter | Add `@override String get hint => '...';` inside the class |
| `The expression doesn't evaluate to a function, so it can't be invoked.` | You called a getter with parentheses — `question.hint()` | Drop the parentheses: `question.hint` |
| `A value of type 'String?' can't be assigned to a variable of type 'String'.` | `stdin.readLineSync()` returns a nullable String | Keep the `String?` type and check `!= null` before using it, exactly as `main()` does |
| You typed the option **number** and were marked wrong | `checkAnswer` compares against the answer text, not the option number | Type the answer itself (`var`, not `2`) — or do the stretch goal and teach it to accept both |
| `RangeError` from `correctAnswer[0]` | A question was created with an empty string as its answer | Give every question a real answer |
| The program ends instantly without waiting for input | You ran it somewhere that isn't a real terminal — some editors' "run" panes don't forward typing | Run `dart run` from a proper terminal window |

---

## Homework

**Estimated time: 30 minutes.**

Grow your Quiz Engine to **at least 5 questions**, using both question types, on a topic **you** actually know — films, football, your city, your job. Anything but Dart trivia.

**You're done when:**

- [ ] At least 5 questions in the `questions` list
- [ ] At least one `MultipleChoiceQuestion` and at least one `TrueFalseQuestion`
- [ ] `dart run` plays the whole quiz, takes real input, and prints a final score
- [ ] Every question is genuinely answerable — nothing hardcoded or faked

**Why this matters:** this is the first thing you've built that you can actually show someone. Making the questions yours is what turns it from an exercise into a thing you made.

### Stretch goals

Two real improvements, both fixing quirks you saw above.

**1. Accept the option number too.** In `MultipleChoiceQuestion`, override `checkAnswer` so that typing `2` counts as answering `var`:

```dart
@override
bool checkAnswer(String userAnswer) {
  // if the input is a number, translate it to that option first
  // then fall back to super.checkAnswer(...)
}
```

`int.tryParse(userAnswer)` gives you an `int?` — `null` if the text wasn't a number. That's your test for which kind of answer you got. This is your first real `@override` of an inherited method, and `super.checkAnswer(...)` calls the original.

**2. Make the hint useful for one-character answers.** Right now the hint for `?` is `It starts with "?"`. Change `hint` so that if the answer is only one character, it says something else — how many options there are, or which letter it *doesn't* start with.

---

## Check yourself

1. **What does a class define?**
   a) A single object
   b) A blueprint objects are built from
   c) A function
   d) A variable

2. **What does `this.text` inside a constructor do?**
   a) Prints the text
   b) Assigns the passed-in value straight to the field
   c) Deletes the field
   d) Converts text to a number

3. **What keyword lets one class build on another?**
   a) `with`
   b) `mixin`
   c) `extends`
   d) `super`

4. **What happens if a subclass constructor never calls `super(...)` and the parent needs arguments?**
   a) Nothing — Dart fills in defaults
   b) A compile error, because the parent's part of the object can't be built
   c) The subclass silently gets null fields
   d) It only fails at runtime

5. **What's the difference between `extends` and `with`?**
   a) They're interchangeable
   b) `extends` inherits from one superclass; `with` mixes in shared behaviour from a mixin
   c) `with` is for functions, `extends` is for variables
   d) `extends` is Flutter-only

<details>
<summary><strong>Answers</strong></summary>

1. **b** — A class is the blueprint; an object is one thing built from it. One class, many objects.
2. **b** — Constructor shorthand assigns the argument straight to the field, saving you an explicit assignment line.
3. **c** — `extends` sets up inheritance. `super(...)` is how the subclass constructor then calls the parent's.
4. **b** — Dart has to build the parent's part of the object first. Without a valid `super(...)` call it can't, and it stops at compile time.
5. **b** — `extends` is single inheritance from one superclass. `with` bolts a mixin's behaviour on regardless of what the class already extends.
</details>

---

## New words from this session

`class` · `object` / `instance` · `field` · `constructor` · `this` · `method` · `inheritance` / `extends` · `superclass` / `subclass` · `super` · `@override` · `mixin` / `with` · `getter`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Module 1 complete

Stop and take this in for a second.

Nine sessions ago you didn't have Flutter installed. Six sessions ago you'd never written a line of Dart. Today you built a program with a class hierarchy, a mixin, live input, and a scoring loop — and you understand every line of it.

| Session | What it gave you | Where it shows up in the Quiz Engine |
|---|---|---|
| 4 | Variables, types, null safety | `String? userAnswer` |
| 5 | Operators, interpolation | `==` comparison, `'Question ${i + 1}:'` |
| 6 | Control flow | the `if`/`else` scoring, the question loop |
| 7 | Functions | `checkAnswer()`, `display()`, `showHint()` |
| 8 | Collections | `List<Question>`, `List<String> options` |
| 9 | Classes | the whole structure |

Nothing was filler. Every session is load-bearing in the thing you just built.

---

## Next up

**Session 10 — Everything Is a Widget** · *Module 2 begins*

You're going back to Flutter.

Back to the emulator, back to `flutter run`, back to the app you first ran all the way back in Session 3 — and here's the honest promise: **Sessions 1 through 3 are going to make far more sense the second time.** When you first saw `MaterialApp` and `Scaffold` and that deep nest of brackets, it was shapes on a screen. Now you know what a class is, what a constructor is, what named parameters are, and what a `List` of things looks like.

Flutter is going to look like Dart, because it is Dart. Every widget is a class. Every one you build is a constructor call with named parameters. Every screen is a tree of objects.

Same course, full circle — and this time you can read it.

---

[← Session 8](../08-collections/) · [Course home](../../README.md) · [Glossary](../../glossary.md)
