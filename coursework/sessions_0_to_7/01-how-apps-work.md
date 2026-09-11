# Coursework 01 — How Apps Work

**Covers:** [Session 1 — Welcome and How Apps Work](../../sessions/01-welcome-and-how-apps-work/) · **11 exercises** · about 45 minutes
**Solutions:** [solutions/01-how-apps-work.md](solutions/01-how-apps-work.md)

No code to run in this set. It's about making sure the vocabulary from Session 1 is solid, because every later session assumes it.

Write your answers in full sentences — in a notebook, or a text file in your work folder.

---

## Warm-up ★

### 1.1 ★ Match the word

**Explain.** Match each term to its meaning. Answer as pairs, like `1-C`.

| Term | | Meaning |
|---|---|---|
| 1. Source code | | A. A fake phone that runs as a window on your computer |
| 2. Compile | | B. The complete bundle of tools that lets your computer build Flutter apps |
| 3. Framework | | C. The part of Flutter that draws every pixel on the screen |
| 4. Widget | | D. The instructions a human wrote |
| 5. Rendering engine | | E. The editor you write code in |
| 6. IDE | | F. A toolbox of pre-built parts, so you don't build everything from nothing |
| 7. Emulator | | G. Translate code into something the phone can actually run |
| 8. SDK | | H. One visible piece of the screen |

---

### 1.2 ★ Native, web or cross-platform?

**Explain.** For each description, say whether the app is **native**, **web**, or **cross-platform**.

1. A bank employs one team writing Swift for iPhone, and a separate team writing Kotlin for Android.
2. A restaurant's menu lives at a web address. Customers open it in their browser and tap "Add to Home Screen."
3. A startup writes one Dart codebase and publishes it to both the App Store and Google Play.
4. A news website that works in any browser, on any device, with nothing to install.
5. An app you installed from Google Play whose exact same code also runs on your friend's iPhone.
6. A game studio builds its 3D racing game separately for each platform to squeeze out every drop of graphics performance.

---

### 1.3 ★ Fill in the blanks

**Explain.** Complete each sentence with one word or short phrase.

1. A ______ takes code a human can read and turns it into something a phone's processor can run.
2. Flutter is a ______, made by Google, for building cross-platform apps.
3. In Flutter, everything you see on the screen is a ______.
4. The special text editor this course uses is called ______.
5. The feature that updates your running app in under a second when you change code is called ______.

---

## Practice ★★

### 1.4 ★★ The recipe, in your words

**Explain.** Using the recipe analogy from the chapter, explain **source code** and **compiling** to someone who has never programmed. Three or four sentences. Don't just repeat the chapter — say it the way you'd say it to a friend.

---

### 1.5 ★★ Why does it look the same everywhere?

**Explain.** A Flutter app looks and behaves pixel-for-pixel the same on an iPhone and on a Samsung. Most other cross-platform tools can't promise that.

Why? Use the words **rendering engine** in your answer.

---

### 1.6 ★★ Advise the client

**Explain.** Three clients ask which way to build their app. For each, recommend **native**, **web**, or **cross-platform**, and give one reason.

1. A two-person startup. They need the app on iPhone *and* Android, and they have three months.
2. A museum wants visitors to scan a QR code next to each exhibit and read about it — with nothing to install.
3. A company building an augmented-reality app that pushes the phone's camera and processor as hard as they can possibly go.

---

### 1.7 ★★ Read the code

**Explain.** This is from the Session 1 demo app:

```dart
body: const Center(
  child: Text(
    'Hello, future developer!',
    style: TextStyle(fontSize: 24),
  ),
),
```

You've never been taught Dart. Answer anyway — code is closer to English than it looks.

1. What sentence appears on the screen?
2. Which word is responsible for putting text on the screen?
3. What would you change to make the text bigger?
4. Where on the screen do you think the text appears, and which word tells you?

---

### 1.8 ★★ Spot the syntax error

**Fix.** Each snippet has exactly one syntax error. Find it and say what's missing.

**(a)**

```dart
child: Text(
  'Hello, future developer!',
  style: TextStyle(fontSize: 24),
,
```

**(b)**

```dart
child: Text(
  'Hello, future developer!,
  style: TextStyle(fontSize: 24),
),
```

**(c)**

```dart
child: Text(
  'Hello, future developer!'
  style: TextStyle(fontSize: 24),
),
```

---

### 1.9 ★★ Which tool do you blame?

**Explain.** For each problem, say whether it's most likely to do with your **IDE**, your **SDK**, or your **emulator**.

1. You type code, but there's no colour-highlighting and no suggestions appear.
2. You type `flutter` in the terminal and your computer says it doesn't know what that is.
3. The code builds fine, but there's nowhere for the app to actually open and run.

---

## Challenge ★★★

### 1.10 ★★★ Flutter in four sentences

**Write.** Explain what Flutter is to a friend who has never written code, in **exactly four sentences**. Use at least four of these words, correctly: *framework, widget, cross-platform, rendering engine, compile, source code.*

---

### 1.11 ★★★ Argue both sides

**Explain.** "Cross-platform is always the better choice."

1. Write two or three sentences arguing **for** that statement.
2. Write two or three sentences arguing **against** it.
3. Finish with one sentence: when *would* you pick native?

---

## Done?

- [ ] Every exercise attempted, in full sentences
- [ ] You checked your answers against the [solutions](solutions/01-how-apps-work.md)
- [ ] Any term you got wrong, you've looked up again in the [chapter](../../sessions/01-welcome-and-how-apps-work/) or the [glossary](../../glossary.md)
