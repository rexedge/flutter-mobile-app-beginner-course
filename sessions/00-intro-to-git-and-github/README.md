# Session 0 — Intro to Git and GitHub

**Before Module 0** · about 12 minutes to read, 15 minutes to do
**No code project this session.** Nothing to install except Git itself.

---

> **This one isn't a video session.** It's a short written chapter to read before Session 1, because you need one tool — Git — just to get the course files onto your computer. Everything here is the practical minimum. Git is a big tool with a lot of features you will genuinely never need in this course, and none of them are in this chapter.

---

## What you'll be able to do by the end

- Explain what Git is, what GitHub is, and how they're different
- Install Git and confirm it works
- **Clone** the course repository to your own computer
- **Pull** updates when new sessions are published
- Recover cleanly when you've accidentally edited a course file

## Before you start

Nothing. This is the very first thing in the course.

---

## The big idea

The course materials — every read-through, every starter project, every finished example — live in one folder on the internet called a **repository**. You're going to copy that folder onto your computer, and then, whenever new sessions are published, pull the new material down with one command.

That's it. That's the whole reason Git is in this course right now.

Later in your career Git becomes something much bigger: how teams work on the same codebase without overwriting each other. You don't need any of that yet. **You need four commands.**

---

## 1. What Git actually is

> **Git** — a tool that tracks every change made to a folder of files, and can move those changes between computers.

Think about how you've probably saved important documents before:

```
essay.docx
essay-v2.docx
essay-v2-FINAL.docx
essay-v2-FINAL-actually-final.docx
```

Everyone has done this. It works, badly. You can't remember what changed between versions, you can't easily go back, and if two people edit at once, someone loses work.

Git does that job properly. It watches one folder, records every change as a numbered snapshot, and lets you move backward, forward, or sideways through that history.

> **Think of Git like a save system in a video game.** Not one save slot that gets overwritten — a full list of every checkpoint you've reached, any of which you can jump back to. And unlike a game, you can see exactly what's different between any two checkpoints.

**Git runs on your computer.** It's a program, like VS Code. It doesn't need the internet to work.

---

## 2. What GitHub is (and why it's not the same thing)

> **GitHub** — a website that hosts Git repositories so they can be shared between computers and people.

This trips up almost everyone at first, so let's be precise:

|                 | Git                          | GitHub                                           |
| --------------- | ---------------------------- | ------------------------------------------------ |
| What it is      | A program on your computer   | A website                                        |
| Made by         | The open-source community    | A company (owned by Microsoft)                   |
| Needs internet? | No                           | Yes                                              |
| What it does    | Tracks changes to your files | Stores repositories online so they can be shared |

> **Git is the camera. GitHub is the photo-sharing site.** You can own a camera and never upload anything. The camera works fine alone. GitHub is just where the pictures go when you want other people to see them.

There are other sites that do GitHub's job — GitLab, Bitbucket, and others. This course uses GitHub because that's where the course materials are hosted.

> **Repository** (usually shortened to **repo**) — one project's folder, with its entire history of changes.

The course materials are one repo. Later, if you want, your own practice work can be another.

**Do you need a GitHub account?** Not to read this course. Public repositories can be downloaded by anyone, no account required. You'd only need an account if you later want to put your own work online — there's an optional section at the end about that.

---

## 3. Install Git

If you've already done Session 2, Git is installed and you can skip to step 4.

**On Windows:**

1. Go to [git-scm.com/downloads/win](https://git-scm.com/downloads/win)
2. Download the installer and run it
3. Click Next through the options, then Install. **The defaults are genuinely fine** — the installer asks a lot of questions with intimidating wording, and every default answer is correct for this course

**On Mac:** don't download anything. Open Terminal (Cmd+Space, type "Terminal") and run:

```
xcode-select --install
```

A dialog pops up. Click Install.

### Check it worked

Open a **new** terminal window and run:

```
git --version
```

You should see something like:

```
git version 2.47.1
```

The exact number doesn't matter. If you get an error instead of a version number, close every terminal window and open a fresh one — installers usually need a new window before they're recognised.

---

## 4. Clone the course repository

> **Clone** — download a full copy of a repository, including its entire history.

First, decide where you want the course to live. Your Desktop or Documents folder is fine. Move your terminal there:

```
cd Desktop
```

Then clone:

```
git clone https://github.com/rexedge/flutter-mobile-app-beginner-course.git
```

> **Replace `<your-org>` with the real address** you were given for this course. If you don't have it, ask before going further — everything below depends on it.

You'll see something like:

```
Cloning into 'flutter-for-beginners'...
remote: Enumerating objects: 428, done.
Receiving objects: 100% (428/428), 1.21 MiB | 3.40 MiB/s, done.
```

Now move into it:

```
cd flutter-for-beginners
```

Run `ls` (Mac) or `dir` (Windows) and you should see `README.md`, `START-HERE.md`, `glossary.md`, and a `sessions` folder.

**That's the whole course, on your computer.** You can now read every chapter in VS Code, or on GitHub in your browser — whichever you prefer. The files are identical.

---

## 5. Pull updates

> **Pull** — fetch whatever has changed in the online repository and apply it to your copy.

New sessions get published. Typos get fixed. To get the latest version, from inside the course folder:

```
git pull
```

If there's nothing new:

```
Already up to date.
```

If there is:

```
Updating 3f2a1b8..9c4d7e2
Fast-forward
 sessions/06-control-flow/README.md | 412 ++++++++++++++++++
 1 file changed, 412 insertions(+)
```

That's it. **Run `git pull` before each session.** It takes a second.

---

## 6. The one rule that prevents all the pain

> **Never edit files inside the course folder.**

This is the single most important thing in this chapter.

Your copy of the course repo is **read-only for you**. You can read it, run its code, and pull updates. You cannot push changes back — and you don't want to.

Here's why it matters: if you edit a course file, and that same file later changes online, `git pull` has two different versions of one file and no way to know which you meant. It stops and reports a **conflict**. Conflicts are fixable, but they're a genuinely miserable thing to meet in your first week for no reason.

### Do this instead

**Copy the starter project out to your own folder before working on it.**

Say you're starting Session 4:

```
cp -r flutter-for-beginners/sessions/04-variables-types-null-safety/code/starter/dart_practice ~/my-flutter-work/session-04
cd ~/my-flutter-work/session-04
```

On Windows, copy and paste the folder in File Explorer — same idea, no command needed.

Now you have your own copy to break, experiment with, and mess up freely. The course copy stays pristine, and `git pull` will always work.

**Keep one folder for the course and one folder for your work.** Never the same folder.

```
Desktop/
├── flutter-for-beginners/     ← the course. Read only. Pull updates here.
└── my-flutter-work/           ← yours. Break things here.
    ├── session-04/
    └── session-05/
```

---

## Break it on purpose

Every session in this course deliberately breaks something so you meet it calmly, on purpose, rather than by accident at 11pm. Here's Session 0's.

**Let's break the rule above, see what happens, and recover.**

Open any file in the course folder — `glossary.md` is a safe choice. Type some nonsense into it and save.

Now, from inside the course folder, ask Git what it thinks:

```
git status
```

```
On branch main
Changes not staged for commit:
  (use "git restore <file>..." to discard changes in working directory)
        modified:   glossary.md

no changes added to commit (use "git add" to track your changes)
```

**Read that carefully.** Git is not angry. It's telling you exactly three things: which file changed, that the change is only on your computer, and — right there in the parentheses — the command to undo it.

> **`git status`** — what has changed in my copy right now?

This is the single most useful Git command there is. When you're confused about what state you're in, run `git status`. It nearly always tells you what to do next, in plain English.

### The recovery

> **`git restore <file>`** — throw away my local changes to that file and put it back the way it came.

```
git restore glossary.md
```

Nothing prints. That's success. Run `git status` again:

```
On branch main
nothing to commit, working tree clean
```

**"Working tree clean"** means your copy exactly matches the course repo. `git pull` will now work perfectly.

To undo _all_ your accidental edits at once, from the top of the course folder:

```
git restore .
```

The `.` means "everything here and below."

> **Careful:** `git restore` permanently throws away those changes. That's exactly what you want for accidental edits to course files. It is exactly what you don't want in your own work folder — which is one more reason to keep the two separate.

---

## Try it yourself

Do all four of these now, in order. It's about five minutes and it's the entire skillset you need for the course.

1. Run `git --version` and confirm you get a version number
2. Clone the course repo and `cd` into it
3. Run `git pull` — you should get "Already up to date"
4. Edit a course file, run `git status`, then `git restore` it and confirm "working tree clean"

<details>
<summary><strong>You're done when</strong></summary>

- You have a folder called `flutter-for-beginners` on your computer containing `sessions/`, `glossary.md`, and `START-HERE.md`
- `git pull` inside that folder reports **"Already up to date"** rather than an error
- `git status` inside that folder reports **"working tree clean"**

**If `git pull` reports a conflict or refuses to run**, you have edited something. Run `git status` to see which file, then `git restore <that file>`.

**If `git clone` says "repository not found"**, check the URL — most often the `<your-org>` part was never replaced with the real address.

</details>

---

## Optional: saving your own work

**You do not need this to take the course.** Skip it if you'd rather get to Session 1 — you can come back any time.

Once you've built a few sessions' worth of practice code, you may want a history of your own work, or a backup that isn't only on your laptop. That's your _own_ repository, completely separate from the course one.

Inside your own work folder:

```
cd ~/my-flutter-work
git init
git add .
git commit -m "My Flutter course work so far"
```

| Command                   | What it does                                         |
| ------------------------- | ---------------------------------------------------- |
| `git init`                | Start tracking this folder with Git. Run once, ever  |
| `git add .`               | Stage everything that's changed, ready to be saved   |
| `git commit -m "message"` | Save a snapshot, with a note describing what you did |

> **Commit** — one saved snapshot of your work, with a message explaining it.

Repeat `git add .` and `git commit -m "..."` whenever you finish something worth keeping. That's a local history, on your machine, no account needed.

To put it online, create a free account at [github.com](https://github.com), make a new empty repository, and follow the commands GitHub shows you on the new repo's page. It walks you through it.

**Genuinely optional.** Nothing in this course depends on it.

---

## Three things to remember

1. **Git is a program on your computer. GitHub is a website.** Different things.
2. **`git pull` before each session** to get the latest material.
3. **Never edit files inside the course folder.** Copy the starter code out to your own folder first.

---

## Cheat sheet

| Command              | What it does                                                               |
| -------------------- | -------------------------------------------------------------------------- |
| `git --version`      | Confirms Git is installed                                                  |
| `git clone <url>`    | Downloads a full copy of a repository. Run once per repo                   |
| `git pull`           | Fetches and applies whatever changed online. Run before each session       |
| `git status`         | Shows what has changed in your copy. **Run this whenever you're confused** |
| `git restore <file>` | Throws away your local changes to that file                                |
| `git restore .`      | Throws away all local changes in the current folder and below              |

**Optional, for your own work only:**

| Command                | What it does                                        |
| ---------------------- | --------------------------------------------------- |
| `git init`             | Starts tracking a folder with Git. Once per project |
| `git add .`            | Stages all changes, ready to save                   |
| `git commit -m "note"` | Saves a snapshot with a description                 |

**Vocabulary:**

| Term               | Plain-English definition                                                  |
| ------------------ | ------------------------------------------------------------------------- |
| Repository (repo)  | One project's folder, plus its full history of changes                    |
| Clone              | Download a complete copy of a repository                                  |
| Pull               | Fetch and apply whatever changed online                                   |
| Commit             | One saved snapshot of your work, with a message                           |
| Conflict           | Git found two different versions of the same file and needs you to decide |
| Working tree clean | Your copy exactly matches the repository. Nothing edited                  |

---

## When it goes wrong

| What you'll see                                                           | What it actually means                                                           | The fix                                                                                                                   |
| ------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `'git' is not recognized...` (Windows) or `command not found: git` (Mac)  | Git isn't installed, or your terminal was opened before it finished installing   | Install Git, then **close every terminal window and open a fresh one**                                                    |
| `fatal: repository not found`                                             | The clone URL is wrong — usually the `<your-org>` placeholder was never replaced | Check the exact address you were given for the course                                                                     |
| `fatal: not a git repository`                                             | You're running a Git command in a folder that isn't a repo                       | `cd` into the course folder first. Git commands only work inside a repository                                             |
| `Your local changes to the following files would be overwritten by merge` | You edited a course file, and that same file changed online                      | `git status` to see which file, then `git restore <file>`, then `git pull` again                                          |
| `Please tell me who you are` (when committing)                            | Git wants a name and email before it records a snapshot                          | Run `git config --global user.name "Your Name"` and `git config --global user.email "you@example.com"`, then commit again |
| `git pull` succeeded but you don't see the new session                    | You're looking at an old window or an old folder                                 | Refresh VS Code's file explorer, and confirm you're inside the course folder, not your work folder                        |

---

## Homework

**Estimated time: 15 minutes.** This is genuinely just setup — do it once and it serves you for 12 weeks.

**You're done when:**

- [ ] `git --version` prints a version number
- [ ] The course repo is cloned onto your computer
- [ ] `git pull` inside it reports "Already up to date"
- [ ] You have created an empty second folder — `my-flutter-work` or similar — sitting **beside** the course folder, not inside it
- [ ] You've deliberately edited a course file, seen `git status` report it, and restored it back to clean

**Why this matters:** every session from here assumes you can get the material and get updates. Fifteen minutes now removes an entire category of problem from the next 12 weeks.

---

## Check yourself

1. **What's the difference between Git and GitHub?**
   a) They're two names for the same thing
   b) Git is a program on your computer; GitHub is a website that hosts repositories
   c) Git is for Windows, GitHub is for Mac
   d) GitHub is the paid version of Git

2. **What does `git clone` do?**
   a) Makes a duplicate of a file on your computer
   b) Downloads a full copy of a repository, including its history
   c) Uploads your work to the internet
   d) Deletes a repository

3. **You want the latest course material. Which command?**
   a) `git clone`
   b) `git status`
   c) `git pull`
   d) `git restore`

4. **You accidentally edited a course file. What's the safest first move?**
   a) Delete the whole course folder and clone it again
   b) Run `git status` to see what changed, then `git restore` that file
   c) Ignore it and hope
   d) Reinstall Git

5. **Where should you build your own practice code?**
   a) Directly inside the course folder, in `sessions/`
   b) Inside the course folder's `code/starter/` folder
   c) In a completely separate folder of your own, beside the course folder
   d) It doesn't matter

<details>
<summary><strong>Answers</strong></summary>

1. **b** — Git runs locally and needs no internet. GitHub is one of several websites that host Git repositories online.
2. **b** — Cloning downloads the entire repository and its full history, not just the current files.
3. **c** — `git pull` fetches whatever changed online and applies it to your copy.
4. **b** — `git status` tells you exactly which file changed and prints the restore command in its own output. Re-cloning works but is overkill.
5. **c** — Keeping your work separate means `git pull` never conflicts with anything you wrote. This is the one rule worth being strict about.
</details>

---

## New words from this session

`Git` · `GitHub` · `repository (repo)` · `clone` · `pull` · `commit` · `conflict` · `working tree`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Next up

**[Session 1 — Welcome: How Mobile Apps Actually Work](../01-welcome-and-how-apps-work/)**

You have the course files. Now the actual course starts — with no code at all, and one question: what _is_ an app?

---

[Course home](../../README.md) · [Start here](../../START-HERE.md) · [Glossary](../../glossary.md) · [Session 1 →](../01-welcome-and-how-apps-work/)
