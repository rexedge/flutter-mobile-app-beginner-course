# Solutions 04 — Variables, Types, Null Safety

[← Back to the exercises](../04-variables-types-null-safety.md) · [Workbook guide](../README.md)

> Every output below is real. To run all of these solutions at once: [`code/session_04.dart`](code/session_04.dart).
>
> Where VS Code and the terminal word an error differently, both are shown.

---

## 4.1 ★ Your favourite film

```dart
void main() {
  String title = 'The Lion King';
  int releaseYear = 1994;
  double rating = 8.5;
  bool seenMoreThanOnce = true;

  print(title);
  print(releaseYear);
  print(rating);
  print(seenMoreThanOnce);
}
```

```
The Lion King
1994
8.5
true
```

Your film and values will differ. Check the **types**: the year is a whole number (`int`), the rating can have a decimal point (`double`), and "seen more than once" is yes-or-no (`bool`).

---

## 4.2 ★ Pick the type

| | Value | Type | |
|---|---|---|---|
| 1 | `'Lagos'` | `String` | |
| 2 | `42` | `int` | |
| 3 | `3.14` | `double` | |
| 4 | `false` | `bool` | |
| 5 | `'42'` | `String` | **trap** — the quotes make it text |
| 6 | `42.0` | `double` | **trap** — the decimal point makes it a double, even though it's a whole number |
| 7 | `'false'` | `String` | **trap** — in quotes, it's just a word |
| 8 | `-7` | `int` | negative whole numbers are still `int` |
| 9 | `0.5` | `double` | |
| 10 | `''` | `String` | an empty string is still a `String` — see 4.15 |

**The rule:** quotes always mean `String`, no matter what's inside them. A decimal point always means `double`.

---

## 4.3 ★ Predict the output

```
Abuja
3800000
30.0
2.5
true
```

**The surprises:**

- `30.0` prints as `30.0`, not `30`. A `double` always shows its decimal point, even when the number is whole.
- `2.50` prints as `2.5`. Dart doesn't keep trailing zeros — `2.50` and `2.5` are the same number, so it prints the shortest form.
- `3800000` prints with no commas. Commas are for humans; Dart just prints the digits.

---

## 4.4 ★ From var to explicit

```dart
void main() {
  String greeting = 'Hello';
  int daysInWeek = 7;
  double shoeSize = 7.5;
  bool isRaining = false;
}
```

`var` looked at each value and worked out the type for you. Writing it yourself says the same thing out loud — which is why the chapter recommends it while you're learning.

---

## 4.5 ★★ Error or fine?

| | Line | Result | Prints |
|---|---|---|---|
| a | `int count = 5.0;` | **Refused** | — |
| b | `double price = 5;` | **Fine** | `5.0` |
| c | `String code = 404;` | **Refused** | — |
| d | `bool isOpen = 'true';` | **Refused** | — |
| e | `String? note = null;` | **Fine** | `null` |
| f | `int? level = null;` | **Fine** | `null` |
| g | `double? weight = 72;` | **Fine** | `72.0` |
| h | `bool done = null;` | **Refused** | — |

The errors for the refused ones:

```
a:  A value of type 'double' can't be assigned to a variable of type 'int'.
c:  A value of type 'int' can't be assigned to a variable of type 'String'.
d:  A value of type 'String' can't be assigned to a variable of type 'bool'.
h:  A value of type 'Null' can't be assigned to a variable of type 'bool'.
```

**The surprise is (b) — and (g).** Dart lets you put a whole number into a `double`, and quietly stores it as `5.0`. It works that way because nothing is lost: every whole number is also a valid decimal number.

It does **not** work the other way round. That's (a): `5.0` into an `int` is refused, because an `int` has no room for a decimal part. Dart won't throw information away without you asking it to.

---

## 4.6 ★★ Fix it: age

```
A value of type 'String' can't be assigned to a variable of type 'int'.
```

`'25'` is in quotes, so it's **text** that happens to contain digits — a `String`. An `int` can only hold an actual number.

```dart
void main() {
  int age = 25;
  print(age);
}
```

```
25
```

Take the quotes off. Now it's the number twenty-five, not the characters "2" and "5".

---

## 4.7 ★★ Fix it, two different ways

```
A value of type 'Null' can't be assigned to a variable of type 'String'.
```

`String` with no `?` promises it will always hold real text. `null` breaks that promise.

**Fix 1 — give it a real value:**

```dart
String nickname = 'Ace';
```

Choose this when **everyone genuinely has one** — when "no value" would be a mistake.

**Fix 2 — allow it to be empty:**

```dart
String? nickname = null;
```

Choose this when **"no nickname" is a perfectly normal answer.** Plenty of people don't have one.

The two fixes mean completely different things. The first says *there is always a nickname*. The second says *there might not be one, and that's fine*. Picking between them is a decision about the real world, not about Dart.

---

## 4.8 ★★ Fix it: the type that got locked

```
A value of type 'String' can't be assigned to a variable of type 'int'.
```

**`var` doesn't mean "any type, forever."** It means *"Dart, work out the type from the first value."* The first value was `10`, so `score` became an `int` on that first line — permanently. After that, it can hold any whole number, but never text.

The fix is to keep it an `int`:

```dart
void main() {
  var score = 10;
  score = 20;
  print(score);
}
```

```
20
```

If you genuinely needed the word `'ten'`, you'd want a separate `String` variable.

---

## 4.9 ★★ Fix it: almost the same name

```
Undefined name 'firstname'.
```

**Dart names are case-sensitive.** `firstName` and `firstname` are two completely different names to Dart — as different as `cat` and `dog`. The variable you declared is `firstName`, with a capital N; the one you asked for doesn't exist.

```dart
void main() {
  String firstName = 'Ada';
  print(firstName);
}
```

```
Ada
```

VS Code's suggestions help avoid this. Start typing `firstN...` and pick the name from the list instead of typing it all.

---

## 4.10 ★★ Things change

```
3
Hello
```

**Two lines.** `print` only runs twice, and each time it prints what the variable holds *at that moment*.

`level` held 1, then 2, then 3 — and each new value replaced the old one. By the time `print(level)` runs, only 3 is left. Same for `greeting`: `'Hi'` was replaced by `'Hello'` before it was ever printed.

That's what makes a variable a *variable*: the box stays the same, but what's inside can be swapped out.

---

## 4.11 ★★ Nullable or not?

| | Field | Choice | Reason |
|---|---|---|---|
| 1 | First name | `String` | Everyone has one; the form shouldn't work without it |
| 2 | Surname | `String` | Same — though see the note below |
| 3 | Middle name | `String?` | Many people don't have one |
| 4 | Phone number | `String?` | Not everyone wants to share it — **and** it's a `String`, not an `int` |
| 5 | Email | `String` or `String?` | Depends on your app: required for sign-up, optional for a contact list |
| 6 | Nickname | `String?` | Most people won't have one |
| 7 | Age | `int` or `int?` | `int?` if people may skip it |
| 8 | Company | `String?` | Students, retired people and freelancers may not have one |

**Two things worth noticing:**

- **Phone numbers are `String`, not `int`.** They can start with `0` or `+`, you never do maths on them, and an `int` would throw away a leading zero. A good rule: if you wouldn't add it up, it probably isn't a number.
- **Real forms are messier than they look.** Some people have only one name and no surname at all. The honest answer to "is this nullable?" is always *"what's true about the real people using this?"* That's why this was a judgement call.

---

## 4.12 ★★ A variable with nothing in it

**It runs**, and prints:

```
null
null
```

A **nullable** variable declared with no value automatically starts as `null`. There's nothing unsafe about that — the `?` already said "this might be empty."

**Without the `?`**, it's refused:

| Where | Message |
|---|---|
| VS Code | `The non-nullable local variable 'highScore' must be assigned before it can be used.` |
| Terminal | `Non-nullable variable 'highScore' must be assigned before it can be used.` |

`int highScore;` promises it will always hold a real number, but you never gave it one. Dart spots that you're about to print a value that doesn't exist yet, and stops you.

---

## 4.13 ★★★ Four bugs

| Line | Bug | Why | Fix |
|---|---|---|---|
| 2 | Missing `;` | Every statement must end with a semicolon | `String name = 'Tunde';` |
| 3 | `29.5` in an `int` | An `int` can't hold a decimal | `int age = 29;` — or make it a `double` |
| 4 | `'yes'` in a `bool` | A `bool` is only ever `true` or `false` | `bool isStudent = true;` |
| 6 | `Name` doesn't exist | Case-sensitive — the variable is `name` | `print(name);` |

The fixed program:

```dart
void main() {
  String name = 'Tunde';
  int age = 29;
  bool isStudent = true;
  String? email;
  print(name);
  print(age);
  print(isStudent);
  print(email);
}
```

```
Tunde
29
true
null
```

**The order of the errors.** Here's what each one reported:

| Line | VS Code | Terminal |
|---|---|---|
| 2 | `Expected to find ';'.` | `Expected ';' after this.` |
| 3 | `A value of type 'double' can't be assigned to a variable of type 'int'.` | *(same)* |
| 4 | `A value of type 'String' can't be assigned to a variable of type 'bool'.` | *(same)* |
| 6 | `Undefined name 'Name'.` | *(same)* |

VS Code lists them in line order. **The terminal doesn't** — `dart run` reported line 2, then **line 6**, then lines 3 and 4. It checks your code in more than one pass, and reports each pass's problems as it finds them.

**The lesson:** never assume the error at the top of the terminal is the first one in your file. Read the line number in each message, and work through them top to bottom.

---

## 4.14 ★★★ Pet profile

```dart
void main() {
  String petName = 'Biscuit';
  String species = 'Dog';
  int ageYears = 3;
  double weightKg = 12.4;
  bool isVaccinated = true;
  int vetVisitsThisYear = 2;
  String? microchipId = null;
  String? favouriteToy = 'Rope';

  print(petName);
  print(species);
  print(ageYears);
  print(weightKg);
  print(isVaccinated);
  print(vetVisitsThisYear);
  print(microchipId);
  print(favouriteToy);

  // A year later
  ageYears = 4;
  microchipId = 'MC-58213';

  print(ageYears);
  print(microchipId);
}
```

```
Biscuit
Dog
3
12.4
true
2
null
Rope
4
MC-58213
```

**The two nullable ones are the point of this exercise:**

- `microchipId` is `String?` **and** starts as `null` — it doesn't have one yet, but it will.
- `favouriteToy` is `String?` but **has** a value. Nullable doesn't mean "is null." It means "is *allowed* to be null." This pet has a toy; the next pet might not.

Notice that `microchipId` went from `null` to real text without any complaint. A `String?` can switch freely between the two.

---

## 4.15 ★★★ Zero, empty, or nothing?

- **`0`** is a real number. It means "I counted, and there are none."
- **`''`** is real text with no characters in it. It means "there is a message, and it's blank."
- **`null`** means **there is no value at all** — nobody has answered, measured, or decided yet.

**Real examples:**

- **`0` is right** for items in a shopping cart. An empty cart has exactly zero items. Using `null` would suggest you don't even know how many are in it.
- **`''` is right** for a text box the user has cleared. The box exists; it's just blank.
- **`null` is right** for a reply to a message that hasn't been answered yet. It isn't an empty reply — there *is* no reply.

The difference matters most with numbers. A test score of `0` means someone took the test and got nothing right. A test score of `null` means they haven't taken it. Treat those as the same, and someone gets marked as failing a test they never sat.

---

## 4.16 ★★★ Why null safety?

**One example answer:**

> Missing values — `null` — used to be one of the most common reasons apps crashed, in almost every programming language. The bug usually hid until the app was on someone's phone and hit a value that wasn't there. Null safety makes you decide up front, for every variable, whether it's allowed to be empty, and then Dart checks every use of it while you're still writing the code. It's a little extra typing, in exchange for a whole category of crash that simply can't reach your users.

The key word is **when**: Dart catches it at **compile time** — before the program runs — instead of it becoming a crash on a real device.
