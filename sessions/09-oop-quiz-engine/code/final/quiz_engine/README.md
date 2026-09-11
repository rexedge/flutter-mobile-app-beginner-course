# Quiz Engine

Module 1's mini-app — a real, interactive console quiz built entirely in Dart. This is the first complete mini-app of the Flutter Mobile App Development (Beginner) course, built across Session 9 using variables, operators, control flow, functions, collections, and classes (with inheritance and a mixin).

## How to play

```
dart pub get
dart run
```

Answer each question when prompted and press Enter. Multiple-choice questions show a hint automatically. Your score prints at the end.

## What's inside

- `Question` — the base class every question type builds on.
- `MultipleChoiceQuestion` — adds a list of options and a hint (via the `Hintable` mixin).
- `TrueFalseQuestion` — a simpler question type, same inherited `checkAnswer()` logic.
- `Hintable` — a mixin shared only by question types that should offer a hint.

## Where this came from

Session 4 opened with a fake, hardcoded "trailer" of this exact program. This is the real thing — six sessions of Dart fundamentals, assembled into one working app.
