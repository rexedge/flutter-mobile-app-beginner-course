# Start Here

Three minutes of reading that will save you hours later.

---

## 1. What this repository is

It's the written version of the course. One folder per session, each containing:

- **`README.md`** — the read-through. The full session in reading form: concepts, code, challenges, homework, and a quiz.
- **`code/starter/`** — the project as it looks at the *start* of that session
- **`code/final/`** — the project as it looks at the *end* of that session

The read-through stands on its own. If you missed a live session, or watched it and want to review, you can learn the whole thing from the written version.

---

## 2. Getting it onto your computer

**[Session 0 — Intro to Git and GitHub](sessions/00-intro-to-git-and-github/) covers this properly**, in about 15 minutes. Read it before Session 1. The short version:

```
git clone https://github.com/rexedge/flutter-mobile-app-beginner-course.git
cd flutter-mobile-app-beginner-course
```

That downloads a copy of everything. Later, to get new sessions and fixes:

```
git pull
```

Run `git pull` before each session. It takes a second.

---

## 3. The one rule that prevents all the pain

> **Never edit files inside this folder.**

This repository is read-only for you. If you change files here and then run `git pull`, Git will complain about conflicts and you'll spend twenty minutes fixing something that isn't a real problem.

**Instead, copy the starter project out to your own folder before you work on it.**

Say you're on Session 11. Do this:

```
cp -r flutter-mobile-app-beginner-course/sessions/11-text-image-icon-container/code/starter/widget_basics ~/my-flutter-work/session-11
cd ~/my-flutter-work/session-11
```

On Windows, copy and paste the folder in File Explorer — same idea.

Now you have your own copy to break, experiment with, and mess up freely. The course copy stays clean, and `git pull` will always work.

If you edit a course file by accident, it's a two-command fix — `git status`, then `git restore`. [Session 0](sessions/00-intro-to-git-and-github/) walks through it deliberately so you've already met it once.

---

## 4. How to actually read a session

Each read-through is roughly 15–25 minutes of reading, but that's not how long the session takes. Budget **60–90 minutes** including the code and homework.

Work through it in order:

1. **Read the whole thing once**, without touching your keyboard. Get the shape of it.
2. **Go back to the top and build along.** Type the code — don't copy-paste it. Typing is slower, and that's the point: it's where the learning happens.
3. **Do the "Try it yourself" boxes.** Actually stop and try before opening the solution. The solutions are collapsed behind a triangle you click. Opening it early feels efficient and teaches you nothing.
4. **Do the "Break it on purpose" section.** Deliberately breaking your own code and reading the error is the fastest way to stop being afraid of errors.
5. **Do the homework.** Each one has a "You're done when" checklist so you can grade yourself.

---

## 5. When you're stuck

In this order:

1. **Read the error message.** All of it, slowly. It usually names the file and the line number.
2. **Check the "When it goes wrong" table** at the bottom of that session's read-through. The most common errors for that session are decoded there in plain English.
3. **Check the [glossary](glossary.md)** if a word is the thing blocking you.
4. **Compare against `code/final/`.** Open the finished file next to yours and look for the difference.
5. **Ask.** Bring the exact error text, not a description of it.

Being stuck is not a sign you're behind. Every developer is stuck for a meaningful part of every working day. The difference between a beginner and a professional isn't how often they get stuck — it's how calmly they read the error.

---

## 6. Falling behind

If a session feels shaky, don't push forward hoping it'll click later. Go back and redo the previous session's homework. Everything in this course is stacked — Module 3 assumes Module 2 is solid.

This isn't a race. Nobody's timing you but you.

---

**Ready?** Start with **[Session 0 — Intro to Git and GitHub](sessions/00-intro-to-git-and-github/)**, then [Session 1](sessions/01-welcome-and-how-apps-work/).
