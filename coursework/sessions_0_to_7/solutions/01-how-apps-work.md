# Solutions 01 — How Apps Work

[← Back to the exercises](../01-how-apps-work.md) · [Workbook guide](../README.md)

> Most of this set is in your own words, so your answers won't match these word for word. What matters is whether you've got the same *idea*. Where there's a single right answer, it's marked.

---

## 1.1 ★ Match the word

**1-D, 2-G, 3-F, 4-H, 5-C, 6-E, 7-A, 8-B**

| Term | Meaning |
|---|---|
| Source code | D. The instructions a human wrote |
| Compile | G. Translate code into something the phone can actually run |
| Framework | F. A toolbox of pre-built parts |
| Widget | H. One visible piece of the screen |
| Rendering engine | C. The part of Flutter that draws every pixel |
| IDE | E. The editor you write code in |
| Emulator | A. A fake phone running as a window on your computer |
| SDK | B. The complete bundle of tools for building Flutter apps |

The two people most often mix up are **SDK** and **framework**. The framework is the toolbox of ready-made parts you build *with*. The SDK is the whole kit — the framework, *plus* the compiler and everything else your computer needs to turn your code into an app.

---

## 1.2 ★ Native, web or cross-platform?

1. **Native** — two teams, two languages, one per platform.
2. **Web** — it's a website. "Add to Home Screen" makes a shortcut, not a real installed app.
3. **Cross-platform** — one codebase, both stores. That's exactly what Flutter does.
4. **Web** — runs in any browser, nothing to install.
5. **Cross-platform** — the same code running on both kinds of phone.
6. **Native** — built separately per platform for maximum performance. This is the one situation where native clearly wins.

---

## 1.3 ★ Fill in the blanks

1. A **compiler** takes code a human can read and turns it into something a phone's processor can run.
2. Flutter is a **framework**, made by Google, for building cross-platform apps.
3. In Flutter, everything you see on the screen is a **widget**.
4. The special text editor this course uses is called **VS Code**. ("An IDE" is also right.)
5. The feature that updates your running app in under a second is called **hot reload**.

---

## 1.4 ★★ The recipe, in your words

A good answer covers two ideas: **source code is instructions**, and **compiling translates them** into something a machine can follow.

**One example answer:**

> Source code is like a recipe — a list of exact steps, written by a person, for making something. But a phone can't read a recipe written in words, the same way you couldn't cook from a recipe written in a language you don't speak. Compiling is the translation step: it turns the recipe into instructions the phone's processor actually understands. The recipe doesn't cook the meal, and source code doesn't run the app — but follow either one exactly, and you get the same result every time.

If yours says the same thing differently, it's right.

---

## 1.5 ★★ Why does it look the same everywhere?

Because **Flutter draws every pixel itself, using its own rendering engine.** It doesn't ask Android or iOS for their buttons and menus — it brings its own and paints them identically on every device.

Most other cross-platform tools translate your app into each phone's *own* native buttons at the last moment, so an Android phone shows Android-style buttons and an iPhone shows iPhone-style ones. Close, but not identical.

The chapter's analogy: most tools hire a local artist in every city to paint your mural, so it looks a bit different in each one. Flutter brings its own paint and brush, and paints the same mural everywhere.

---

## 1.6 ★★ Advise the client

1. **Cross-platform.** They need both platforms, and with two people and three months they can't afford to write the app twice. One codebase, both stores.
2. **Web.** "Nothing to install" is the whole requirement. A web page opens straight from the QR code in the phone's browser.
3. **Native.** Pushing the camera and processor to their absolute limit is the one case where native's direct access to the phone is worth writing the app twice.

---

## 1.7 ★★ Read the code

1. **`Hello, future developer!`** — the text inside the quotes.
2. **`Text`** — it's the widget that puts text on screen.
3. **Change `24` to a bigger number**, such as `fontSize: 40`.
4. **In the middle of the screen**, because of `Center`. The text is its `child` — the thing it centres.

Notice how much of that you could read without being taught a single rule of Dart. That's the point of the exercise.

(A small detail for later: `TextStyle` isn't a widget. It doesn't appear on screen by itself — it's a *description* of how the text should look, handed to `Text`. You'll meet that difference properly in Session 11.)

---

## 1.8 ★★ Spot the syntax error

**(a)** The `)` that closes `Text(` is missing. The last line should be `),` not just `,`.

**(b)** The closing quote is missing. `'Hello, future developer!,` should be `'Hello, future developer!',` — the `'` has to come *before* the comma.

**(c)** The comma is missing after `'Hello, future developer!'`. Each thing inside `Text(...)` must be separated from the next by a comma.

**What you'd actually see.** If you made these mistakes for real, the first error message for each would be:

| | First error |
|---|---|
| (a) | `Can't find ')' to match '('.` |
| (b) | `String starting with ' must end with '.` |
| (c) | `Expected ',' before this.` |

**Here's something worth knowing now:** (a) and (b) actually produce **more than one** error each. One missing bracket confuses everything after it, so the compiler reports knock-on errors too. The rule: **fix the first error, then run again.** The others usually vanish.

---

## 1.9 ★★ Which tool do you blame?

1. **IDE** — highlighting and suggestions are the editor's job.
2. **SDK** — your computer can't find Flutter's tools. This usually means Flutter isn't on your PATH yet (Session 2).
3. **Emulator** — you need a device to run the app on.

---

## 1.10 ★★★ Flutter in four sentences

**One example answer** — words from the list in bold:

> Flutter is a **framework** from Google: a big toolbox of ready-made parts for building apps. You write your app's **source code** once, and Flutter **compile**s it into a real app for both iPhone and Android — which is what **cross-platform** means. Every piece of the screen, from a button to a line of text, is a **widget**, and you build screens by fitting widgets together like bricks. Flutter's **rendering engine** then draws every single pixel itself, so the app looks identical on every phone.

Yours is right if it's exactly four sentences, uses at least four of the words correctly, and would make sense to someone who's never coded.

---

## 1.11 ★★★ Argue both sides

**For** (one example): Most apps don't need every last drop of a phone's performance, and cross-platform gets remarkably close. Writing the app once instead of twice roughly halves the work, halves the bugs to fix, and means both platforms always get new features at the same time.

**Against** (one example): Native apps get direct, immediate access to everything the phone can do, and the newest platform features the day they launch. For demanding apps — 3D games, augmented reality, heavy video processing — that extra performance is noticeable, and worth the cost of building twice.

**When native:** when the app needs the absolute maximum performance or the very latest platform-specific features, and the team can afford to build and maintain two separate apps.

There's no single right answer here. A strong answer admits that both sides are genuinely true, and that the right choice depends on the app.
