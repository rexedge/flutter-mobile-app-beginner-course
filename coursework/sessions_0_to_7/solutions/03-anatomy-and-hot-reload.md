# Solutions 03 — Anatomy and Hot Reload

[← Back to the exercises](../03-anatomy-and-hot-reload.md) · [Workbook guide](../README.md)

> The error messages in 3.8 are real — each typo was made in the actual Session 3 app and run through Flutter's analyzer.

---

## 3.1 ★ Where does it go?

1. Your screens' Dart code → **`lib/`**
2. Name, version, packages → **`pubspec.yaml`**
3. Files generated when compiling → **`build/`**
4. Code that checks your app still works → **`test/`**

**Never edit `build/` by hand.** Flutter deletes and regenerates it whenever it needs to. Anything you change in there gets silently wiped the next time the app builds — so an edit there isn't just pointless, it's confusing, because it seems to work and then vanishes.

---

## 3.2 ★ The boot sequence

```
main()  →  runApp()  →  MyApp  →  the screen you see
```

- **`main()`** is the very first code that runs when the app starts — the entry point of every Dart program.
- **`runApp()`** hands your app to Flutter and tells it to put it on the screen.

---

## 3.3 ★ Three ways to trigger it

1. **Hot reload:** save the file (<kbd>Ctrl</kbd>+<kbd>S</kbd>, or <kbd>Cmd</kbd>+<kbd>S</kbd> on a Mac). You can also press lowercase `r` in the terminal running `flutter run`, or click the lightning bolt in VS Code.
2. **Hot restart:** press capital `R` in the terminal, or click the circular-arrow icon in VS Code.
3. **Stop completely:** press <kbd>Ctrl</kbd>+<kbd>C</kbd> in the terminal, or `q`, or the red square in VS Code.

---

## 3.4 ★ Make it yours — again

The four changes:

```dart
const Text('Tap the button and watch this number climb:'),   // 1 — your own words
```

```dart
colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),  // 2
```

```dart
child: const Icon(Icons.favorite),                            // 3
```

```dart
tooltip: 'Add one',                                           // 4
```

**Did the counter reset?** No — not once. All four are hot-reload changes, and hot reload keeps your app's state. The number you tapped up to stays exactly where it was through every edit.

---

## 3.5 ★★ Reload, restart, or full run?

| | Change | You need | Counter kept? |
|---|---|---|---|
| 1 | AppBar title text | **Hot reload** | Yes |
| 2 | Seed colour | **Hot reload** | Yes |
| 3 | A `print` inside `main()` | **Hot restart** | No — resets to 0 |
| 4 | A new package in `pubspec.yaml` | **Full `flutter run`** | No — the app starts fresh |
| 5 | The button's icon | **Hot reload** | Yes |

**The pattern:** hot reload handles changes to what's on screen. Anything to do with how the app *starts* needs a hot restart, because hot reload never re-runs startup code. And new packages need a full run, so they can be downloaded and built in.

---

## 3.6 ★★ The value that won't change

1. Most people predict **100**.
2. It actually shows **5**. Hot reload changed nothing you can see.
3. After a hot restart it shows **100**.
4. **Why:** hot reload keeps your app's state — including the counter's *current* value. `int _counter = 0;` only sets the *starting* value, and it only runs when the counter is first created. The counter was created long ago, when the app launched; hot reload kept that same counter and its value of 5, so the new starting value was never used. A hot restart throws the old state away and starts fresh — so the new starting value, 100, finally gets used.

**This is the single most useful thing to understand about hot reload:** it changes your code, not your app's current data. If a change doesn't seem to work, and it's about a starting value or something that happens at startup, try a hot restart before assuming your code is wrong.

---

## 3.7 ★★ Draw the tree

```
MaterialApp
└── MyHomePage
    └── Scaffold
        ├── AppBar
        │   └── Text                  (the title)
        ├── Center
        │   └── Column
        │       ├── Text              ('You have pushed the button...')
        │       └── Text              (the number)
        └── FloatingActionButton
            └── Icon
```

The chapter's simplified version left out `Center`, `FloatingActionButton` and `Icon`. It also left out `MyHomePage`, which sits between `MaterialApp` and `Scaffold` — it's a widget too, just one written in the same file rather than built into Flutter.

If yours didn't include `MyHomePage`, that's fine; it wasn't in the list. Everything else should be nested exactly as above.

---

## 3.8 ★★ Fix the typos

**(a) `Colors.tael`**

```
The getter 'tael' isn't defined for the type 'Colors'.
```

Fix: `Colors.teal`. A misspelled name means Flutter goes looking for a colour called `tael`, and there isn't one.

**(b) `MainAxisAlignment.centre`**

```
There's no constant named 'centre' in 'MainAxisAlignment'.
```

Fix: `MainAxisAlignment.center`. **This one catches everyone who learned British spelling.** Flutter always uses American spelling — `center`, `color`. Worth remembering now, because you'll type both of those constantly.

**(c) `Icons.thumbs_up`**

```
The getter 'thumbs_up' isn't defined for the type 'Icons'.
Arguments of a constant creation must be constant expressions.
```

Fix: `Icons.thumb_up` — singular. That second error is explained in 3.12.

**(d) The missing comma**

```
Expected to find ','.
```

Fix: add a comma at the end: `title: 'My First Flutter App',`. Every property inside `MaterialApp(...)` must be separated from the next by a comma.

**All four follow the same fix:** read the message, find the exact spot it names, and compare it — letter by letter — with what it should be.

---

## 3.9 ★★ Why didn't anything change?

**Yes, it worked.** The change went through; you just can't see it on the app's screen.

That `title` is the name your **phone's operating system** uses for the app — for example, in the app-switcher when you swipe between recent apps. It isn't displayed anywhere *inside* the app. The title you see at the top of the screen is a different one: `MyHomePage(title: ...)`.

Lesson: "nothing changed on screen" doesn't always mean "it didn't work." Sometimes the thing you changed just lives somewhere else.

---

## 3.10 ★★★ The main() experiment

After **saving** (a hot reload): `starting up` does **not** appear.

After **capital `R`** (a hot restart): it appears in the terminal, usually looking like this on Android:

```
I/flutter (12345): starting up
```

**What it tells you:** hot reload doesn't run `main()` again. It swaps your new code into the app that's already running — and `main()` already ran, once, when the app first started. A hot restart starts the whole app over, so `main()` runs again, and your `print` runs with it.

---

## 3.11 ★★★ Count by two

Any of these work:

```dart
_counter++;
_counter++;
```

```dart
_counter = _counter + 2;
```

```dart
_counter += 2;
```

`_counter++` means "add one to `_counter`." Doing it twice adds two. The second version says the same thing in full: take the current value, add two, and store the result back in `_counter`. The third is shorthand for the second.

You'll learn `++` properly in Session 6 and the arithmetic in Session 5 — but you could read it well enough to change it today. That's worth noticing.

**Did you need a hot restart?** No. Changing what happens on each tap is a hot-reload change. The counter even keeps its value while you edit.

---

## 3.12 ★★★ One typo, two errors

The line is:

```dart
child: const Icon(Icons.thumbs_up),
```

The **first** error is the real one: there's no icon called `thumbs_up`.

The **second** — `Arguments of a constant creation must be constant expressions` — is a knock-on effect. The word `const` in front of `Icon` promises that everything inside it is fixed and known in advance. Dart can't check that promise about something that doesn't exist, so it complains about that too.

**Fix the first error.** Change it to `thumb_up`, and the second error disappears on its own, because the thing it was complaining about is now fine.

**The rule, and it'll save you hours:** when you see several errors, fix the **first** one and run again. One mistake often causes a pile of confused messages after it.

---

## 3.13 ★★★ Read before you touch

1. **The counter's current number.** `'$_counter'` turns the number into text so the `Text` widget can show it.
2. **The size and style of that text.** `headlineMedium` is one of the preset text styles in the app's theme.
3. **With `headlineLarge`, the number gets bigger.** Same style family, larger size.

Flutter's theme has a whole ladder of these, from biggest to smallest — `display`, `headline`, `title`, `body` and `label` — each in `Large`, `Medium` and `Small`. You'll use them properly from Session 11.
