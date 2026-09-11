# Solutions 00 — Git and GitHub

[← Back to the exercises](../00-git-and-github.md) · [Workbook guide](../README.md)

> Tried it properly first? Good. Every Git output below is real — captured from an actual run, not typed from memory. Your version numbers, folder names and commit IDs will differ; everything else should match.

---

## 0.1 ★ Git versus GitHub

1. **Git** is a tool on your computer that keeps track of every change made to a folder of files, so you can see what changed and undo it.
2. **GitHub** is a website that stores Git repositories online, so people can share them and download copies.
3. **Git lives on your computer. GitHub lives on the internet.**

The chapter's analogy: *Git is the camera, GitHub is the photo-sharing site.* You can take photos without ever uploading them. You can't upload photos you never took.

---

## 0.2 ★ Is it installed?

Any line that starts `git version` followed by a number is a pass. For example:

```
git version 2.53.0.windows.3
```

On a Mac it looks more like `git version 2.39.5 (Apple Git-154)`. The exact number doesn't matter.

If you got `'git' is not recognized...` or `command not found: git`: either Git isn't installed, or your terminal was opened before the installer finished. Close **every** terminal window, open a fresh one, and try again.

---

## 0.3 ★ Match the command

**1-D, 2-E, 3-A, 4-B, 5-F, 6-C**

| Command | What it does |
|---|---|
| `git clone <url>` | D. Downloads a complete copy — once per repo |
| `git pull` | E. Fetches and applies whatever changed online |
| `git status` | A. Shows what has changed in your copy right now |
| `git restore <file>` | B. Throws away your changes to one file |
| `git restore .` | F. Throws away every change in this folder and below |
| `git --version` | C. Confirms Git is installed |

---

## 0.4 ★ Read the status

The full output looks like this:

```
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

1. The last line is `nothing to commit, working tree clean`.
2. It means **your copy exactly matches the course repository — you haven't changed anything.** This is the state you always want the course folder to be in.

**A detail worth knowing:** the middle line, `Your branch is up to date with 'origin/main'`, sounds like it's checked GitHub for updates. It hasn't. `git status` never goes online — that line compares against the last time you pulled. The only way to actually get updates is `git pull`.

(The chapter's example leaves that middle line out to keep things short. Real output includes it.)

---

## 0.5 ★★ Break one, restore one

**Step 2** — after editing `glossary.md`:

```
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   glossary.md

no changes added to commit (use "git add" and/or "git commit -a")
```

- The file listed: `modified:   glossary.md`
- The hint you want: `(use "git restore <file>..." to discard changes in working directory)`

There's a second hint about `git add`. That's for saving changes you *want* to keep — never what you want in the course folder. Ignore it here.

**Step 3** — `git restore glossary.md` prints **nothing at all**. In the terminal, silence usually means success.

**Step 4** — back to `nothing to commit, working tree clean`.

**The difference:** in step 2 Git listed a changed file and told you how to undo it. In step 4 there's nothing to list — the file is back exactly as the course published it.

---

## 0.6 ★★ Break two, fix both at once

- `git status` lists **2** files: `README.md` and `START-HERE.md`.
- The single command is:

```
git restore .
```

The `.` means **"this folder, and everything inside it."** Run from the top of the course folder, that covers every file in the course — so both edits go.

If you ran it from *inside* a subfolder, it would only restore files in that subfolder. That's why the chapter says to run it from the top.

---

## 0.7 ★★ Work in your own folder

**Mac, Linux, or Git Bash on Windows:**

```
cp -r flutter-mobile-app-beginner-course/sessions/04-variables-types-null-safety/code/starter/dart_practice ~/my-flutter-work/session-04
```

**Windows, File Explorer:** open the course folder, go to `sessions` → `04-variables-types-null-safety` → `code` → `starter`, right-click `dart_practice` → **Copy**, then paste it into your own work folder and rename it `session-04`.

**The proof:** inside the course folder, run

```
git status
```

and it must still say `nothing to commit, working tree clean`. Copying something *out* of a folder never changes the folder it came from.

---

## 0.8 ★★ The pull that refused

This is the exact message Git gives:

```
error: Your local changes to the following files would be overwritten by merge:
	glossary.md
Please commit your changes or stash them before you merge.
Aborting
```

1. **What happened:** you edited `glossary.md` in the course folder, and that same file was also updated online. Git won't silently throw your edit away, so it stopped. The word `Aborting` means it changed **nothing** — you're exactly where you were before.

2. **The fix, in order:**

```
git status
git restore glossary.md
git pull
```

`git status` confirms which file is the problem, `git restore` throws your edit away, and `git pull` now works:

```
Updating 487db87..91e09c1
Fast-forward
 glossary.md | 1 +
 1 file changed, 1 insertion(+)
```

3. **The habit:** never edit files inside the course folder. Copy anything you want to work on out to your own folder first.

**Ignore the message's own advice.** "Commit your changes or stash them" is for people who want to *keep* their edits. In the course folder, you never do.

---

## 0.9 ★★ Not a repository

```
fatal: not a git repository (or any of the parent directories): .git
```

It means **your terminal isn't inside a Git repository.** Git looked in the current folder, and every folder above it, and found no repository.

Almost always, your terminal is simply in the wrong folder — your home folder, or your work folder. Fix it by moving into the course folder first:

```
cd flutter-mobile-app-beginner-course
git status
```

The folder you're in is usually shown at the start of your terminal's prompt. Check it before running Git commands.

---

## 0.10 ★★ The update that isn't there

Any two of these:

1. **VS Code hasn't refreshed.** Click the refresh icon at the top of VS Code's file explorer, or close and reopen the folder.
2. **You're looking at a different folder.** VS Code might have your *work* folder open, not the course folder. Check the folder name at the top of the explorer.
3. **You pulled in a different place.** If you ran `git pull` in some other repository, the course folder didn't change. Run `git pull` again from inside the course folder and read what it prints.

---

## 0.11 ★★★ Why restore is safe here and dangerous there

In the course folder, **every change is an accident** — you never meant to edit the course — so throwing changes away loses nothing you wanted, and puts the file back exactly as it was published.

In your work folder, **your changes are your work.** `git restore` throws them away permanently, with no undo. Run it there by mistake and an hour of exercises is simply gone.

That's the real reason for keeping the two folders separate: the same command is a rescue in one and a disaster in the other.

---

## 0.12 ★★★ Your own repository

**Step 1** — `git init` prints something like:

```
Initialized empty Git repository in .../my-flutter-work/session-04/.git/
```

**Step 2** — `git add .` prints nothing. `git commit -m "Session 4 starting point"` prints something like:

```
[main (root-commit) 426a196] Session 4 starting point
 3 files changed, 24 insertions(+)
```

**Step 3** — `git status`:

```
On branch main
nothing to commit, working tree clean
```

Your branch may say `master` instead of `main` — that depends on how Git was set up on your computer, and either is fine. There's also no `Your branch is up to date` line, because this repository was never cloned from anywhere. It only exists on your machine.

**Step 4** — if you saw `Please tell me who you are`, Git needs a name and email to stamp on your commits. You'd have run:

```
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

then run the commit again. You only ever do this once per computer.

**Step 5** — after changing a line:

```
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   bin/dart_practice.dart

no changes added to commit (use "git add" and/or "git commit -a")
```

**The difference:** in step 3, everything was saved in a commit. In step 5, you have a change Git knows about but hasn't saved yet. After `git add .` and a second `git commit -m "..."`, it goes back to clean.

**This time, notice the `git add` hint is the one you want** — the opposite of the course folder. That's the whole difference between the two folders in one line.

---

## 0.13 ★★★ True or false

| | | Why |
|---|---|---|
| 1 | **False** | You `git clone` **once**, ever. Before each session you run `git pull`. |
| 2 | **False** | Git is a program on your computer. GitHub is a website that hosts Git repositories. |
| 3 | **True** | If you've changed a file that also changed online, `git pull` refuses — exactly what 0.8 showed. |
| 4 | **False** | `git restore` permanently throws changes away. There's no undo. |
| 5 | **False** | `git status` only *reports*. It never changes a file. That's why it's always safe to run. |
| 6 | **False** | Do your work in your **own** folder. Even if you restore afterwards, you'll forget one day — and restoring would also throw away the work you meant to keep. |
| 7 | **True** | That's exactly what "working tree clean" means. |
| 8 | **False** | `git --version` works from any folder. It asks about Git itself, not about a repository. |

---

## One extra, for Windows

If `git clone` ever fails with `Filename too long`, the folder you're cloning into is buried too deep — Windows has a limit on how long a full file path can be. Clone into somewhere shorter, like your Desktop or `C:\dev`, and it'll work. You're very unlikely to hit this, but now you'll recognise it if you do.
