# Coursework 02 — Environment Setup

**Covers:** [Session 2 — Full Environment Setup](../../sessions/02-full-environment-setup/) · **11 exercises** · about 45 minutes
**Solutions:** [solutions/02-environment-setup.md](solutions/02-environment-setup.md)

Your setup is done — this set makes sure you can **check** it, **read** what it tells you, and **fix** it when it breaks. You will break it one day. Everyone does.

---

## Warm-up ★

### 2.1 ★ Your version numbers

**Do.** Open a fresh terminal and run each of these. Write down the version number each one reports.

```
git --version
flutter --version
dart --version
```

Then answer: which of those three did you get as part of installing Flutter, without installing it separately?

---

### 2.2 ★ Read the markers

**Explain.** `flutter doctor` marks every line with one of three symbols. Say what each means, and whether it needs fixing.

1. `[√]`
2. `[X]`
3. `[!]`

---

### 2.3 ★ Command match

**Explain.** Match each command to what it does. Answer as pairs, like `1-C`.

| Command | | What it does |
|---|---|---|
| 1. `flutter doctor` | | A. Moves your terminal into a folder |
| 2. `flutter doctor -v` | | B. Makes a new folder |
| 3. `flutter create my_app` | | C. Health-checks your whole setup |
| 4. `flutter run` | | D. Accepts the Android license agreements |
| 5. `mkdir projects` | | E. Generates a new Flutter project from a template |
| 6. `cd projects` | | F. The same health check, with full detail |
| 7. `flutter doctor --android-licenses` | | G. Builds your project and launches it on a device |

---

## Practice ★★

### 2.4 ★★ Diagnose this doctor

**Explain.** A classmate sends you their `flutter doctor` output:

```
[√] Flutter (Channel stable, 3.44.2, on Microsoft Windows)
[!] Android toolchain - develop for Android devices (Android SDK version 35.0.0)
    ! Some Android licenses not accepted. To resolve this, run: flutter doctor --android-licenses
[√] VS Code (version 1.96.0)
[!] Connected device
    ! No devices available
```

There are two `[!]` lines, and they look equally serious. They aren't.

1. Which of the two `[!]` lines needs fixing?
2. What exactly should they run to fix it, and what will they have to do while it runs?
3. Why is the *other* `[!]` line nothing to worry about?

---

### 2.5 ★★ "Not recognized"

**Explain.** You just installed Flutter and added it to PATH. In the terminal you already had open, you type `flutter doctor` and get:

```
'flutter' is not recognized as an internal or external command,
operable program or batch file.
```

1. What's the most likely cause?
2. What's the fix?

---

### 2.6 ★★ PATH, in your own words

**Explain.** Using the phone-contacts analogy, explain what PATH is and why Flutter needs to be on it. Three sentences.

---

### 2.7 ★★ Nowhere to run

**Explain.** You run `flutter run` and get:

```
No supported devices connected.
```

What does it mean, and what do you do?

---

### 2.8 ★★ A fresh project, start to finish

**Do.** In your own work folder — never the course folder — create and run a brand-new app:

1. Make a folder called `practice` and move into it.
2. Create a Flutter project called `setup_check`.
3. Move into the project folder.
4. Start your emulator, then launch the app on it.
5. Stop the app from the terminal.

Write down every command you used, in order. For step 4, note roughly how long the first launch took.

---

## Challenge ★★★

### 2.9 ★★★ The wizard that never finished

**Explain.** A friend installed Android Studio yesterday. Today `flutter doctor` still shows:

```
[X] Android toolchain - develop for Android devices
```

They're sure they installed it. What's the most likely thing that went wrong, and how do they fix it?

---

### 2.10 ★★★ Your rescue checklist

**Write.** Six months from now, something in your setup mysteriously stops working. Write a short checklist — four to six steps, in order — of what you'd check and run, starting with the very first thing.

Use what you learned in this session. There's no single right answer, but there is a right *first* step.

---

### 2.11 ★★★ Why a new window?

**Explain.** This chapter tells you, more than once, to close your terminal and open a fresh one after installing something. Explain *why* that works, in two or three sentences. What does a terminal window "know" when it opens, and why doesn't it notice changes made after that?

---

## Done?

- [ ] Every exercise attempted
- [ ] `flutter doctor` on your own machine shows `[√]` for Flutter, Android toolchain and VS Code
- [ ] You created, ran and stopped `setup_check` yourself, with no help
- [ ] You checked your answers against the [solutions](solutions/02-environment-setup.md)
