# Session 8 — Collections: List, Set, Map

**Module 1 — Dart From Zero** · Session 8 of 36 · about 20 minutes to read
**Code for this session:** [`code/starter/dart_practice`](code/starter/dart_practice) → [`code/final/dart_practice`](code/final/dart_practice)

---

## What you'll be able to do by the end

- Create and use a `List` — ordered values, looked up by numbered position
- Create and use a `Set` — a collection that keeps only unique values
- Create and use a `Map` — values looked up by a key you choose, not by position
- Loop over any collection with a `for`-`in` loop
- Merge collections with the spread operator (`...`) and include items conditionally with collection-if

## Before you start

- Finish [Session 7](../07-functions-parameters-arrow-syntax/). Today runs `calculateGrade` — the function you built there — across many scores at once.
- Same `dart_practice` project. Still no emulator. This is the last session before you build your first real app.

---

## The big idea

Every variable you've written so far holds exactly one value. One name. One age. One score.

That's been a hard ceiling. `calculateGrade` is a perfectly good function, but calling it means writing one line per score:

```dart
print('Score 82 earns a grade of ${calculateGrade(82)}.');
print('Score 95 earns a grade of ${calculateGrade(95)}.');
```

Thirty students, thirty lines. Watch what today makes possible instead:

```dart
List<int> scores = [82, 95, 61, 74, 88];

for (int score in scores) {
  print('Score $score: ${calculateGrade(score)}');
}
```

```
Score 82: B
Score 95: A
Score 61: F
Score 74: C
Score 88: B
```

One function. One loop. An entire class of scores, graded. Add a sixth score to that list and nothing else changes — the loop just runs one more time.

> **Collection** — a type built to hold many values inside a single variable.

Dart gives you three, and you'll learn all three today: `List`, `Set`, and `Map`. Together with `String`, `int`, `double` and `bool` from Session 4, they are essentially the complete vocabulary of data you'll use for the rest of this course. Everything after today is about organising these shapes more cleverly — not about learning new categories.

---

## 1. `List` — ordered and numbered

> **`List`** — an ordered sequence of values, each at a numbered position.

```dart
List<String> names = ['Ava', 'Liam', 'Noor'];
print(names);
```

```
[Ava, Liam, Noor]
```

**The analogy:** a `List` is a numbered coat check at a theatre. Every item has an exact position, and you can always ask "what's on hook 2?" and get a definite answer.

### First: what are those angle brackets?

`List<String>` is new syntax, so let's not skip past it.

```dart
List<String> names   // a list of Strings
List<int> scores     // a list of ints
List<bool> answers   // a list of bools
```

Read it as **"List *of*"**. The type inside `<>` says what kind of value this list is allowed to hold, and Dart enforces it exactly as strictly as it enforced `int age = 34;` back in Session 4:

```dart
List<int> scores = [82, 95];
scores.add('hello');   // error — 'hello' is a String, not an int
```

That's null safety's older sibling: the same principle of "state what you mean and Dart will hold you to it," applied to collections.

### Index

> **Index** — a value's numbered position in a list, starting at **0**.

```dart
print(names[0]);       // Ava
print(names[2]);       // Noor
print(names.length);   // 3
```

Dart lists are **zero-indexed**. The first item is at index `0`, not `1`. So a list of 3 items has valid indexes `0`, `1`, `2` — and the last valid index is always **`length - 1`**, never `length`.

That off-by-one gap is the source of one of the most common bugs in all of programming, and you'll trigger it deliberately later in this chapter.

**Why does counting start at 0?** It's a convention shared by nearly every programming language, rooted in how positions are calculated in memory. It feels strange for about a week and then becomes completely automatic.

### Adding, removing, looping

```dart
names.add('Kai');
names.remove('Liam');
print(names);
```

```
[Ava, Noor, Kai]
```

`.add()` appends to the end. `.remove()` deletes the first matching value.

And now the loop that made the grade report at the top of this chapter work:

```dart
for (String name in names) {
  print('Hello, $name!');
}
```

```
Hello, Ava!
Hello, Noor!
Hello, Kai!
```

This is a **`for`-`in` loop** — a different shape from Session 6's counting loop. Compare them directly:

```dart
// Session 6 — you manage a counter, then use it to index in
for (int i = 0; i < names.length; i++) {
  print(names[i]);
}

// Session 8 — Dart hands you each item directly
for (String name in names) {
  print(name);
}
```

Both print the same thing. The second has no counter to get wrong, no `length` to check, and no way to run off the end of the list. **When you want every item in order, use `for`-`in`.** Save the counting loop for when you genuinely need the number `i` itself.

---

## 2. `Set` — unique values only

> **`Set`** — a collection that automatically keeps only unique values.

A `Set` looks a lot like a `List`, but written with curly braces, and it silently refuses duplicates.

```dart
Set<String> uniqueGrades = {'B', 'A', 'F', 'C', 'B'};
print(uniqueGrades);
print(uniqueGrades.length);
```

```
{B, A, F, C}
4
```

Five values went in. Four came out. Dart dropped the second `'B'` without a word, because a `Set` guarantees everything inside it is one of a kind. That's the entire feature, and it's genuinely useful — "which grades appeared at all this round?" is a `Set` question.

You can ask whether something is in there:

```dart
print(uniqueGrades.contains('A'));   // true
```

### Two things that surprise people

**A `Set` is not sorted.** Look at that output again: `{B, A, F, C}`. Not alphabetical — that's the order the values were first added. A `Set` promises *uniqueness*, not *ordering*. If you need it sorted, you sort it yourself.

**Empty curly braces make a `Map`, not a `Set`.**

```dart
var mystery = {};       // this is an empty Map!
Set<String> proper = <String>{};   // this is an empty Set
```

Plain `{}` defaults to an empty `Map`, because `Map` is the more common case. To create an empty `Set`, state the type in front: `<String>{}`. Miss this and you'll get a confusing error the first time you call `.add()` on it:

```
The method 'add' isn't defined for the type 'Map'.
```

---

## Try it yourself #1

Create your own `List` of at least 4 values — any type you like. Then:

1. Print its `.length`
2. Print one item by index
3. Use a `for`-`in` loop to print every item

<details>
<summary><strong>A worked solution</strong></summary>

```dart
List<String> fruits = ['apple', 'banana', 'cherry', 'date'];

print(fruits.length);   // 4
print(fruits[1]);       // banana

for (String fruit in fruits) {
  print(fruit);
}
```

```
4
banana
apple
banana
cherry
date
```

Note that `fruits[1]` is `banana`, not `apple` — index `1` is the *second* item. That's zero-indexing in practice, and it's worth staring at until it stops feeling wrong.
</details>

If your loop printed every item without you writing a separate `print()` for each, you've stopped hand-typing repetition for good.

---

## 3. `Map` — looked up by key

> **`Map`** — a collection of key-value pairs, where each value is looked up by a key you choose.

A `Map` doesn't use numbered positions at all.

```dart
Map<String, int> gradeCounts = {'A': 1, 'B': 2, 'C': 1, 'F': 1};

print(gradeCounts['B']);   // 2
```

**The analogy:** if a `List` is a numbered coat check, a `Map` is a labelled filing cabinet. You don't ask for "drawer 2" — you ask for the drawer labelled "invoices."

> **Key** — the label you look things up by. **Value** — the data stored under it.

In `{'A': 1}`, the key is `'A'` and the value is `1`. That's why a `Map` needs *two* types in its angle brackets: `Map<String, int>` means "keys are Strings, values are ints."

Square brackets do lookup by key here, not by index. Assigning to a key that doesn't exist yet adds it:

```dart
gradeCounts['D'] = 0;
print(gradeCounts);
```

```
{A: 1, B: 2, C: 1, F: 1, D: 0}
```

### Missing keys return `null`

This is the one genuinely sharp edge on `Map`, and it connects straight back to Session 4.

```dart
Map<String, int> counts = {'A': 1};
print(counts['Z']);   // null
```

No error, no crash — asking for a key that isn't there just gives you `null`. Which means Dart types every `Map` lookup as **nullable**, even when you know the key exists:

```dart
int n = counts['A'];
// error: A value of type 'int?' can't be assigned to a variable of type 'int'.
```

Dart can't prove at compile time that `'A'` is present, so it insists the result might be `null`. The standard fix is the `??` operator: "use this value, or that fallback if it's null."

```dart
int n = counts['A'] ?? 0;   // fine
```

You'll use exactly this pattern in the build below, in the single most useful `Map` idiom there is — counting things:

```dart
gradeCounts[grade] = (gradeCounts[grade] ?? 0) + 1;
```

Read it right to left: *take whatever is stored under this grade — or `0` if this is the first time we've seen it — add one, and store it back.* Without the `?? 0`, the first occurrence of any new grade would try to add `1` to `null` and fail:

```
The operator '+' can't be unconditionally invoked because the receiver can be 'null'.
```

---

## 4. Spread operator — merging collections

> **Spread operator (`...`)** — unpacks every item of one collection into another collection literal.

```dart
List<int> morning = [82, 95];
List<int> afternoon = [61, 74, 88];
List<int> allScores = [...morning, ...afternoon];

print(allScores);
```

```
[82, 95, 61, 74, 88]
```

Three dots in front of a list, inside another list literal, means "pour all of its items in here." Without it, combining two lists means writing a loop by hand.

The key word is **flat**. `[...morning, ...afternoon]` gives you one list of five numbers — not a list containing two lists. Compare:

```dart
[...morning, ...afternoon]   // [82, 95, 61, 74, 88]  — five items
[morning, afternoon]         // [[82, 95], [61, 74, 88]] — two items, each a list
```

You can mix spread with ordinary items freely: `[0, ...morning, 999]` works exactly as it looks.

---

## 5. Collection-if — conditional items

> **Collection-if** — an `if` written directly inside a collection literal, deciding whether a single item is included at all.

```dart
bool includeBonusRound = true;
List<int> finalScores = [82, 95, if (includeBonusRound) 100, 61];
print(finalScores);
```

```
[82, 95, 100, 61]
```

Flip `includeBonusRound` to `false` and run it again:

```
[82, 95, 61]
```

The `100` is simply *not there*. No gap, no `null`, no placeholder — the list is one item shorter. There's no separate `if` block above, and no temporary variable: the condition lives right inside the list, deciding item by item what gets included.

This looks like a small convenience right now. It becomes one of the most-used pieces of syntax in the entire course from Module 2 onward, because Flutter builds screens out of lists of widgets — and "show this button only when the user is logged in" is exactly this.

---

## 6. Build it: the full grade report

Last build before the Quiz Engine. Open `bin/dart_practice.dart` and find the two hardcoded `calculateGrade` calls from Session 7:

```dart
print('Score 82 earns a grade of ${calculateGrade(82)}.');
print('Score 95 earns a grade of ${calculateGrade(95)}.');
```

Delete both. In their place, build a real report:

```dart
// --- Session 8: the full grade report ---
List<int> morningScores = [82, 95, 61];
List<int> afternoonScores = [74, 88];
bool includeBonusRound = true;

List<int> allScores = [
  ...morningScores,
  ...afternoonScores,
  if (includeBonusRound) 100,
];

Set<String> gradesSeen = <String>{};
Map<String, int> gradeCounts = {};

print('--- Grade Report ---');
for (int score in allScores) {
  String grade = calculateGrade(score);
  print('Score $score: $grade');

  gradesSeen.add(grade);
  gradeCounts[grade] = (gradeCounts[grade] ?? 0) + 1;
}

print('Unique grades this round: $gradesSeen');
print('Grade counts: $gradeCounts');
```

Run it:

```
dart run
```

```
--- Grade Report ---
Score 82: B
Score 95: A
Score 61: F
Score 74: C
Score 88: B
Score 100: A
Unique grades this round: {B, A, F, C}
Grade counts: {B: 2, A: 2, F: 1, C: 1}
```

Every tool from Sessions 4 through 8 is in those twenty lines, working together:

| Line | What it uses | From |
|---|---|---|
| `bool includeBonusRound = true;` | Typed variables | Session 4 |
| `(gradeCounts[grade] ?? 0) + 1` | Operators, null handling | Sessions 4–5 |
| `'Score $score: $grade'` | String interpolation | Session 5 |
| `for (int score in allScores)` | Loops | Sessions 6, 8 |
| `calculateGrade(score)` | Your own function | Session 7 |
| `List`, `Set`, `Map`, `...`, collection-if | Collections | Session 8 |

Notice the two summary lines at the end came for free. `gradesSeen` answers "which grades appeared?" and `gradeCounts` answers "how many of each?" — and neither needed a second pass over the data. One loop filled all three outputs.

Also notice what `{B, A, F, C}` tells you: **B** was first because 82 was graded first. Insertion order, not alphabetical.

---

## Break it on purpose

Add one line, right after the report:

```dart
print(allScores[10]);
```

```
dart run
```

```
Unhandled exception:
RangeError (length): Invalid value: Not in inclusive range 0..5: 10
#0      List.[] (dart:core-patch/growable_array.dart)
#1      main (file:///.../bin/dart_practice.dart:87:22)
```

Read it carefully, because it tells you everything. `allScores` has 6 items, so valid indexes are **0 through 5**. We asked for index 10. Dart didn't guess, didn't return something empty, didn't quietly carry on — it stopped and named the exact valid range.

Now delete the line and confirm you're clean again.

### Why this one matters

That error has a name — an **off-by-one error** — and it is, across every programming language and every level of experience, one of the single most common bugs there is. Professional developers hit it regularly. It is a rite of passage, not a sign you're bad at this. It's a sign you're actually using lists.

It's also a different *kind* of error from most of what you've seen so far. Sessions 4, 5 and 7 all failed at compile time — Dart refused to run the program at all. This one compiled perfectly. `allScores[10]` is valid Dart; whether index 10 exists isn't knowable until the program is actually running with real data. Notice the words **`Unhandled exception`** at the top, and that some of your report printed before it crashed.

> **Runtime error** — a failure that only appears while the program is running, because it depends on actual values rather than on the shape of the code.

### The habit

Before indexing into a list, know its `.length` — and remember the last valid index is always `length - 1`.

Better still: when you want every item, use `for`-`in` and don't write an index at all. You cannot run off the end of a list you never index into.

---

## Try it yourself #2

Create a `Map<String, int>` of your own with three or four key-value pairs, and a `List` of a couple more values. Use the spread operator once to combine something, and print the result.

<details>
<summary><strong>A worked solution</strong></summary>

```dart
Map<String, int> inventory = {'apples': 5, 'bananas': 3};
List<String> newItems = ['cherries', 'dates'];

List<String> allItems = [...inventory.keys, ...newItems];
print(allItems);
```

```
[apples, bananas, cherries, dates]
```

`inventory.keys` gives you just the keys of the map — `apples` and `bananas` — and spread pours them into the new list alongside the new items. There's a matching `.values` if you want the numbers instead.
</details>

---

## Three things to remember

1. **`List` is ordered and indexed from 0.** The last valid index is always `length - 1`.
2. **`Set` keeps only unique values** — in insertion order, not sorted.
3. **`Map` looks values up by key**, and a missing key returns `null`, so reach for `?? fallback`.

---

## Cheat sheet

**List — ordered, indexed:**

```dart
List<String> names = ['Ava', 'Liam', 'Noor'];

names[0];              // 'Ava' — index starts at 0
names.length;          // 3
names.add('Kai');      // append to the end
names.remove('Liam');  // delete the first match

for (String name in names) {
  print(name);
}
```

**Set — unique values only:**

```dart
Set<String> grades = {'B', 'A', 'F', 'B'};   // the second 'B' is dropped
Set<String> empty = <String>{};              // plain {} makes a Map!

grades.contains('A');   // true
grades.add('C');
```

**Map — key-value pairs:**

```dart
Map<String, int> counts = {'A': 1, 'B': 2};

counts['B'];        // 2
counts['C'] = 1;    // assigning to a new key adds it
counts['Z'];        // null — the key isn't there

counts['B'] = (counts['B'] ?? 0) + 1;   // the safe counting pattern

counts.keys;        // all the keys
counts.values;      // all the values
```

**Spread operator — merge into one flat collection:**

```dart
List<int> all = [...listA, ...listB];
```

**Collection-if — include an item only when a condition holds:**

```dart
List<int> scores = [82, 95, if (includeBonus) 100, 61];
```

---

## When it goes wrong

| What you'll see | What it actually means | The fix |
|---|---|---|
| `RangeError (length): Invalid value: Not in inclusive range 0..5: 10` | You asked for an index the list doesn't have | Check `.length` first. The last valid index is `length - 1`, not `length` |
| `The argument type 'String' can't be assigned to the parameter type 'int'.` on `.add()` | You tried to add the wrong type to a typed collection — a String into a `List<int>` | Add a value matching the type in the angle brackets, or change the collection's declared type |
| `The method 'add' isn't defined for the type 'Map'.` | You wrote `{}` meaning an empty `Set`, but plain `{}` creates an empty `Map` | Write `<String>{}` (or whatever type you need) to get an actual Set |
| `A value of type 'int?' can't be assigned to a variable of type 'int'.` | A `Map` lookup is always nullable, because Dart can't prove the key exists | Add a fallback: `counts['A'] ?? 0` |
| `The operator '+' can't be unconditionally invoked because the receiver can be 'null'.` | You did maths directly on a `Map` lookup that might be `null` | Wrap it: `(counts[key] ?? 0) + 1` |
| `null` printed where you expected a number | The key genuinely isn't in the Map | Check your spelling and capitalisation — `'A'` and `'a'` are different keys — or supply a default with `??` |
| A `Set` prints in an order you didn't expect | Sets preserve *insertion* order, not alphabetical or numeric order | That's normal. Sort it yourself if you need a specific order |
| You added a duplicate to a `Set` and nothing happened | That's the whole point of a `Set` — duplicates are silently dropped | Use a `List` if you need to keep repeats |

---

## Homework

**Estimated time: 25 minutes.**

Expand your grade report:

1. Add at least **two more scores** — directly in a list, via a new list combined with spread, or via collection-if, your choice.
2. Add one more **`Map`** tracking something new about the data. A map of grade to a description (`'A': 'Excellent'`), or a running total, or anything you like.

**You're done when:**

- [ ] `allScores` has at least two more scores than it did, and the report prints a line for each
- [ ] A new `Map` exists, holds at least two entries, and gets printed
- [ ] `dart run` completes with no red error text
- [ ] Everything from previous sessions is still in the file and still working

**Why this matters:** Session 9 is the Quiz Engine, and a `List` of questions is its entire backbone. Every bit of building-and-looping-over-collections you practise today is exactly what that mini-app runs on.

### Stretch goal

Add a `Map<String, List<int>>` — a map where each key is a student's name and each value is a `List` of that student's scores across several rounds.

```dart
Map<String, List<int>> rounds = {
  'Ava': [82, 91, 78],
  'Liam': [65, 70, 88],
};
```

Loop over the map's keys, and for each one, print the student's name alongside their average score — the sum of their list divided by its length.

You'll need a loop inside a loop to total each list up. That's every single tool from Module 1 in one exercise, and it's a fair preview of how real data actually looks: collections inside collections.

---

## Check yourself

1. **What is the index of the first item in a Dart `List`?**
   a) 1
   b) 0
   c) -1
   d) It depends on the list

2. **What happens when you add a duplicate value to a `Set`?**
   a) It's added anyway, appearing twice
   b) It causes an error
   c) It's silently ignored — the Set keeps only unique values
   d) It replaces the first occurrence

3. **How do you look up a value in a `Map` by its key `'B'`?**
   a) `map[0]`
   b) `map['B']`
   c) `map.get('B')`
   d) `map->'B'`

4. **What does `[...listA, ...listB]` produce?**
   a) A list containing `listA` and `listB` as two nested lists
   b) An error
   c) A single flat list containing all the items from both
   d) Only the items that appear in both lists

5. **What does `[82, 95, if (includeBonus) 100, 61]` produce when `includeBonus` is `false`?**
   a) An error
   b) `[82, 95, 100, 61]` — it's included anyway
   c) `[82, 95, 61]` — the 100 simply isn't there
   d) `[82, 95, null, 61]`

<details>
<summary><strong>Answers</strong></summary>

1. **b** — Dart lists are zero-indexed. The first item is always at index 0, and the last is at `length - 1`.
2. **c** — A `Set` keeps only unique values, dropping duplicates silently with no error.
3. **b** — Square brackets with the key: `map['B']`. For a `Map` those brackets mean "look up by key," not "by position."
4. **c** — Spread unpacks every item into one flat list. `[listA, listB]` without the dots is what gives you a nested list.
5. **c** — Collection-if includes the item only when its condition is true. When false, the item is simply absent — no gap, no `null` placeholder.
</details>

---

## New words from this session

`collection` · `List` · `index` · `zero-indexed` · `for`-`in` loop · `Set` · `uniqueness` · `Map` · `key` / `value` · `spread operator (...)` · `collection-if` · `runtime error` · `off-by-one error`

All of them, plus every term from every other session, live in the [course glossary](../../glossary.md).

---

## Next up

**Session 9 — OOP: Classes, Constructors, Inheritance — Mini-app: Quiz Engine**

This is the finish line for Module 1.

Next session you build the **Quiz Engine** — a real, working mini-app, made with your own hands, using every single thing from Sessions 4 through 8. Variables to hold the data. Operators to compare answers. Control flow to decide right from wrong. Functions to package the logic. And collections — today's work — to hold the questions.

The missing piece is a way to describe a *thing*. A question isn't one value: it's the question text, plus several possible answers, plus which one is correct, all bundled together as one unit. Sessions 4 through 8 gave you no way to say that.

Classes do. That's Session 9, and then you'll have built something real.

---

[← Session 7](../07-functions-parameters-arrow-syntax/) · [Course home](../../README.md) · [Glossary](../../glossary.md) · [Session 9 →](../09-oop-quiz-engine/)
