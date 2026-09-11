# Coursework 03 — Anatomy and Hot Reload

**Covers:** [Session 3 — Anatomy and Hot Reload](../../sessions/03-anatomy-and-hot-reload/) · **13 exercises** · about 1 hour
**Solutions:** [solutions/03-anatomy-and-hot-reload.md](solutions/03-anatomy-and-hot-reload.md)

Use the `first_app` project you made in Session 2 — or make a fresh one in your work folder with `flutter create hot_reload_practice`. Start your emulator and `flutter run` it before you begin. Most of these exercises need the app running.

All the code below lives in `lib/main.dart`.

---

## Warm-up ★

### 3.1 ★ Where does it go?

**Explain.** For each item, say which file or folder it belongs in — `lib/`, `pubspec.yaml`, `build/`, or `test/`.

1. The Dart code for your app's screens
2. Your app's name, version, and the list of packages it uses
3. Files Flutter generates when it compiles your app
4. Code that automatically checks your app still works

Then: which one of those four should you **never** edit by hand, and why?

---

### 3.2 ★ The boot sequence

**Explain.** Put these four in the order they happen when your app starts:

- `MyApp`
- `runApp()`
- the screen you see
- `main()`

Then say, in one sentence each, what `main()` does and what `runApp()` does.

---

### 3.3 ★ Three ways to trigger it

**Explain.** How do you trigger each of these?

1. A hot reload
2. A hot restart
3. Stopping the app completely

---

### 3.4 ★ Make it yours — again

**Do.** With your app running, make each change below. **Save after each one** and watch the emulator before moving on.

1. Change the text `'You have pushed the button this many times:'` to something in your own words.
2. Change the seed colour to `Colors.orange`.
3. Change the floating button's icon to `Icons.favorite`.
4. Change the `tooltip` from `'Increment'` to `'Add one'`. (Long-press the button on the emulator to see it.)

Before you start, tap the button a few times so the counter isn't zero. Did the counter reset at any point during these four edits?

---

## Practice ★★

### 3.5 ★★ Reload, restart, or full run?

**Explain.** For each change, say which you'd need — **hot reload**, **hot restart**, or a **full `flutter run`** — and whether the counter would keep its current value.

1. Changing the AppBar title text
2. Changing the seed colour
3. Adding `print('starting up');` inside `main()`, before `runApp(...)`
4. Adding a new package to `pubspec.yaml`
5. Changing the button's icon

---

### 3.6 ★★ The value that won't change

**Predict, then Do.** Tap the button until the counter shows **5**. Now find this line:

```dart
int _counter = 0;
```

and change it to:

```dart
int _counter = 100;
```

1. **Before you save**, predict: after a hot reload, what will the counter show — 5, 100, or 0?
2. Save. What does it actually show?
3. Now press capital `R` in the terminal for a hot restart. What does it show now?
4. Explain what happened. Why didn't the hot reload show 100?

Change it back to `0` when you're done.

---

### 3.7 ★★ Draw the tree

**Write.** Using the same style as the chapter, draw the widget tree for the counter screen. Include these widgets, nested correctly:

`MaterialApp`, `Scaffold`, `AppBar`, `Center`, `Column`, `FloatingActionButton`, `Icon`, and every `Text`.

Hint: there are **three** `Text` widgets. Look carefully at the file — the chapter's simplified tree left some of these out.

---

### 3.8 ★★ Fix the typos

**Fix.** Each of these lines has one typo. For each: predict the error message VS Code shows, then fix it.

**(a)**

```dart
colorScheme: ColorScheme.fromSeed(seedColor: Colors.tael),
```

**(b)**

```dart
mainAxisAlignment: MainAxisAlignment.centre,
```

**(c)**

```dart
child: const Icon(Icons.thumbs_up),
```

**(d)**

```dart
title: 'My First Flutter App'
theme: ThemeData(
```

(For (d), look at the *end* of the first line.)

---

### 3.9 ★★ Why didn't anything change?

**Explain.** You changed `title: 'Flutter Demo'` (the one inside `MaterialApp`) to `title: 'My Amazing App'` and saved. Hot reload succeeded. But nothing on the screen changed.

Did it work? Where would that title actually show up?

---

## Challenge ★★★

### 3.10 ★★★ The main() experiment

**Do.** This is the chapter's stretch goal. With your app running:

1. Add `print('starting up');` as the first line inside `main()`, then save.
2. Look at the terminal where `flutter run` is running. Did `starting up` appear?
3. Press capital `R`. Look at the terminal again.

Write one or two sentences explaining what you saw, and what it tells you about which code hot reload re-runs.

---

### 3.11 ★★★ Count by two

**Do.** Find this function:

```dart
void _incrementCounter() {
  setState(() {
    _counter++;
  });
}
```

Change it so each tap adds **2** instead of 1. Save, then tap the button a few times to confirm.

You haven't been taught this syntax formally yet — that's Sessions 5 and 6. Guess what `_counter++` does from its name and what happens on screen, then work out a way to add two. There's more than one way.

---

### 3.12 ★★★ One typo, two errors

**Explain.** In 3.8(c), a single typo — `Icons.thumbs_up` — makes VS Code show **two** separate errors, not one. Why might one mistake produce two error messages? And which of the two should you fix first?

---

### 3.13 ★★★ Read before you touch

**Explain.** Without running anything, look at this line from the file:

```dart
Text(
  '$_counter',
  style: Theme.of(context).textTheme.headlineMedium,
),
```

1. What does this widget show on the screen?
2. What do you think `headlineMedium` controls?
3. Guess: what would change if it said `headlineLarge` instead? Try it and see if you were right.

---

## Done?

- [ ] Every exercise attempted
- [ ] Your app still runs, with your own title, colour, text and icon
- [ ] You saw hot reload keep the counter **and** saw hot restart reset it, with your own eyes
- [ ] You checked your answers against the [solutions](solutions/03-anatomy-and-hot-reload.md)
