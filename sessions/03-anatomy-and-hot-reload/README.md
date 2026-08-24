# Session 3 — Anatomy of a Flutter Project + Hot Reload

**Module 0 — Foundations & Setup** · Session 3 of 36 · about 18 minutes to read
**Code for this session:** [`code/starter/first_app`](code/starter/first_app) → [`code/final/first_app`](code/final/first_app)

---

## What you'll be able to do by the end

- Open any Flutter project and explain what every top-level file and folder is for
- Read `lib/main.dart` well enough to know how an app boots up
- Use **hot reload** to see your own code change on screen in under a second
- Explain why hot reload keeps your app's state and hot restart doesn't
- Read the error Flutter gives you when hot reload refuses to apply a change

## Before you start

- Finish [Session 2](../02-full-environment-setup/). You need a working `flutter run`.
- Open your own `first_app` project from Session 2 in VS Code, and start it with `flutter run`. Leave it running for this whole session.

This is the first session that doesn't start from zero. You're carrying your own project forward.

---

## The big idea

Start your app and tap the **+** button five times. The counter reads 5.

Now, without stopping anything, change one word in the code — `Colors.deepPurple` to `Colors.teal` — and save the file.

The entire app's colour scheme shifts from purple to teal. App bar, button, everything. **And the counter still reads 5.**

Nothing restarted. Nothing lost its place. One word changed, one save, and a running app updated in under a second while remembering exactly where you left it.

That's **hot reload**, and it is the single feature that makes Flutter development feel different from almost everything else. It was promised back in Session 1. Today you get it for real.

Two things today, and only two: **what's inside a Flutter project**, and **how to move fast inside it**.

This is also the last session of Module 0. Next session, setup stops entirely and you start actually writing code.

**"Haven't we been writing code already?"** Not really. Session 2 was you running a command that generated code for you. Today you read that generated code closely for the first time, but you're still not writing new logic from scratch. That starts in Session 4.

---

## 1. Anatomy of a Flutter project

> **Project anatomy** — what every folder in your project is actually for.

Every project `flutter create` generates has the same skeleton. Once you know it, you can open any Flutter project on the internet and immediately know where to look.

Expand `first_app` in VS Code's sidebar. Here's what you're seeing:

```
first_app/
├── lib/                  ← your app code lives here
│   └── main.dart
├── pubspec.yaml          ← project ID card + shopping list
├── test/                 ← automated tests
├── android/  ios/  web/  ← platform wrapping
│   windows/  macos/  linux/
└── build/                ← auto-generated output, never touch
```

### `lib/` — where you actually work

Short for "library." **This is the one folder you'll spend almost all your time in, for the rest of this course.** Everything you build lives here.

> **If this project were a house,** `lib` is the house itself — the rooms you actually live in and decorate.

### `pubspec.yaml` — your project's ID card and shopping list

Open it. This file describes your entire project: its name, its version, and critically, every external package it depends on.

> **Dependency** (also called a package) — someone else's code your project relies on.

A dependency is a chunk of pre-written code — from Flutter's team or another developer — that your project pulls in instead of you writing it yourself.

Look at the `dependencies:` section. Right now you depend on exactly two things: Flutter itself, and a small icon pack called `cupertino_icons`. Session 29 is where dependencies get genuinely exciting, when you pull in a package that talks to the real internet.

Now find the `environment:` section:

```yaml
environment:
  sdk: '>=3.12.0 <4.0.0'
```

That line tells the project exactly which Dart version it needs — Dart 3.12, the version this whole course is built on. Pinning it down means the project behaves identically for you as it does for everyone else.

### Everything else, fast

| Folder | What it's for |
|---|---|
| `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` | Platform-specific wrapper code — the thin shell that turns your one Dart project into a real Android app, a real iPhone app, and so on. You will barely open these all course. Flutter handles them |
| `test/` | Automated tests. Not on our radar in this course |
| `build/` | Entirely auto-generated output. **Never hand-edit anything in here** — Flutter regenerates it constantly |

> **Think of `android/` and `ios/`** like the same blueprint printed for two different building codes. Same house design, slightly different permits for each city.

**One more time, fast:** `lib` is where you build. `pubspec.yaml` is your ID card and shopping list. The platform folders are wrapping paper. Everything else, ignore for now.

---

## Try it yourself #1

Open your own `first_app` project. Find `pubspec.yaml` and answer two questions out loud:

1. What is your project's name?
2. What Dart SDK version does it require?

Then open `lib/main.dart` — don't read it yet, just confirm you can find it.

<details>
<summary><strong>Where to look</strong></summary>

`pubspec.yaml` is at the **very top level** of your project folder — not inside `lib/`. A common mistake is hunting for it in `lib/` and concluding it's missing.

- The `name:` field at the very top is your project name. It should read `first_app` if you followed Session 2 exactly.
- The SDK version is under `environment:` → `sdk:`. It should read something like `'>=3.12.0 <4.0.0'`.

`lib/main.dart` is the only `.dart` file in `lib/` right now.

If you found both, you know your way around the folder structure every Flutter project in the world shares. That's not nothing on day three.
</details>

---

## 2. Reading `main.dart`

Open `lib/main.dart` and read it from the top — not every detail, just the shape of it.

### The entry point

```dart
void main() {
  runApp(const MyApp());
}
```

> **`main()`** — the very first thing that runs when your app starts.

Every Dart program — not just Flutter, *every* Dart program — starts by running a function called `main()`. It's the **entry point**: the one guaranteed first piece of code that executes.

> **`runApp()`** — hands your app to Flutter and puts it on screen.

Inside `main()`, this file calls exactly one function: `runApp()`, and hands it `MyApp`. That single call tells Flutter *"here's my entire app, take it from here and put it on screen."*

So the boot sequence is short:

```
main()  →  runApp()  →  MyApp  →  the screen you see
```

### `MyApp`

```dart
class MyApp extends StatelessWidget {
```

`MyApp` describes the whole app in broad strokes — its title, its colour theme, and which screen to show first, which right now is `MyHomePage`.

### The two classes we're skipping on purpose

```dart
class MyHomePage extends StatefulWidget
class _MyHomePageState extends State<MyHomePage>
```

You'll notice these say `StatefulWidget` and `State`. **They're being named here, not taught.**

That's a deliberate choice, not a gap. Session 16 is dedicated entirely to this pattern, and it'll make far more sense after ten sessions of practice. For today, know only this: **this is the part of the file responsible for remembering the counter's number.**

### The shape underneath

> **Widget tree** — widgets nested inside widgets, like a family tree.

Notice how `Scaffold` contains a `Column`, which contains a `Text` and a button?

```
MaterialApp
└── Scaffold
    ├── AppBar
    │   └── Text
    └── Column
        ├── Text
        └── Text
```

Widgets nest inside other widgets, forming a shape called a **widget tree**. You build these yourself starting in Module 2 (Session 10). Today, just notice the nesting is *there* — **the indentation in this file isn't decoration, it's structure.**

That's the whole surface-level tour. Four things happen: `main()` runs, it calls `runApp()`, `MyApp` describes the app, and somewhere inside, a `Text` widget is showing your counter's current number.

---

## 3. Hot reload, for real

> **Hot reload** — inject new code into the running app, keep its state.

When your app is running through `flutter run` and you save a file, Flutter takes your updated code and injects it directly into the still-running app, on the fly — without closing it, without losing whatever was happening inside it.

That's why the counter stayed at 5.

> **Think of hot reload like changing a lightbulb while the rest of the house stays powered on.** You're not shutting off electricity to the whole building to swap one thing out.

**Try it now.** With your app running, find this line in `main.dart`:

```dart
home: const MyHomePage(title: 'Flutter Demo Home Page'),
```

Change the text to anything you like, and press <kbd>Ctrl</kbd>+<kbd>S</kbd> (Mac: <kbd>Cmd</kbd>+<kbd>S</kbd>).

Watch the emulator. New title text. Same counter value. That's the whole trick, every time.

### Hot restart

> **Hot restart** — relaunches the app fresh. Resets state, still fast.

There's a second, related tool. It also skips the slow full-recompile-from-scratch process, but it relaunches your app from the very beginning, as if you'd just opened it.

Click into the terminal running `flutter run` and press capital **`R`**.

The counter goes back to `0`.

> **State preservation** — hot reload keeps your app's current data; hot restart clears it.

### Three speeds

| | Speed | Keeps your app's state? | When you use it |
|---|---|---|---|
| **Hot reload** — save the file | Fastest | **Yes** | Almost always |
| **Hot restart** — capital `R` in the terminal | Fast | No — resets to a fresh launch | Renaming a class, changing what happens at startup |
| **Full `flutter run`** again | Slowest | No | After adding a new package to `pubspec.yaml`, or certain native-level changes |

**"How do I trigger each one in VS Code?"** Saving the file triggers hot reload automatically — that's what you'll use nearly always. The lightning bolt icon in the debug toolbar does it manually. For hot restart, it's the circular arrow icon right next to it, or capital `R` in the terminal.

---

## 4. Make it yours

Let's put hot reload through its paces. Four small edits, hot-reloading after every single one.

There's no mini-app in Module 0 — that starts with the Quiz Engine in Session 9. This is pure workflow practice.

### Edit 1 — the app's title

```dart
title: 'Flutter Demo',          // before
title: 'My First Flutter App',  // after
```

Save. **You won't see a visual change**, and that's a useful lesson on its own: not everything you touch shows up immediately on screen. This particular title is what your phone's app-switcher shows, not the app itself.

### Edit 2 — the seed colour

```dart
colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),  // before
colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),        // after
```

Save. The entire app's colour scheme updates instantly. **One word**, and Flutter recalculates a complete, readable colour palette from that single seed. Pick any colour you like — `Colors.orange`, `Colors.indigo`, `Colors.green`.

### Edit 3 — the home screen title

```dart
home: const MyHomePage(title: 'Flutter Demo Home Page'),  // before
home: const MyHomePage(title: 'My First App'),            // after
```

Save. The AppBar text updates. **Put your own name in this one.** It's meant to be yours.

### Edit 4 — the button's icon

```dart
child: const Icon(Icons.add),        // before
child: const Icon(Icons.thumb_up),   // after
```

Save. The floating button changes from a plus sign to a thumbs-up.

**"How do I know what other icons exist?"** Type `Icons.` in VS Code and a dropdown of hundreds of built-in icon names appears, with live previews. Nothing to memorise.

---

Four edits, four hot reloads, maybe ninety seconds — and the app looks meaningfully different. Not once did you wait for a rebuild, lose your counter value, or touch the terminal.

---

## Break it on purpose

A very true-to-life mistake this time. Let's misspell something.

Find the floating action button and remove one `s` from `onPressed`:

```dart
onPresed: _incrementCounter,
```

Save.

A red squiggly line appears under `onPresed`, hot reload **fails**, and you get:

```
The named parameter 'onPresed' isn't defined.
```

Hot reload didn't silently do nothing. It **refused, and told you exactly why.**

This is a new flavour of the syntax error from Session 1 — same idea, different shape. No bracket left open this time; a real word Flutter was expecting just got misspelled. The fix is identical: read exactly what it's pointing at, compare it to what you meant to type, fix that one spot.

Correct it back to `onPressed`, save, and hot reload succeeds. About five seconds, start to finish.

**Notice what didn't happen.** No panic, no restarting VS Code, no re-running anything from scratch. That calm, boring *"read it, fix it, move on"* reflex is the actual skill. You're building it one small break at a time, on purpose, every session.

---

## Try it yourself #2

Make **three of your own** hot-reload edits to `first_app` — your own title, your own colour, your own icon.

After each one, save and confirm you see the update on your own emulator **before** making the next change.

<details>
<summary><strong>You're done when</strong></summary>

Each change appeared on your emulator within about a second of saving, and your counter's current value never reset in between edits.

**If a change didn't show up:** check that `flutter run` is still active in your terminal. Hot reload only works while the app is actually running.

If your app now looks like *yours* instead of the template's, that's the entire session working as intended.
</details>

---

## Three things to remember

1. **`lib/main.dart` runs `main()`, which calls `runApp()`** — that's how every Flutter app boots.
2. **Hot reload injects saved changes into your running app without losing its state.** Hot restart resets state but still skips a full rebuild.
3. **When hot reload refuses to apply a change, it's telling you something specific.** Read it.

---

## Cheat sheet

**Project anatomy:**

| Folder / file | What it's for |
|---|---|
| `lib/` | Your actual app code — where you spend nearly all your time |
| `pubspec.yaml` | Your project's name, version, and every package it depends on |
| `android/`, `ios/`, `web/`, etc. | Platform-specific wrapping — rarely touched directly |
| `test/` | Automated tests (not covered in this course) |
| `build/` | Fully auto-generated output — never hand-edit |

**Reading `lib/main.dart`:**

| Line / block | What it does |
|---|---|
| `void main() { runApp(const MyApp()); }` | The entry point — the first thing that runs, and the call that hands your app to Flutter |
| `class MyApp extends StatelessWidget` | Describes the whole app: title, theme, and which screen to show first |
| `class MyHomePage extends StatefulWidget` / `_MyHomePageState` | The part that remembers the counter's value (full lesson: Session 16) |
| Nested widgets (`Scaffold` → `Column` → `Text`) | The widget tree — widgets containing widgets (full lesson: Session 10) |

**Hot reload vs. hot restart vs. full restart:**

| | Speed | Keeps app state? | When to use |
|---|---|---|---|
| Hot reload — save the file | Fastest | Yes | Almost always |
| Hot restart — capital `R` in terminal | Fast | No — fresh launch | Renaming a class, changing startup behaviour |
| Full `flutter run` again | Slowest | No | Adding a new package to `pubspec.yaml` |

---

## When it goes wrong

| What you'll see | What it actually means | The fix |
|---|---|---|
| `The named parameter 'onPresed' isn't defined` (or similar, after a typo) | You misspelled a real widget property name — same idea as a Session 1 syntax error, different shape | Read exactly which name it points at, compare to what you meant to type, fix that one spot, save again |
| Hot reload runs but nothing visibly changes | Some changes — like editing what happens inside `main()`, or adding a new field with an initial value — aren't things hot reload can apply on the fly | Use hot restart instead: capital `R` in the terminal, or the circular-arrow icon |
| Saving does nothing at all — no error, no update | `flutter run` may no longer be active. The terminal session might have stopped, or the app may have crashed silently | Check your terminal for a still-running `flutter run`. If it stopped, run `flutter run` again |
| You changed something in `build/` and it vanished | `build/` is regenerated constantly by Flutter | Nothing to fix — just never edit anything in there. Your work belongs in `lib/` |

---

## Homework

**Estimated time: 25 minutes.**

Make **at least three more** hot-reload edits to `first_app`, beyond today's four. Then screenshot your finished, personalised app.

**Ideas if you're stuck:**

- Change the button's `tooltip` text
- Change `mainAxisAlignment` to a different value (try `MainAxisAlignment.start`) and see what shifts
- Rewrite the "You have pushed the button this many times:" string in your own voice
- Try a completely different seed colour

**You're done when:**

- [ ] At least three new edits beyond the four made in the session
- [ ] Each edit was confirmed live via hot reload — not just written and never run
- [ ] One screenshot of the final result, showing your personalised title, colour, and text

**Why this matters:** this is the last "just practising the workflow" homework before real coding starts. Getting fast and comfortable with save-and-see now means Module 1's programming lessons aren't slowed down by fumbling with the tools.

### Stretch goal

Deliberately make a change hot reload **can't** handle. Edit the `main()` function itself — for example, add a `print('starting up');` line before `runApp(const MyApp())`.

Save, and notice hot reload either does nothing or prompts you to restart. Trigger a hot restart to apply it.

Write one sentence on what you observed. That's your first hands-on encounter with hot reload's actual limits — found by you, before anyone told you where they are.

---

## Check yourself

1. **Where does almost all of your Flutter code live?**
   a) `build/`
   b) `lib/`
   c) `android/`
   d) `test/`

2. **What does `pubspec.yaml` describe?**
   a) Your project's name, version, and dependencies
   b) The colours used in your app
   c) A list of every widget in your app
   d) Your Android emulator settings

3. **What is the very first function that runs when a Dart/Flutter app starts?**
   a) `build()`
   b) `runApp()`
   c) `main()`
   d) `MyApp()`

4. **What's the key difference between hot reload and hot restart?**
   a) Hot reload is slower
   b) Hot restart preserves state, hot reload doesn't
   c) Hot reload preserves your app's current state; hot restart resets it
   d) There's no real difference

5. **You save a file and hot reload silently does nothing. What's the first thing to check?**
   a) Restart your whole computer
   b) Confirm `flutter run` is still actively running in your terminal
   c) Reinstall Flutter
   d) Delete the project and start over

<details>
<summary><strong>Answers</strong></summary>

1. **b** — `lib/` is where your actual app code lives; that's where you'll spend nearly all your time.
2. **a** — `pubspec.yaml` is your project's ID card: name, version, and dependencies.
3. **c** — `main()` is Dart's universal entry point; it's what calls `runApp()`.
4. **c** — Hot reload injects changes into the still-running app and keeps its current state; hot restart relaunches fresh and resets it.
5. **b** — The most common cause is simply that the app isn't currently running. Hot reload only works against a live `flutter run` session.
</details>

---

## New words from this session

`project anatomy` · `pubspec.yaml` · `dependency (package)` · `entry point / main()` · `runApp()` · `widget tree` · `hot reload` · `hot restart` · `state preservation`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Next up

**[Session 4 — Variables, Data Types, Null Safety](../04-variables-types-null-safety/)**

**That's Module 0, done.** Three sessions: one working development environment, and hot reload in your hands for good.

Starting next session, we stop touching pixels for a while and go underneath them. Module 1 is **Dart** — the actual programming language powering everything you've clicked and dragged so far. It starts with variables, and it ends nine sessions from now with a mini-app you build yourself: a working **Quiz Engine**.

Session 4 is where that path starts.

---

[← Session 2](../02-full-environment-setup/) · [Course home](../../README.md) · [Glossary](../../glossary.md) · [Session 4 →](../04-variables-types-null-safety/)
