# Dart Basics: Sessions 4-6 Assessment

This coursework tests your understanding of the core Dart concepts covered in Sessions 4, 5, and 6. 
You can complete these exercises in a single plain Dart project (using `dart create`).

## Part 1: Knowledge Check

Answer the following questions briefly:
1. **Null Safety:** What is the difference between `String` and `String?`? What problem does Dart's null safety feature solve?
2. **Immutability:** Explain the difference between `final` and `const`. Can a `const` variable depend on a value that is calculated while the program runs?
3. **Control Flow:** When should you use a `switch` statement instead of an `if`/`else if`/`else` chain?
4. **Loops:** What are the three parts of a `for` loop declaration? (e.g., `for (part1; part2; part3)`)

## Part 2: Practical Coding Challenge

Create a new plain Dart project using `dart create session_test`. Open `bin/session_test.dart` and delete the starter code. Write a single program that meets all the following requirements.

### Step 1: Variables & Types (Session 4)
Declare the following variables describing a fictional coffee shop order:
- A `String` for the customer's name.
- An `int` for the number of coffees ordered.
- A `double` for the price per coffee.
- A `bool` indicating whether the order is for here or to go.
- A `String?` (nullable) for any special instructions (e.g., "extra sugar"), which should be set to `null` initially.

### Step 2: Operators & Immutability (Session 5)
- Calculate the total cost of the order using the appropriate arithmetic operator. Store this result in a `final` variable.
- Create a `const` variable for the shop's tax rate (e.g., 0.05 for 5%).
- Calculate the final price including tax and store it in another `final` variable. 
- Use **String Interpolation** to print a receipt sentence, for example: *"Alice ordered 3 coffees. Total with tax: $14.17."*

### Step 3: Control Flow - Branching (Session 6)
- Write an `if`/`else` statement checking the `String?` special instructions variable. If it has a value, print the instructions. If it is `null`, print "No special instructions."
- Write a `switch` statement based on the number of coffees ordered. If 1, print "Single order". If 2, print "Double order". For any other number, print "Large order".

### Step 4: Control Flow - Looping (Session 6)
- Write a `for` loop that acts as a timer for preparing the coffees. If the order is 3 coffees, the loop should count from 1 to 3, printing "Preparing coffee 1...", "Preparing coffee 2...", etc.
- Write a `while` loop that counts down from 5 to 1, printing each number, followed by a final print statement outside the loop: "Order ready!".

## Part 3: Debugging 

Find the bug in the following snippet of code and explain how to fix it:

```dart
int countdown = 3;
while (countdown > 0) {
  print('Counting down: $countdown');
}
print('Go!');
```

---

<details>
<summary><strong>Instructor Answer Key (No Peeking!)</strong></summary>

**Part 1 Answers:**
1. `String` must always contain text; `String?` can contain text OR be completely empty (`null`). Null safety forces developers to handle "no value" cases before the code runs, preventing unexpected crashes.
2. `final` means a variable is set once and locked, but its value can be calculated when the program runs. `const` means the value must be fixed and known before the program even starts compiling. No, `const` cannot depend on runtime calculations.
3. Use `switch` when checking a single value against exact specific matches (like a menu choice or day of the week). Use `if/else` for ranges, combined conditions, or complex logic.
4. Start (runs once), check/condition (checked before every repeat), update (runs after every repeat).

**Part 3 Answer:**
The code has an **infinite loop**. The `countdown` variable is never updated inside the loop, so `countdown > 0` will always be true. Fix it by adding `countdown--;` inside the `while` block.
</details>
