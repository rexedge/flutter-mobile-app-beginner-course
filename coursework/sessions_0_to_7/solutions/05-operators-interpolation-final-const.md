# Solutions 05 — Operators, Interpolation, final vs const

[← Back to the exercises](../05-operators-interpolation-final-const.md) · [Workbook guide](../README.md)

> Every output below is real. To run all of these solutions at once: [`code/session_05.dart`](code/session_05.dart).
>
> Where VS Code and the terminal word an error differently, both are shown.

---

## 5.1 ★ The six operators

```
22
12
85
3.4
3
2
```

- `17 / 5` is **`3.4`** — ordinary division, always a `double`.
- `17 ~/ 5` is **`3`** — divide and throw away everything after the point.
- `17 % 5` is **`2`** — what's left over. Five goes into seventeen three times (fifteen), with two left over.

`~/` and `%` are a pair: together they're "how many times does it fit, and what's left?"

---

## 5.2 ★ Division always has a point

```
2.0
2
3.0
```

**`/` always gives back a `double`**, even when the answer happens to be whole. Dart decides the *type* of the result from the operator, not from the particular numbers — and since `/` *might* produce a fraction, its answer is always a `double`, just in case.

If you want a whole number back, use `~/`.

---

## 5.3 ★ Yes-or-no questions

```
false
true
true
false
true
false
```

The last two are the ones to check: `x >= 12` is `true` because 12 **equals** 12, and "greater than *or equal*" includes equal. `y <= 19` is `false` because 20 is neither less than 19 nor equal to it.

---

## 5.4 ★ Fix it: the name that didn't appear

It prints, literally:

```
Welcome, name!
```

Without a `$`, `name` is just four letters inside a string. Dart has no reason to treat it as a variable.

```dart
void main() {
  String name = 'Chidi';
  print('Welcome, $name!');
}
```

```
Welcome, Chidi!
```

This one never gives an error — which makes it easy to miss. Always read your output, not just check that it ran.

---

## 5.5 ★ One sentence, three variables

```dart
void main() {
  String dish = 'Jollof rice';
  int portions = 3;
  double pricePerPortion = 2.5;
  print('$portions portions of $dish cost ${portions * pricePerPortion}.');
}
```

```
3 portions of Jollof rice cost 7.5.
```

A plain variable only needs `$`. Anything that has to be **worked out** — here, a multiplication — needs `${...}`.

---

## 5.6 ★★ Which goes first?

```
14
20
17.0
7.0
```

**Multiplication and division happen before addition and subtraction** — the same order you learned in maths (BODMAS, or PEMDAS). So `2 + 3 * 4` is `2 + 12`, not `5 * 4`. Brackets override the order, which is why `(2 + 3) * 4` is 20.

The last two are `double`s because each one contains a `/`.

**When in doubt, add brackets.** They cost nothing, and they make your intention obvious to the next person who reads it — including you, next month.

---

## 5.7 ★★ Interpolation traps

```
4 + 6 = 10
4 + 6 = 4 + 6
40
```

The first line uses `${a + b}` — so Dart **works out** `a + b` and puts in the answer, `10`.

The second line uses `$a + $b` after the equals sign. That's two separate variables with an ordinary `+` character between them. Dart fills in each variable, but the `+` is just text, the same as the `=`. Nothing gets added up.

The third, `${a}0`, uses curly braces to show exactly where the variable name ends. It's `a`, followed by the character `0` — so `40`.

---

## 5.8 ★★ Fix it: where does the name end?

```
Undefined name 'hourshrs'.
```

With just a `$`, Dart reads the longest name it can — every letter up to a space or symbol. It reads `$hourshrs` as one variable called `hourshrs`, which doesn't exist.

Curly braces mark where the name stops:

```dart
void main() {
  int hours = 3;
  print('Meeting in ${hours}hrs');
}
```

```
Meeting in 3hrs
```

This is the same trick as the third line of 5.7.

---

## 5.9 ★★ Minutes to hours

```dart
void main() {
  int totalMinutes = 135;
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;
  print('$totalMinutes minutes is $hours hours and $minutes minutes.');
}
```

```
135 minutes is 2 hours and 15 minutes.
```

With `200`:

```
200 minutes is 3 hours and 20 minutes.
```

`~/ 60` counts the whole hours. `% 60` is the minutes left over. This pair — whole units and remainder — is the pattern behind every time, money and measurement conversion you'll ever write.

---

## 5.10 ★★ Even or odd?

```dart
void main() {
  int n = 17;
  bool isEven = n % 2 == 0;
  print('$n is even: $isEven');
}
```

```
17 is even: false
```

With `n = 42`, it prints `42 is even: true`.

**`%` makes it possible.** An even number divides by 2 with nothing left over, so `n % 2` is `0`. An odd number always leaves `1`. Then `== 0` turns that into a yes-or-no answer.

---

## 5.11 ★★ Truth tables

| | Expression | Result |
|---|---|---|
| 1 | `true && true` | `true` |
| 2 | `true && false` | `false` |
| 3 | `false && true` | `false` |
| 4 | `false && false` | `false` |
| 5 | `true \|\| true` | `true` |
| 6 | `true \|\| false` | `true` |
| 7 | `false \|\| true` | `true` |
| 8 | `false \|\| false` | `false` |
| 9 | `!true` | `false` |
| 10 | `!false` | `true` |

- **`&&` is true only when *both* sides are true.** One `false` anywhere, and the whole thing is `false`.
- **`||` is true when *at least one* side is true.** It's only `false` when both sides are.

---

## 5.12 ★★ Can they come in?

```dart
void main() {
  int age = 15;
  bool withAdult = true;
  bool hasTicket = true;
  bool canEnter = (age >= 18 || withAdult) && hasTicket;
  print('Can enter: $canEnter');
}
```

```
Can enter: true
```

Without an adult, it becomes `Can enter: false`. Working it through: `age >= 18` is `false` and `withAdult` is now `false`, so the bracket is `false || false`, which is `false`. And `false && hasTicket` is `false`, whatever the ticket says.

**The brackets matter.** Without them, `age >= 18 || withAdult && hasTicket` means something different — Dart does `&&` before `||`, just as it does `*` before `+`. Brackets make sure the "age or adult" part is decided first.

---

## 5.13 ★★ Fix it: the value that was locked

| Where | Message |
|---|---|
| VS Code | `The final variable 'year' can only be set once.` |
| Terminal | `Can't assign to the final variable 'year'.` |

`final` means *set once, then locked*. The second line tries to change it.

If the year genuinely needs to change, use `var` (or `int`):

```dart
void main() {
  var year = 2026;
  year = 2027;
  print(year);
}
```

```
2027
```

**But ask first whether it *should* change.** If `year` were someone's birth year, changing it would almost certainly be a bug — and `final` just caught that bug for you. Sometimes the right fix is to delete the second line, not to remove the `final`.

---

## 5.14 ★★ Fix it: const too early

| Where | Message |
|---|---|
| VS Code | `Const variables must be initialized with a constant value.` |
| Terminal | `Not a constant expression.` |

`const` means **known before the program even runs**. But `base` is an ordinary variable — Dart only knows its value once the program is running. So `base * 2` can't be `const`.

The one-word fix is **`final`**:

```dart
void main() {
  int base = 10;
  final doubled = base * 2;
  print(doubled);
}
```

```
20
```

`final` is also locked after it's set — it just doesn't need to know the value in advance.

---

## 5.15 ★★ const from const

**Yes, it runs**, and prints:

```
20
```

`a` is a `const`, so Dart knows it's 10 before the program runs. That means it also knows `a * 2` is 20 before the program runs — so `b` can be `const` too.

**The difference from 5.14:** there, `base` was an ordinary variable, and ordinary variables only get their values while the program runs. A `const` can be built out of other `const`s and plain numbers, but nothing else.

The same rule refuses this:

```dart
final c = 10;
const d = c * 2;   // refused — c is final, not const
```

`final` values are locked, but still only decided at run time. `const` has to be known before that.

---

## 5.16 ★★ var, final or const?

| | Value | Keyword | Reason |
|---|---|---|---|
| 1 | Pi | `const` | A fixed fact, the same forever |
| 2 | Days in a week | `const` | Never changes, known in advance |
| 3 | Player's score | `var` | Changes all the time during a game |
| 4 | Birth year from typed-in age | `final` | Fixed once worked out — but it depends on what the user typed, so it can't be known in advance |
| 5 | The app's name | `const` | Never changes, known when you write the code |
| 6 | Username chosen at sign-up | `final` | Locked once chosen, but it depends on the user |
| 7 | Current temperature | `var` | Updates every minute |

**The quick test:**

- Will it ever change? → `var`
- Fixed, but you won't know it until the program runs? → `final`
- Fixed, and you know it right now while writing the code? → `const`

---

## 5.17 ★★★ Seconds to h, m, s

```dart
void main() {
  int totalSeconds = 3725;
  int hours = totalSeconds ~/ 3600;
  int minutes = (totalSeconds % 3600) ~/ 60;
  int seconds = totalSeconds % 60;
  print('$totalSeconds seconds is ${hours}h ${minutes}m ${seconds}s.');
}
```

```
3725 seconds is 1h 2m 5s.
```

With the other test values:

```
7384 seconds is 2h 3m 4s.
59 seconds is 0h 0m 59s.
```

**How it works:**

1. `3725 ~/ 3600` — how many whole hours? **1**.
2. `3725 % 3600` — what's left after the hours? 125 seconds. Then `125 ~/ 60` — how many whole minutes in that? **2**.
3. `3725 % 60` — what's left after taking out every whole minute? **5**.

**Two details:**

- The brackets in `(totalSeconds % 3600) ~/ 60` aren't strictly needed — `%` and `~/` are worked out left to right anyway — but they make the intention obvious.
- `${hours}h` needs curly braces, for the same reason as 5.8. Without them, Dart would look for a variable called `hoursh`.

---

## 5.18 ★★★ Temperature converter

```dart
void main() {
  double celsius = 36.6;
  final fahrenheit = celsius * 9 / 5 + 32;
  final kelvin = celsius + 273.15;

  print(fahrenheit);
  print('$celsius C is ${fahrenheit.toStringAsFixed(1)} F');
  print('$celsius C is ${kelvin.toStringAsFixed(1)} K');
}
```

```
97.88000000000001
36.6 C is 97.9 F
36.6 C is 309.8 K
```

**What you noticed:** the raw result is `97.88000000000001`, not `97.88`. That isn't a bug in your code.

Computers store decimal numbers in binary, and some decimals — like 36.6 — can't be stored *exactly*, in the same way that one third can't be written exactly as 0.333... A tiny error creeps in, and sometimes it shows up in the last digit.

**This is exactly why `.toStringAsFixed()` exists.** Round to the number of decimal places a human actually needs, and the noise disappears. Whenever you show a `double` to a person, round it.

---

## 5.19 ★★★ Split the bill

```dart
void main() {
  const tipRate = 0.1;
  double subtotal = 18500.0;
  int people = 4;

  final tip = subtotal * tipRate;
  final total = subtotal + tip;
  final perPerson = total / people;

  print('Subtotal:   ${subtotal.toStringAsFixed(2)}');
  print('Tip (10%):  ${tip.toStringAsFixed(2)}');
  print('Total:      ${total.toStringAsFixed(2)}');
  print('Each of $people pays ${perPerson.toStringAsFixed(2)}');
}
```

```
Subtotal:   18500.00
Tip (10%):  1850.00
Total:      20350.00
Each of 4 pays 5087.50
```

**Why each keyword:**

- `tipRate` is `const` — it's decided in advance and never changes.
- `tip`, `total` and `perPerson` are `final` — each is worked out once and should never change afterwards, but each depends on other values.

The extra spaces after `Subtotal:` and friends just line the numbers up. They're inside the quotes, so they're printed exactly as typed.

---

## 5.20 ★★★ Age stats

```dart
void main() {
  const daysPerYear = 365;
  const hoursPerDay = 24;
  int age = 25;

  final days = age * daysPerYear;
  final hours = days * hoursPerDay;
  final isTeenager = age >= 13 && age <= 19;
  final decade = age ~/ 10;

  print('Age: $age');
  print('Roughly $days days, or $hours hours.');
  print('Teenager: $isTeenager');
  print('Full decades lived: $decade');
}
```

```
Age: 25
Roughly 9125 days, or 219000 hours.
Teenager: false
Full decades lived: 2
```

**Checking "teenager" needs two conditions joined with `&&`**: at least 13, *and* at most 19. Using `>=` and `<=` includes both 13 and 19 themselves — "inclusive" in the brief meant exactly that.

`age ~/ 10` gives full decades: 25 has two full tens in it, and the 5 left over is thrown away.
