# Session 2 — Full Environment Setup

**Module 0 — Foundations & Setup** · Session 2 of 36 · about 20 minutes to read, 60–90 minutes to do
**Code for this session:** [`code/final/first_app`](code/final/first_app) — what you'll generate yourself

---

## What you'll be able to do by the end

- Install VS Code and the Flutter extension
- Install the Flutter SDK and confirm it's on your system PATH
- Install the Android toolchain and create a working emulator
- Run `flutter doctor` and understand every line it prints
- Create and run your first Flutter app on a virtual phone

## Before you start

- Finish [Session 1](../01-welcome-and-how-apps-work/). You need the words **IDE**, **emulator**, and **SDK**.
- An internet connection. The downloads today total several gigabytes.
- Administrator rights on your computer.
- Around 10 GB of free disk space, and ideally 8 GB of RAM or more.

**Set aside a proper block of time.** This is the longest, least glamorous session in the course, and it's mostly waiting for downloads. It's also the only setup you will ever have to do. From Session 3 onward, your tools are just there.

> **Things will look slightly different on your screen than they do here.** Installers change their wording version to version. If a button says something a little different, don't panic — the *action* is what matters, not the exact pixel.

---

## The big idea

You start today with nothing installed. In under an hour you'll have a real app running on a real virtual phone, built with tools you installed yourself.

Four installs, in this order:

1. **Git** — a tool Flutter's installer needs behind the scenes
2. **VS Code** + the Flutter extension — your editor
3. **The Flutter SDK** — the toolbox itself
4. **Android Studio** — the Android toolchain and your emulator

Then two commands: `flutter create` and `flutter run`.

---

## 1. The terminal

Before installing anything, one new idea. You're about to see a dark window where you type commands instead of clicking icons.

> **Terminal** (also called the command line) — a window where you type commands instead of clicking.

> **Think of it like ordering food.** Clicking icons is pointing at a menu and having a waiter bring your food. The terminal is walking into the kitchen and telling the cook exactly what to make, in exact words. More precise, and once you're comfortable, often faster.

You do not need to have used one before. You'll type maybe a dozen commands across this entire course, and every one is written out for you.

**Where to find it:**

- **Windows** — press Start, type "Terminal", open it. Later you'll mostly use the one built into VS Code.
- **Mac** — press Cmd+Space, type "Terminal", open it.
- **Inside VS Code** (once installed) — press <kbd>Ctrl</kbd>+<kbd>`</kbd> (the backtick key, above Tab). On Mac that's <kbd>Cmd</kbd>+<kbd>`</kbd>.

---

## 2. Install Git

> **Git** — a very common developer tool that Flutter's installer quietly relies on to download and manage itself.

You won't use Git directly for a while, but Flutter needs it present first.

**On Windows:**

1. Go to [git-scm.com/downloads/win](https://git-scm.com/downloads/win)
2. Download the installer and run it
3. Click Next through the options and then Install — **the defaults are genuinely fine for this course**

**On Mac:** don't download anything. Open Terminal and run:

```
xcode-select --install
```

A dialog pops up. Click Install. That one command gives you Git and the other command-line tools Flutter needs on macOS.

**Check it worked.** Open a *new* terminal window and run:

```
git --version
```

You should see a version number, something like `git version 2.47.1`. If you get an error instead, close every terminal window and open a fresh one — installers usually need a new window before they're recognised.

---

## 3. Install VS Code

> **VS Code** (Visual Studio Code) — the IDE this course uses for all 36 sessions.

1. Go to [code.visualstudio.com](https://code.visualstudio.com)
2. Download and run the installer
3. Accept the defaults, with **one thing to check on Windows**: make sure the **"Add to PATH"** checkbox is ticked. It usually is by default. We explain what PATH means in a moment — for now just confirm the checkmark is there.

Open VS Code when it finishes. You should get an empty editor window.

---

## Checkpoint #1

**Stop reading and do this now.** This isn't a thought exercise — it's real work, in real time.

Install Git and VS Code on your own computer, following exactly what's above. Depending on your internet connection this takes a few minutes. Don't continue until both are done.

<details>
<summary><strong>You're done when</strong></summary>

- Opening a **new** terminal and typing `git --version` prints a version number instead of an error
- VS Code opens to a blank editor window

**If it's not working:** the single most common fix at this stage is closing and reopening your terminal, or restarting VS Code entirely. Installers often need a fresh window to be recognised.
</details>

---

## 4. Install the Flutter SDK

If you go searching on your own later, you'll find older tutorials that have you manually download a giant zip file and drag folders around. That still works, but it's **not** what we're doing.

**The modern way: let VS Code install Flutter for you.** Faster, harder to get wrong, and it's the officially recommended path today.

### 4a. The Flutter extension

1. In VS Code, open the Extensions panel — <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>X</kbd> (Mac: <kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>X</kbd>)
2. Search for **Flutter**
3. Install the one called simply "Flutter", published by **Dart Code**

Installing it also quietly installs a second extension called **Dart** — the actual programming language Flutter is written in. Remember that name; you meet it properly in Session 4.

### 4b. The SDK itself

1. Open the Command Palette — <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> (Mac: <kbd>Cmd</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>)
2. Type `flutter` and select **Flutter: New Project**
3. VS Code notices Flutter isn't installed and offers to fix it. Click **Download SDK**
4. Choose a folder. **Pick a path with no spaces or special characters in it** — `C:\src\flutter` on Windows, or `~/development/flutter` on Mac, are common safe choices
5. Click **Clone Flutter**

**This download takes several minutes** and is a couple of gigabytes. Go make coffee. What's happening behind the scenes: VS Code is pulling down the entire Flutter framework and its compiler onto your machine.

### 4c. Add it to your PATH

When the download finishes, VS Code prompts you to **Add SDK to PATH**. Click it.

> **PATH** — the list of folders your computer checks whenever you type a command.

PATH is a setting on your computer: a list of folder locations that says *"whenever someone types a command, look in these folders for a program with that name."* Adding Flutter to your PATH means you can type `flutter` in any terminal window, anywhere on your computer, and it gets found instantly.

> **Think of PATH like your phone's contacts list.** You don't need to remember someone's full number — you say their name, and your phone already knows where to find them. Without PATH, you'd type out Flutter's entire folder location every single time. With it, you just say `flutter`.

**Now close every terminal window and open a fresh one.** PATH changes only take effect in new windows. This trips up more beginners than any other step today.

---

## 5. `flutter doctor`

In a fresh terminal, run:

```
flutter doctor -v
```

> **`flutter doctor`** — a checkup for your whole setup.

This command is a full health check of your development environment. It looks at every piece — Flutter itself, your editor, your Android tools — and tells you exactly what's working and what isn't. The `-v` means "verbose": show me the full detail under each line.

You'll get a checklist. Right now it'll look roughly like this:

```
[√] Flutter (Channel stable, 3.44.x, on Microsoft Windows)
[X] Android toolchain - develop for Android devices
[√] VS Code (version 1.9x.x)
[!] Connected device
```

Here's how to read those markers:

| Marker | Meaning |
|---|---|
| `[√]` or `[✓]` | This piece is installed and working |
| `[X]` or `[✗]` | Something is missing or broken. This needs fixing |
| `[!]` | A caution. Sometimes fine to ignore — for example, "no devices connected" when you simply haven't started your emulator yet |

**The green check next to Flutter means the SDK installed correctly.** The red X next to Android toolchain is expected right now — that's the next step.

Get comfortable with this command. For the rest of your Flutter career, `flutter doctor` is the first thing you run when something is mysteriously broken.

---

## 6. Install the Android toolchain and an emulator

> **Android toolchain** — everything needed to build and test Android apps: the Android SDK, the build tools, and an emulator manager.

You install all of it through a program called Android Studio. You will not write code in Android Studio — VS Code stays your editor. Android Studio is here purely for its Android tooling and its emulator.

1. Go to [developer.android.com/studio](https://developer.android.com/studio)
2. Download and run the installer. Defaults are correct for this course
3. **The first time Android Studio opens, it runs its own setup wizard** and downloads the Android SDK — the exact pieces `flutter doctor` said were missing. Click through the defaults and let it finish completely

This is a bigger download than Flutter's. Expect a wait.

### Creating your virtual phone

In Android Studio, open **Device Manager** (it's under "More Actions" on the welcome screen, or the phone icon in the sidebar of an open project).

> **AVD (Android Virtual Device)** — a specific virtual phone model you create and run. It's the concrete version of the "emulator" idea from Session 1.

1. Click **Create Device**
2. Pick a phone model — a **Pixel** is a safe, common default
3. Pick a system image. That's the version of Android it'll run. A recent stable release is fine. This downloads one more piece the first time
4. Click Finish
5. Click the **Play (▶) button** next to your new device

The emulator window opens and boots to an Android home screen. That's a fully working virtual phone, sitting on your desktop.

> **Target platform** — the specific device and operating system combination your app is being built for.

Android is our target platform in this course. Everything you build works on iPhone too, since Flutter is cross-platform. We test on Android because an Android emulator runs on any computer — Windows, Mac, or Linux — while an iPhone simulator only runs on a Mac.

**"I have a Mac — can I use the iOS simulator instead?"** Yes, and it works identically for everything in this course. Install Xcode from the Mac App Store instead of, or alongside, Android Studio, and `flutter doctor` will guide you through the equivalent iOS steps.

### Run `flutter doctor` again

```
flutter doctor
```

Chase the red X's until they're gone. The two you're most likely to hit:

| What `flutter doctor` says | The fix |
|---|---|
| Android toolchain still shows `[X]` | Open Android Studio at least once and let its first-run setup wizard finish completely |
| Something about Android SDK licenses not being accepted | Run `flutter doctor --android-licenses` and type `y` at each prompt |

---

## 7. Your first Flutter project

This is what the whole session has been building toward.

First, make a folder to hold your course projects. Anywhere sensible — the Desktop is fine:

```
cd Desktop
mkdir flutter_course
cd flutter_course
```

`mkdir` makes a directory (a folder). `cd` changes directory — it moves your terminal into that folder.

Now create the project:

```
flutter create first_app
```

> **`flutter create`** — generates a complete, working starter project.

Watch the output scroll. That one command generated an entire working Flutter project — dozens of files, all wired together correctly, from a template. You haven't written a single line of code and you already have a real, runnable app. Session 3 opens up exactly what's inside these files.

Move into it and run it:

```
cd first_app
flutter run
```

> **`flutter run`** — compiles your project and launches it on the connected device.

It takes everything in that project folder, compiles it (that word from Session 1), and launches it on whatever device is currently connected. Right now, that's your emulator.

**This first build is the slowest one you will ever see.** It's compiling from a completely cold start. Expect anywhere from thirty seconds to two minutes depending on your machine. Later builds are much faster.

Then your emulator switches to show a small app: a number starting at `0`, and a **+** button in the corner.

**Tap the + button.** It counts. 1, 2, 3.

That's a real, working, interactive Flutter app, running on a phone you built five minutes ago.

**"Why a counter? Did I choose that?"** No — this is Flutter's own built-in starter template, the same one everyone gets from `flutter create`. It's deliberately simple: one button, one number. Session 3 starts dissecting exactly how it works.

---

## Break it on purpose

There's a message you are extremely likely to see this week. Better to meet it here, calmly, on purpose.

With your app running, stop it: click into the terminal and press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Now **close the emulator window entirely** — shut the virtual phone off. Then try to run again:

```
flutter run
```

```
No supported devices connected.
```

> **"No connected devices"** — Flutter has nowhere to launch your app.

This is not a bug in your code. You don't even have code yet. It means Flutter has nothing to launch onto: no emulator running, no phone plugged in, nothing listening.

**The fix is almost always this simple:** start your emulator back up from Android Studio's Device Manager, wait for it to finish booting, then run `flutter run` again.

It builds — faster this time — and it's back.

This exact error is one of the most common messages in all of Flutter development. Now you know what it means and how to fix it, before it ever surprises you.

---

## Checkpoint #2

The big one. **Do everything above on your own machine before moving to Session 3.**

Install the Android toolchain if you haven't. Create your emulator. Run `flutter create first_app`, then `flutter run`, and watch that counter appear on your own screen.

<details>
<summary><strong>You're done when</strong></summary>

Your emulator shows a counter app with a **+** button, and tapping it increases the number on screen.

**If `flutter doctor` still shows red X's:**

- **Android toolchain X** → open Android Studio at least once and let its first-run setup wizard finish completely
- **A license-related message** → run `flutter doctor --android-licenses` and type `y` to accept each one
- **Everything installed, but `flutter run` says "No connected devices"** → open Android Studio's Device Manager and click Play next to your virtual device, wait for it to boot, then run `flutter run` again
</details>

---

## Three things to remember

1. **The terminal** is where you type Flutter commands.
2. **`flutter doctor`** tells you what's working and what isn't. It's your first move whenever something breaks.
3. **`flutter create` plus `flutter run`** takes you from an empty folder to a running app in two commands.

---

## Cheat sheet

**Install order:** Git (or `xcode-select --install` on Mac) → VS Code + Flutter extension → Flutter SDK via VS Code → Android Studio + Android toolchain → create an emulator → `flutter create` → `flutter run`.

| Command | What it does |
|---|---|
| `git --version` | Confirms Git installed correctly |
| `flutter doctor` | Health-checks your whole setup; shows what's installed and what's missing |
| `flutter doctor -v` | Same, but verbose — full detail under each line |
| `flutter doctor --android-licenses` | Accepts the Android SDK license agreements (only if `flutter doctor` flags it) |
| `mkdir <name>` | Creates a folder |
| `cd <name>` | Moves your terminal into that folder |
| `flutter create <name>` | Generates a complete new Flutter project from a template |
| `flutter run` | Compiles your project and launches it on the connected device |
| <kbd>Ctrl</kbd>+<kbd>C</kbd> in the terminal | Stops the currently running app |

| Concept | Plain-English definition |
|---|---|
| Terminal | A window where you type commands instead of clicking |
| PATH | The list of folders your computer checks when you type a command name |
| Android toolchain | The Android SDK + build tools + emulator manager, installed via Android Studio |
| AVD (Android Virtual Device) | A specific virtual phone model you create and run in Android Studio's Device Manager |
| Target platform | The device/OS combination you're building and testing for — Android, in this course |

---

## When it goes wrong

| What you'll see | What it actually means | The fix |
|---|---|---|
| `No supported devices connected.` after `flutter run` | Flutter has nowhere to launch your app — no emulator running, no phone plugged in | Start your emulator from Android Studio's Device Manager, wait for it to boot, then run `flutter run` again |
| `'flutter' is not recognized as an internal or external command` (Windows) or `command not found: flutter` (Mac) | Your terminal window was opened *before* PATH was updated with Flutter's location | Close all terminal windows and VS Code, then reopen. PATH changes only take effect in new windows |
| A message about Android SDK licenses not being accepted | Android's components require you to explicitly agree to their license terms first | Run `flutter doctor --android-licenses` and type `y` at each prompt |
| `flutter doctor` shows Android toolchain `[X]` even after installing Android Studio | Android Studio's first-run wizard never finished, so the SDK components aren't actually there | Open Android Studio, let the setup wizard run all the way through, then re-run `flutter doctor` |
| The emulator is extremely slow or won't boot | Usually hardware acceleration is off, or the machine is short on RAM | Close other heavy apps. On Windows, check that virtualization is enabled in your BIOS — `flutter doctor -v` often names the specific issue |

---

## Homework

**Estimated time: 30 minutes of hands-on work** — though the downloads may run longer in the background depending on your connection. If you did both checkpoints during the session, this may already be finished.

Get `flutter doctor -v` to show all green, then screenshot the full output.

**You're done when:**

- [ ] `flutter doctor -v` shows no red X's. A caution `[!]` on an optional item you don't use is fine — only unresolved X's block you
- [ ] You have personally run `flutter run` at least once and watched the counter app launch on your emulator
- [ ] The screenshot is saved somewhere you can find it before Session 3

**Why this matters:** every session from here assumes your environment already works. This is the last session where getting the tools running is the whole point. From Session 3 onward, we're building.

### Stretch goal

Create a second virtual device with a different phone model — or even a tablet, like a Pixel Tablet — in Android Studio's Device Manager. Run `first_app` on it, and write two sentences comparing what looked different: screen size, layout spacing, anything you noticed.

That's your first real look at why "cross-platform" and "responsive" both matter, well before we cover either formally.

---

## Check yourself

1. **What does the terminal let you do that clicking icons doesn't?**
   a) Play music
   b) Type precise commands directly
   c) Change your wallpaper
   d) Browse the internet

2. **What does `flutter doctor` do?**
   a) Fixes bugs in your code automatically
   b) Checks your entire development environment and reports what's working and what isn't
   c) Updates your operating system
   d) Deletes old projects

3. **What is PATH?**
   a) A visual design pattern in Flutter
   b) The list of folders your computer checks when you type a command name
   c) The main file in a Flutter project
   d) A type of animation

4. **What does `flutter create first_app` do?**
   a) Opens an existing project named first_app
   b) Deletes a project named first_app
   c) Generates a brand-new, complete Flutter project from a template
   d) Installs the Flutter SDK

5. **You run `flutter run` and see "No connected devices." What does that mean?**
   a) Your code has a syntax error
   b) Your internet connection is down
   c) Flutter has nowhere to launch your app — no emulator or device is currently running
   d) Your project is corrupted

<details>
<summary><strong>Answers</strong></summary>

1. **b** — The terminal lets you type exact commands directly, which is often faster and more precise once you're comfortable with it.
2. **b** — `flutter doctor` is a full health check across your entire setup, not a bug-fixer or a code tool.
3. **b** — PATH is the list of folder locations your computer searches whenever you type a command name.
4. **c** — `flutter create` generates an entire new, working project from Flutter's built-in template.
5. **c** — There's no emulator or physical device currently connected for Flutter to launch onto. It's an environment issue, not a code issue.
</details>

---

## New words from this session

`terminal / command line` · `Git` · `PATH` · `flutter doctor` · `Android toolchain` · `AVD (Android Virtual Device)` · `target platform` · `flutter create` · `flutter run`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Next up

**[Session 3 — Anatomy of a Flutter Project + Hot Reload](../03-anatomy-and-hot-reload/)**

Next session we open up every single file `flutter create` generated for you and work out what each one actually does. And you finally see **hot reload** for real — the thing promised back in Session 1.

It's worth the wait.

---

[← Session 1](../01-welcome-and-how-apps-work/) · [Course home](../../README.md) · [Glossary](../../glossary.md) · [Session 3 →](../03-anatomy-and-hot-reload/)
