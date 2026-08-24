# Session 1 — Welcome: How Mobile Apps Actually Work

**Module 0 — Foundations & Setup** · Session 1 of 36 · about 15 minutes to read
**Code for this session:** [`code/final/demo_app`](code/final/demo_app) — for looking at, not running yet

---

## What you'll be able to do by the end

- Explain, to someone who has never coded, the difference between a **native**, a **web**, and a **cross-platform** app
- Say what Flutter is, and why it draws its own screen instead of borrowing your phone's buttons
- Name the eight mini-apps and the capstone project you'll build over the next 12 weeks
- Look at a red error message without your stomach dropping

## Before you start

Nothing but the files. If you haven't got the course onto your computer yet, [Session 0](../00-intro-to-git-and-github/) is a 15-minute detour that handles it.

You need zero coding experience, and you don't need to install anything else yet — that happens in Session 2.

There is no code to write today. That is on purpose. Before you type a single character, you should know what you're actually doing when you type it. Otherwise you're copying symbols someone told you to copy.

---

## The big idea

The session opens with an app called **TaskFlow**. It adds a task. It saves it. It checks it off. It remembers everything after you close it and reopen it. It has dark mode, swipe-to-delete, and smooth animations, and it doesn't crash.

You build that app. Not a version of it. Not something like it — that exact app, every button and every animation, is what you finish in Session 36, twelve weeks from today.

That's a stretch from where you're sitting right now, and pretending otherwise would waste your time. Maybe you've never written a line of code in your life. Good — that's who this course is built for. Today you won't write any code either. But you'll understand what code *is*, what Flutter does with it, and every stop on the map between here and TaskFlow.

Here's how the course runs: **three sessions a week, 60 minutes each, for 12 weeks. 36 sessions.** Every module ends with something real — not a quiz, a **mini-app**. A small, complete, working piece of software you built.

---

## 1. What is an app, really?

Here's a question that sounds too simple to ask out loud: what *is* an app?

You tap an icon. A picture appears. Somehow that icon knew what to draw, how to respond when you tap the shutter button, and where to save the photo. None of that is magic. Every piece of it was written down in advance, by a person, as instructions.

> **Source code** — the instructions a human wrote.

Source code is text. Words and symbols, typed by a person, describing exactly what should happen and when.

> **Think of it like a recipe.** A recipe doesn't cook the meal. It's a precise list of steps that, followed exactly, produces the meal every time. Source code doesn't run the app — it's a precise list of steps that, followed by your phone, produces the app every time.

Here's the part that trips people up: your phone cannot read that recipe the way you're reading this sentence. It needs the recipe translated into something it understands — a language of pure on/off electrical signals.

> **Compile** — translate code into something your phone can run.

That translation step is called compiling. A **compiler** takes the code a person wrote — readable, structured, human-friendly — and turns it into a form your phone's processor can actually execute. You write in a language built for humans. The compiler hands your phone a language built for machines.

Every app on your phone went through that process. But apps are **not** all built the same way underneath, and understanding the difference is the whole reason this course exists.

---

## 2. Three ways to build an app

**Native apps.** A native app is written for one platform only, using that platform's own official toolkit — Swift or Objective-C for iPhones, Kotlin or Java for Android. It talks to the phone's operating system directly, using the phone's own real buttons, switches, and menus. Fast. Feels exactly right on that one device. The catch: the iPhone version and the Android version are two completely separate apps, written twice, in two different languages, maintained by two separate teams forever.

**Web apps.** A web app is really a website — built with the same HTML, CSS, and JavaScript that runs any web page — dressed up to feel app-like in your browser. Works everywhere a browser works. The catch: it isn't a real app your phone recognises as one. No home-screen icon that behaves like a native app, and limited access to your camera, your contacts, your phone's actual hardware.

**Cross-platform apps.** The middle path, and where Flutter lives. You write the app's logic and interface **once**, in one language, and it produces a real, installable, native-feeling app for both iPhone and Android at the same time. One codebase. Two platforms.

| | Speed & feel | How many times you write it | Real installed app? |
|---|---|---|---|
| **Native** | Best possible | Twice — once per platform | Yes |
| **Web** | Noticeably web-like | Once | No — it's a website |
| **Cross-platform** | Very close to native | Once | Yes |

**"So is cross-platform always better?"** Not always. For a handful of highly specialised apps — something needing the absolute maximum performance from the phone's hardware — native still wins. But for the overwhelming majority of apps you use every day, cross-platform is close enough in speed and completely worth the time saved.

**In three sentences:** Native is fast, feels perfect, written twice. Web works everywhere but doesn't feel like a real app. Cross-platform is written once, feels native, runs on both.

---

## Try it yourself #1

Stop reading for a minute. Pick any three apps on your own phone. For each one, guess: **native, web, or cross-platform?**

You won't be able to know for certain just by looking — that's fine, this is about the guessing, not the answer. Look for clues. Does it feel exactly like the rest of your phone's built-in apps? Does it ever feel like a web page loading slowly?

Write your three guesses down before you read on.

<details>
<summary><strong>How to think about it</strong> — open after you've guessed</summary>

There's no graded answer here — even professionals often can't tell for certain just by using an app. What matters is *how* you reasoned. A worked example:

- **Your phone's built-in Camera or Clock app** → almost certainly **native**. Pre-installed by the phone maker, integrates deeply with hardware (camera sensor, precise timers) in a way that feels instant and exact.
- **A page that opens in your browser when you tap a home-screen bookmark** → **web**. If it ever shows a browser address bar, or takes a beat to "load" like a webpage, that's your tell.
- **A polished app from a mid-size company** (shopping, food delivery) that feels smooth but slightly generic across many apps you use → often **cross-platform**. Consistent look, no jarring platform quirks, but not quite the hyper-optimised feel of a native flagship.

If your guesses don't match this pattern, that's fine. The skill you're building is *noticing*, not memorising a lookup table.
</details>

---

## 3. What Flutter actually does

> **Framework** — a toolbox of pre-built parts.

A framework is a big, organised toolbox of pre-written code that handles the boring, repetitive, hard-to-get-right work, so you don't build it from nothing. **Flutter is a framework, made by Google, for building cross-platform apps.**

Now the detail that makes Flutter genuinely different from most cross-platform tools. It explains almost everything you'll experience in this course.

Most cross-platform tools translate your code into each platform's native buttons and menus at the last second — Android gets Android buttons, iPhone gets iPhone buttons. Flutter does something bolder: it **draws its own entire screen, pixel by pixel**, and doesn't ask the phone's operating system for buttons at all.

> **Rendering engine** — the part of Flutter that draws every pixel.

It's the internal machinery that paints the screen. Every line, every colour, every shape you see is drawn by this one piece of Flutter, the same way on every device.

> **Think of it like a mural.** Most tools hire a local artist in every city to paint your mural, so the style shifts slightly city to city. Flutter brings its own paint and its own brush, and paints the identical mural in every city. That's why a Flutter app looks and behaves pixel-identical on an iPhone and a Samsung — Flutter isn't borrowing either phone's paintbrush. It brought its own.

> **Widget** — one visible piece of the screen.

In Flutter, everything you see on screen is a widget. A button is a widget. A block of text is a widget. A spacer that adds blank space is a widget. Even the invisible container arranging things in a row is a widget. You build a Flutter screen by combining small widgets into bigger widgets, the way you'd build a house out of individual bricks.

Widgets get six full sessions starting at Session 10. For today, know the word, and know that **"everything is a widget"** is the motto of this entire framework.

### Real code, so it stops being an abstract scary word

Here's part of a real, complete, working Flutter app — the one in [`code/final/demo_app/lib/main.dart`](code/final/demo_app/lib/main.dart):

```dart
body: const Center(
  child: Text(
    'Hello, future developer!',
    style: TextStyle(fontSize: 24),
  ),
),
```

See `Text('Hello, future developer!')`? That's a widget. It tells Flutter: *put this exact sentence on the screen.* The `style` part sets its size.

And that's it — that's what runs to put one sentence on a real emulated phone screen.

You'll be able to read lines like this and understand them by the end of **this week** — not this course, this week. Code is not a secret language. It's closer to very precise English than people expect.

Open [`code/final/demo_app/lib/main.dart`](code/final/demo_app/lib/main.dart) and read the whole file now if you want. You will not understand most of it, and that is completely fine and completely expected. Look at it the way you'd look at a page of a language you're about to start learning.

---

## 4. Your new toolbox

Four words you'll hear constantly from Session 2 onward. Learn them now so they don't slow you down later.

| Term | What it is |
|---|---|
| **IDE** | "Integrated development environment" — the special text editor you write code in. This course uses **VS Code**. Think of it as a word processor built for source code instead of essays. |
| **Emulator** | A fake phone, running as a window on your actual computer, that behaves close enough to a real device to test your app without owning ten physical phones. |
| **SDK** | "Software development kit" — the complete bundle of tools, including the Flutter framework and the compiler, that makes your computer capable of building Flutter apps at all. You install this yourself in Session 2. |
| **Hot reload** | When you change a line of code, Flutter updates the running app in under a second. No restarting, no waiting. Full lesson in Session 3 — the first time you see it live is the moment this course clicks for a lot of people. |

---

## Try it yourself #2

Say out loud — actually say it, don't just think it — one sentence explaining to an imaginary friend what Flutter is and why it's different from a normal app. Use the word **"widget"** somewhere in your sentence.

If you can do that in one breath, you've learned the core idea of today's session.

<details>
<summary><strong>A model answer</strong></summary>

"Flutter is a framework that lets me write one app that runs on both iPhone and Android, by drawing its own screen out of small building blocks called widgets."

Yours doesn't need to match word for word. If it mentions (1) write once, (2) two platforms, and (3) widgets as the building blocks, you've got it.
</details>

---

## Break it on purpose

Every session in this course deliberately breaks something, so that when it happens to you by accident, you already know the feeling. Here's the first one.

In the demo app, that line reads:

```dart
child: Text(
  'Hello, future developer!',
  style: TextStyle(fontSize: 24),
),
```

Delete one closing parenthesis — the `)` that closes `Text(` — and run it. The app doesn't start. Instead, red text:

```
Error: Expected ')' before this.
```

> **Syntax error** — a typo the compiler couldn't work around.

It means a strict grammar rule got broken. In this case, a parenthesis was opened and never closed. The compiler isn't being dramatic. It genuinely cannot guess what was meant, so it stops and tells you exactly where it got confused.

**Here's the mindset shift to make right now, in Session 1, before you've installed anything: this red text is not failure.** It is the single most common experience of every developer, every day, at every experience level. Professionals see red error text daily.

The skill isn't "never make mistakes." The skill is *read the message, find the line, fix it, move on* — calmly, like reading a parking ticket, not like getting bad news.

Put the parenthesis back, run again, and it works. Thirty seconds. That's the cycle you'll live in for the rest of this course: write, break, read the message, fix, move on.

---

## Your 12-week map

You're at Module 0, Session 1 of 3. Here's the whole mountain before you start climbing it.

| Module | What you learn | What you build |
|---|---|---|
| **0. Foundations** (Sessions 1–3) | How apps work, installing your tools, your first `flutter run` | *you are here* |
| **1. Dart From Zero** (4–9) | The actual programming language behind Flutter: variables, functions, loops | **Quiz Engine** — a working quiz in a terminal window, pure logic, no visuals (S9) |
| **2. Widgets & Layout** (10–15) | Arranging text, images, and buttons on screen | **Portfolio Profile Page** — a real, styled screen about you (S15) |
| **3. Interaction & State** (16–18) | Your apps start responding to taps | **Tip Calculator** that actually calculates (S18) |
| **4. Forms & Input** (19–21) | Text fields, validation, real user input | **Sign-Up Screen** with full validation (S21) |
| **5. Navigation** (22–24) | Multiple screens, moving between them, passing data | **Recipe Browser** with tabs and a drawer (S24) |
| **6. Styling & Motion** (25–27) | Colour schemes, custom fonts, animation | — |
| **7. Async & Real Data** (28–30) | Your app talks to the internet for the first time | **Weather App** pulling live data (S30) |
| **8. Capstone** (31–36) | Everything converges | **TaskFlow** — the app from the start of today. Graduation. |

**"What if I fall behind?"** Every mini-app builds on the module before it. So if something in Module 2 feels shaky, that's your cue to rewatch Module 2 — not to panic about Module 3. This isn't a race. Nobody's timing you but you.

---

## Three things to remember

1. An app is **source code**, translated by a **compiler** into something your phone can run.
2. **Flutter** is a framework that draws its own identical screen, out of **widgets**, on every device.
3. **Red error text is a normal Tuesday**, not an emergency.

---

## Cheat sheet

Session 1 has no syntax yet — here are the core ideas, in your pocket.

| Concept | Plain-English definition |
|---|---|
| Source code | The instructions a person wrote, telling the app what to do |
| Compile | Translating that code into something your phone's processor can run |
| Native app | Built for one platform only, using that platform's own toolkit — written twice for iPhone + Android |
| Web app | A website dressed up to feel like an app — works everywhere, but isn't a real installed app |
| Cross-platform app | Written once, runs as a real app on both iPhone and Android — Flutter's approach |
| Framework | A pre-built toolbox of code that handles the hard, repetitive work for you |
| Widget | Anything you see on a Flutter screen — text, buttons, spacing, all of it |
| IDE | The special editor you write code in (this course uses VS Code) |
| Emulator | A fake phone that runs on your computer, for testing without a real device |
| SDK | The full bundle of tools — Flutter + compiler — that lets your computer build Flutter apps |
| Hot reload | Flutter updating a running app instantly after a code change — full lesson in Session 3 |
| Syntax error | The compiler's way of saying "this doesn't follow the grammar rules of the language" |

**The one-sentence version of today:** an app is source code, compiled into something your phone can run — and Flutter is a framework that draws that app's own identical screen, out of small pieces called widgets, on any device.

---

## When it goes wrong

Session 1 has no code for you to write, so there's nothing to break yet. But here are two things you'll likely see on screen in the next two sessions, decoded now so they don't spook you later.

| What you'll see | What it actually means | The fix |
|---|---|---|
| Red error text after running an app, e.g. `Error: Expected ')' before this.` | A **syntax error** — a grammar rule the compiler needs got broken, like an unclosed parenthesis or a missing comma | Read the line number the error points to, compare it against what you meant to type, and fix that one spot |
| `command not found: flutter` — you'll likely see this once in Session 2, before setup finishes | Your computer doesn't yet know where the Flutter tools live | This gets resolved as part of the Session 2 installation steps. Expected, not a mistake on your part |

---

## Homework

**Estimated time: 20 minutes.** No coding — you have no tools installed yet. That changes next session.

Pick one app you personally use every single day. Write down:

1. **Three guesses** about how it's built — native, web, or cross-platform — with one reason for each guess.
2. **One specific thing** about that app's screen (a button, an animation, a layout) that you'd love to be able to build yourself someday.

**You're done when:**

- [ ] All three guesses are written down **with a stated reason** — not just the word "native" or "web" on its own
- [ ] The "one thing to recreate" is specific. Not "I like the app," but "the way the send button animates when I tap it"
- [ ] It's a few sentences or a short list. No particular format required

**Why this matters:** you're training the same eye you'll use for the rest of this course — noticing *how* software feels, before you know *why* it feels that way. Every session from here builds toward you answering "why" as well as "how."

### Stretch goal

Find one app on your phone you genuinely cannot classify — one that fooled your eye completely. Screenshot it, and write two sentences on what specifically made it so convincing. Bring it up before Session 2.

---

## Check yourself

1. **What is source code?**
   a) A type of phone hardware
   b) The instructions a person wrote that describe what an app should do
   c) A picture on the app icon
   d) The name of an app store

2. **What does "compile" mean?**
   a) Deleting unused code
   b) Translating human-written code into something the phone's processor can run
   c) Designing an app's colours
   d) Uploading an app to the app store

3. **What is the main tradeoff of a native app?**
   a) It's slow and clunky
   b) It feels great on one platform but must be written separately for each platform
   c) It can't be installed on a phone at all
   d) It only works in a web browser

4. **What makes Flutter different from many other cross-platform tools?**
   a) It only works on Android
   b) It draws its own screen, pixel by pixel, instead of borrowing the phone's native buttons
   c) It doesn't use widgets
   d) It requires no compiler

5. **What is a syntax error?**
   a) A problem with your internet connection
   b) A visual design mistake
   c) A break in code's strict grammar rules that stops the compiler from understanding it
   d) A missing app icon

<details>
<summary><strong>Answers</strong></summary>

1. **b** — Source code is the human-written instructions; everything else in the app follows from it.
2. **b** — Compiling is the translation step from human-readable code to phone-executable instructions.
3. **b** — Native apps feel excellent on their one platform, but must be built twice, in different languages.
4. **b** — Flutter renders its own pixels via its own engine rather than asking the OS for native UI components. That's why it looks identical across devices.
5. **c** — A syntax error means the code broke a strict grammar rule and the compiler couldn't guess what was meant.
</details>

---

## New words from this session

`source code` · `compile / compiler` · `native app` · `web app` · `cross-platform app` · `framework` · `widget` · `rendering engine` · `IDE` · `emulator` · `SDK` · `hot reload` · `syntax error`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Next up

**[Session 2 — Full Environment Setup](../02-full-environment-setup/)**

Next session you install everything: the Flutter SDK, your code editor, your emulator. And you run your very first Flutter app with your own hands, on your own computer.

That moment — watching something you built appear on a screen for the first time — is the one most developers remember from when they started. It's your turn.

---

[← Session 0](../00-intro-to-git-and-github/) · [Course home](../../README.md) · [Glossary](../../glossary.md) · [Session 2 →](../02-full-environment-setup/)
