# Practice Workbook — Sessions 0 to 7

Lots of practice, on purpose. Reading a chapter shows you an idea once. These exercises make you use it ten different ways until it stops feeling new.

Every exercise has a worked solution. Every solution was run, and every output shown is the real output.

---

## The exercise sets

| Set | Covers | Exercises | Time | Solutions |
|---|---|---|---|---|
| [00 — Git and GitHub](00-git-and-github.md) | [Session 0](../../sessions/00-intro-to-git-and-github/) | 13 | ~45 min | [solutions](solutions/00-git-and-github.md) |
| [01 — How apps work](01-how-apps-work.md) | [Session 1](../../sessions/01-welcome-and-how-apps-work/) | 11 | ~45 min | [solutions](solutions/01-how-apps-work.md) |
| [02 — Environment setup](02-environment-setup.md) | [Session 2](../../sessions/02-full-environment-setup/) | 11 | ~45 min | [solutions](solutions/02-environment-setup.md) |
| [03 — Anatomy and hot reload](03-anatomy-and-hot-reload.md) | [Session 3](../../sessions/03-anatomy-and-hot-reload/) | 13 | ~1 hr | [solutions](solutions/03-anatomy-and-hot-reload.md) |
| [04 — Variables, types, null safety](04-variables-types-null-safety.md) | [Session 4](../../sessions/04-variables-types-null-safety/) | 16 | ~1.5 hrs | [solutions](solutions/04-variables-types-null-safety.md) |
| [05 — Operators, interpolation, final vs const](05-operators-interpolation-final-const.md) | [Session 5](../../sessions/05-operators-interpolation-final-const/) | 20 | ~2 hrs | [solutions](solutions/05-operators-interpolation-final-const.md) |
| [06 — Control flow](06-control-flow.md) | [Session 6](../../sessions/06-control-flow/) | 20 | ~2.5 hrs | [solutions](solutions/06-control-flow.md) |
| [07 — Functions, parameters, arrow syntax](07-functions-parameters-arrow-syntax.md) | [Session 7](../../sessions/07-functions-parameters-arrow-syntax/) | 23 | ~3 hrs | [solutions](solutions/07-functions-parameters-arrow-syntax.md) |
| [Final projects](final-projects.md) | Sessions 4–7 together | 2 projects | ~3 hrs | [solutions](solutions/final-projects.md) |

Do each set right after reading its chapter, while it's fresh. The final projects come last, once Session 7 is done.

---

## Difficulty

Every exercise is marked with a level. You don't have to finish every level before moving on — but try.

| Mark | Level | What it feels like |
|---|---|---|
| ★ | **Warm-up** | Straight out of the chapter. If one of these is hard, re-read that part of the chapter first |
| ★★ | **Practice** | Combines two ideas, or asks you to spot something. This is where most of the learning happens |
| ★★★ | **Challenge** | You'll have to stop and think. Getting stuck here is normal and useful |

---

## Five kinds of exercise

| Label | What you do |
|---|---|
| **Predict** | Read some code and write down what it will print — **before** you run it. Then run it and compare. Being wrong here is the point: the gap between what you expected and what happened is exactly where you learn |
| **Write** | Build something from a description |
| **Fix** | The code is broken on purpose. Find what's wrong, say *why*, fix it |
| **Explain** | Answer in your own words. Write full sentences — if you can't explain it, you don't quite have it yet |
| **Do** | A hands-on task in the terminal or in VS Code |

---

## Setting up (Sessions 4 to 7)

**Never do coursework inside the course folder.** Same rule as always — anything you change in there breaks `git pull`. Work in your own folder.

Make one practice project, once, in your own work folder:

```
cd my-flutter-work
dart create coursework
cd coursework
```

Then give **each exercise its own file** inside `bin/`. For exercise 4.1, create `bin/ex_4_1.dart`:

```dart
void main() {
  // your answer here
}
```

and run just that file:

```
dart run bin/ex_4_1.dart
```

One file per exercise means every exercise keeps its own variable names, nothing clashes, and all your work is still there when you want to look back at it.

Sessions 0 to 2 need only your terminal. Session 3 uses the Flutter app you made in Session 2 (`first_app`), or a fresh one from `flutter create`.

---

## Using the solutions

The solutions are in [`solutions/`](solutions/). Every exercise has an answer, an explanation of *why*, and for code, the exact output.

The runnable versions are in [`solutions/code/`](solutions/code/). You can run a whole session's answers at once — for example, from inside the course folder:

```
dart run coursework/sessions_0_to_7/solutions/code/session_05.dart
```

(Running a file doesn't change it, so this is safe to do in the course folder.)

**How to use them honestly:**

1. Try the exercise properly first. At least ten minutes on anything ★★ or harder.
2. If you're stuck, look at the solution's *first line only* — it usually points you in the right direction — and try again.
3. After you finish, compare with the solution anyway. There's often a shorter way, or a detail worth noticing.

Your code does **not** need to match the solution exactly. Different names, different wording, a different but valid approach — all fine. What matters is that it works and that you can explain every line.

---

## One thing that will confuse you if nobody says it

**VS Code and the terminal sometimes word the same error differently.**

The red squiggle in VS Code comes from Dart's *analyzer*. The red text in the terminal after `dart run` comes from Dart's *compiler*. They catch the same mistakes, but for some errors they phrase it differently:

| Mistake | VS Code says | Terminal says |
|---|---|---|
| Changing a `final` variable | `The final variable 'year' can only be set once.` | `Can't assign to the final variable 'year'.` |
| Too few arguments | `2 positional arguments expected by 'add', but 1 found.` | `Too few positional arguments: 2 required, 1 given.` |

Neither is wrong. Where they differ, the solutions show you both.

---

## Other coursework

- [Sessions 4–6 assessment](../module_1_sessions_4_to_6.md) — a shorter, test-style check on Sessions 4 to 6, with its own [solution](../module_1_sessions_4_to_6_solution.dart). Good to do *after* this workbook, as proof to yourself it stuck.
