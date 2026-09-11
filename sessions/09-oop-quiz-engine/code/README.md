# Session 9 — Code

**A new project this session.** After five sessions in `dart_practice`, the Quiz Engine is standalone — Module 1's mini-app, and the first thing in this course you could actually show someone.

- **`starter/quiz_engine/`** — an empty `dart create quiz_engine` project with the generated sample code cleared out. Just `void main() {}`. You build the whole thing from here.
- **`final/quiz_engine/`** — the finished, working Quiz Engine: three classes, one mixin, and live input.

## Playing it

```
cd final/quiz_engine
dart pub get
dart run
```

Answer each question and press Enter. **Type the answer itself, not the option number** — `var`, not `2`. The numbers are printed for readability, but `checkAnswer()` compares against the answer text. Teaching it to accept both is one of this session's stretch goals.

Run it from a real terminal. Some editors' built-in run panes don't forward what you type, and the program will look like it skipped every question.

## About the break-it drill

The chapter has you delete `: super(text, correctAnswer)` from `TrueFalseQuestion` to see what Dart says about it, then put it back. `final/` has it intact.

## A note on `: super(...)`

This project writes `: super(text, correctAnswer)` in full, because watching values get handed up to the superclass is the point of the lesson. Dart has a shorter modern form — `TrueFalseQuestion(super.text, super.correctAnswer);` — that does the same job, and it's worth switching to once the idea has landed. The analyzer's suggestion to use it is turned off here so it doesn't nag you mid-lesson.
