# Coursework 00 — Git and GitHub

**Covers:** [Session 0 — Intro to Git and GitHub](../../sessions/00-intro-to-git-and-github/) · **13 exercises** · about 45 minutes
**Solutions:** [solutions/00-git-and-github.md](solutions/00-git-and-github.md)

You need a terminal and your cloned course folder. Nothing else.

> **Every exercise here that edits a course file ends by restoring it.** When you finish this set, `git status` in the course folder must say `working tree clean`. That's part of the test.

---

## Warm-up ★

### 0.1 ★ Git versus GitHub

**Explain.** In one sentence each:

1. What is Git?
2. What is GitHub?
3. Which of the two lives on your computer, and which lives on the internet?

---

### 0.2 ★ Is it installed?

**Do.** Open a **fresh** terminal window and run:

```
git --version
```

Write down exactly what it printed. If it printed an error instead, write down the error — then check the [When it goes wrong](../../sessions/00-intro-to-git-and-github/#when-it-goes-wrong) table in the chapter.

---

### 0.3 ★ Match the command

**Explain.** Match each command on the left to what it does on the right. Write your answer as pairs, like `1-C`.

| Command | | What it does |
|---|---|---|
| 1. `git clone <url>` | | A. Shows what has changed in your copy right now |
| 2. `git pull` | | B. Throws away your changes to one file |
| 3. `git status` | | C. Confirms Git is installed |
| 4. `git restore <file>` | | D. Downloads a complete copy of a repository — once per repo |
| 5. `git restore .` | | E. Fetches and applies whatever changed online |
| 6. `git --version` | | F. Throws away every change in this folder and below |

---

### 0.4 ★ Read the status

**Do.** `cd` into your course folder and run `git status`.

1. Copy the **last line** it printed.
2. In plain English, what does that line tell you?

---

## Practice ★★

### 0.5 ★★ Break one, restore one

**Do.** Inside the course folder:

1. Open `glossary.md`, type a line of nonsense at the bottom, and save.
2. Run `git status`. Write down: the name of the file it lists, and the hint it gives you in brackets.
3. Run `git restore glossary.md`. What does it print?
4. Run `git status` again.

What's the difference between the output in step 2 and step 4?

---

### 0.6 ★★ Break two, fix both at once

**Do.** Inside the course folder:

1. Add a line to `README.md` and save.
2. Add a line to `START-HERE.md` and save.
3. Run `git status`. How many files does it list?
4. Undo **both** changes using **one** command.

Which command did you use, and why does it reach both files?

---

### 0.7 ★★ Work in your own folder

**Do.** Copy the Session 4 starter project out of the course folder and into your own work folder. On Mac or Linux, use a command. On Windows you can copy and paste the folder in File Explorer.

The starter lives at:

```
sessions/04-variables-types-null-safety/code/starter/dart_practice
```

Then prove the course folder wasn't touched.

1. What did you do to copy it? (The command, or the steps in File Explorer.)
2. Which command proves the course folder is still untouched, and what should it say?

---

### 0.8 ★★ The pull that refused

**Explain.** You run `git pull` in the course folder and get this:

```
error: Your local changes to the following files would be overwritten by merge:
        glossary.md
Please commit your changes or stash them before you merge.
Aborting
```

1. In plain English, what happened?
2. Write the exact commands you'd run, in order, to fix it and get the update.
3. Name one habit that means you'll never see this message again.

---

### 0.9 ★★ Not a repository

**Explain.** You type `git status` and get:

```
fatal: not a git repository (or any of the parent directories): .git
```

What does it mean, and how do you fix it?

---

### 0.10 ★★ The update that isn't there

**Explain.** You ran `git pull`, it clearly downloaded something, but when you look in VS Code the new session folder isn't there.

Give two things to check.

---

## Challenge ★★★

### 0.11 ★★★ Why restore is safe here and dangerous there

**Explain.** In two or three sentences: why is `git restore` exactly the right tool inside the course folder, but a dangerous one inside your own work folder?

---

### 0.12 ★★★ Your own repository

**Do.** This uses the chapter's [optional section](../../sessions/00-intro-to-git-and-github/#optional-saving-your-own-work). In **your own work folder** — never the course folder — go into the Session 4 copy you made in 0.7 and:

1. Run `git init`.
2. Run `git add .` then `git commit -m "Session 4 starting point"`.
3. Run `git status`. What does it say?
4. If Git said `Please tell me who you are` at step 2, what did you have to run before the commit would work?
5. Change any line in `bin/dart_practice.dart`, save, and run `git status`. Then commit again with a different message.

What's the difference between what `git status` says in step 3 and in step 5, before your second commit?

---

### 0.13 ★★★ True or false

**Explain.** Mark each statement true or false. For every **false** one, rewrite it so it becomes true.

1. You need to run `git clone` before every session.
2. GitHub and Git are two names for the same program.
3. `git pull` only works when your working tree is clean — or at least when you haven't changed the same files that changed online.
4. `git restore .` can be undone if you change your mind.
5. `git status` changes files.
6. It's fine to do your homework inside the course folder as long as you remember to restore it afterwards.
7. "Working tree clean" means your copy exactly matches the repository.
8. `git --version` needs to be run inside the course folder to work.

---

## Done?

- [ ] Every exercise attempted
- [ ] `git status` in your course folder says `working tree clean`
- [ ] You have a copy of the Session 4 starter in your own work folder
- [ ] You checked your answers against the [solutions](solutions/00-git-and-github.md)
