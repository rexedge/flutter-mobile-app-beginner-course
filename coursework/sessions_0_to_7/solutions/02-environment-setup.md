# Solutions 02 — Environment Setup

[← Back to the exercises](../02-environment-setup.md) · [Workbook guide](../README.md)

> The `flutter doctor` output below uses Flutter's real wording, checked against Flutter's own source code. Your version numbers will differ from the examples; that's expected.

---

## 2.1 ★ Your version numbers

Any version number is a pass. Roughly:

```
git version 2.53.0.windows.3
```

```
Flutter 3.44.x • channel stable • https://github.com/flutter/flutter.git
...
Tools • Dart 3.12.x • DevTools 2.x.x
```

```
Dart SDK version: 3.12.x (stable) ...
```

**The one you got for free is Dart.** The Dart SDK comes *inside* the Flutter SDK — you never installed it separately. Notice that `flutter --version` even reports it on its last line. Flutter is built with Dart, so it ships with its own copy.

---

## 2.2 ★ Read the markers

1. `[√]` — installed and working. Nothing to do.
2. `[X]` — something's **missing or broken**. This needs fixing before you can build for that platform.
3. `[!]` — a **caution**. Read it. Sometimes it matters, sometimes it's nothing — exercise 2.4 is about telling the two apart.

---

## 2.3 ★ Command match

**1-C, 2-F, 3-E, 4-G, 5-B, 6-A, 7-D**

| Command | What it does |
|---|---|
| `flutter doctor` | C. Health-checks your whole setup |
| `flutter doctor -v` | F. The same check, with full detail |
| `flutter create my_app` | E. Generates a new project from a template |
| `flutter run` | G. Builds your project and launches it on a device |
| `mkdir projects` | B. Makes a new folder |
| `cd projects` | A. Moves your terminal into a folder |
| `flutter doctor --android-licenses` | D. Accepts the Android license agreements |

---

## 2.4 ★★ Diagnose this doctor

1. **The Android toolchain line needs fixing.** It says outright that some licenses aren't accepted, and until they are, Flutter can't build Android apps.

2. They should run:

```
flutter doctor --android-licenses
```

It shows each license agreement one at a time and asks them to accept it. They type `y` and press <kbd>Enter</kbd> at each prompt — there can be several. Then run `flutter doctor` again, and that line should become `[√]`.

3. **`[!] Connected device` / `No devices available`** just means no emulator is running and no phone is plugged in *right now*. It's not a problem with the setup. The moment they start the emulator, it goes away.

**The lesson:** both lines say `[!]`, and they mean completely different things. **Never judge a `[!]` by its marker — read the line underneath it.**

---

## 2.5 ★★ "Not recognized"

1. **The terminal was opened before Flutter was added to PATH.** A terminal reads the PATH list once, when it opens. This one opened too early, so it's still using the old list, which doesn't include Flutter.

2. **Close every terminal window — and VS Code too — then open a fresh terminal** and try again. On a Mac, the message is `command not found: flutter`; same cause, same fix.

If a *fresh* terminal still doesn't recognise it, Flutter genuinely isn't on PATH yet. Go back to Session 2, step 4c.

---

## 2.6 ★★ PATH, in your own words

**One example answer:**

> PATH is a list of folders your computer searches whenever you type a command — like your phone's contacts list, where you just say a name and the phone already knows the number. Adding Flutter to PATH puts Flutter's folder on that list, so typing `flutter` anywhere finds it. Without it, you'd have to type the full location of Flutter's folder every single time.

---

## 2.7 ★★ Nowhere to run

```
No supported devices connected.
```

It means **Flutter has nowhere to launch the app** — no emulator is running, and no phone is plugged in.

The fix: start your emulator from Android Studio's **Device Manager**, wait until it has fully booted to the home screen, then run `flutter run` again.

---

## 2.8 ★★ A fresh project, start to finish

```
mkdir practice
cd practice
flutter create setup_check
cd setup_check
flutter run
```

Between `cd setup_check` and `flutter run`, start your emulator and let it boot.

To stop the app: press <kbd>Ctrl</kbd>+<kbd>C</kbd> in the terminal where it's running. (Typing `q` in that terminal also quits cleanly.)

**The first launch is slow** — often a few minutes — because Flutter compiles everything from scratch. Later launches are much faster, because it reuses most of that work.

Forgetting the second `cd` is the classic mistake. `flutter run` inside `practice` fails because there's no Flutter project *there* — the project is one folder deeper.

---

## 2.9 ★★★ The wizard that never finished

The most likely cause: **Android Studio's first-run setup wizard never ran to completion.** Installing the Android Studio app isn't enough on its own. The first time it opens, it runs a wizard that downloads the actual Android SDK. If your friend closed Android Studio before the wizard finished — or never opened it at all after installing — those pieces are simply not there.

The fix: open Android Studio, let the setup wizard run all the way through to the end, then run `flutter doctor` again.

---

## 2.10 ★★★ Your rescue checklist

**The right first step is `flutter doctor`.** Everything else follows from what it tells you.

**One example checklist:**

1. Open a **fresh** terminal — not one that's been open for days.
2. Run `flutter doctor -v` and read every `[X]` and `[!]` line, including the detail underneath.
3. Fix whatever it names, most serious first. If it tells you a command to run, run exactly that.
4. If a command isn't recognised at all, check PATH — then close every terminal and VS Code, and reopen.
5. If the app won't launch, check the emulator is actually running and fully booted.
6. Run `flutter doctor` one more time to confirm everything's `[√]`.

Yours doesn't need to match. It passes if it starts with `flutter doctor`, and includes the fresh-terminal trick somewhere.

---

## 2.11 ★★★ Why a new window?

When a terminal window opens, it takes a **copy** of your computer's settings — including the PATH list — and keeps using that copy for as long as it stays open. Installing something afterwards changes the real settings, but not the copy the old window is holding. A fresh window takes a fresh copy, with the new change included.

That's why "close everything and reopen" fixes so many setup problems. It isn't superstition — it's making the terminal re-read its settings.
