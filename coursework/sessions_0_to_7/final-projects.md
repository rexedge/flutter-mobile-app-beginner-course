# Final Projects — Sessions 4 to 7

**Covers:** everything from [Session 4](../../sessions/04-variables-types-null-safety/) to [Session 7](../../sessions/07-functions-parameters-arrow-syntax/) · **2 projects** · about 3 hours
**Solutions:** [solutions/final-projects.md](solutions/final-projects.md)

Two complete programs, each using every session from 4 to 7 at once.

- **Project A is guided.** Seven steps, in order, each telling you what to build.
- **Project B is a brief.** You get the rules and some numbers to check against. How you structure it is up to you.

Do A first. Make a separate file for each: `bin/project_a.dart` and `bin/project_b.dart`.

---

## Project A — Savings Goal Planner ★★★

Amaka is saving for a new laptop. She has some money already, puts in the same amount every month, and her savings account adds a little interest each month. **How many months until she can afford it?**

Your program works that out, month by month, and prints the whole plan.

### Step 1 — The data *(Session 4)*

Inside `main()`, declare Amaka's details with the right types:

| Variable | Value |
|---|---|
| `saverName` | `'Amaka'` |
| `goalName` | `'New laptop'` |
| `goalAmount` | `450000.0` |
| `startingBalance` | `20000.0` |
| `monthlyDeposit` | `35000.0` |
| `goalNote` | nothing yet — it might get a note later |

### Step 2 — A constant and a helper *(Sessions 5 and 7)*

**Above** `main()`:

- A `const` called `monthlyInterestRate`, set to `0.01` — one percent a month. (Real accounts pay much less. This is kept simple on purpose.)
- A function `money` that takes a `double` and returns it as a `String` with exactly two decimal places. Use arrow syntax.

### Step 3 — One month of saving *(Sessions 5 and 7)*

Write a function `applyMonth` that takes the current balance and returns the balance one month later. Each month:

1. interest is added — the balance times the rate
2. then the deposit is added

It takes the balance as a normal parameter, the deposit as a **required named** parameter, and the rate as a named parameter that **defaults** to `monthlyInterestRate`.

**Check:** `applyMonth(20000.0, deposit: 35000.0)` must return `55200.0`.

### Step 4 — The plan, month by month *(Sessions 5 and 6)*

In `main()`:

1. Print a header with Amaka's name, her goal, and the goal amount.
2. If `goalNote` is empty, print `No note added.` Otherwise print the note.
3. Print one line saying how much she's starting with, how much she saves each month, and the interest rate as a percentage (`1%`, not `0.01`).
4. Using a loop, keep applying months until the balance reaches the goal. Print a line for every month with its number and balance.

Which kind of loop fits here, and why? You don't know how many months it'll take before you start.

### Step 5 — Progress and milestones *(Sessions 5, 6 and 7)*

Add two more functions:

- `int percentOf(double part, double whole)` — returns what percentage `part` is of `whole`, as a whole number. Use arrow syntax.
- `String milestone(int percent)` — uses a `switch` to return a message. Divide the percentage by 25 with `~/` and switch on the result:

| `percent ~/ 25` | Message |
|---|---|
| `0` | `Just getting started` |
| `1` | `A quarter of the way` |
| `2` | `Halfway there` |
| `3` | `Three quarters done` |
| anything else | `Goal reached!` |

Add the percentage and milestone to every month's line.

### Step 6 — The summary *(Session 5)*

After the loop, print:

- how many months it took
- the final balance
- how much Amaka actually put in — her starting balance plus all her deposits
- how much of the final balance was interest

Use `final` for the values you calculate here.

### Step 7 — What if she saved more, or less? *(Sessions 6 and 7)*

Write a function `monthsToReach` with **named** parameters — `goal`, `start` and `deposit` all required, and `rate` defaulting to `monthlyInterestRate`. It returns how many months it would take. (It will use your `applyMonth`.)

Then, in `main()`, use a `for` loop to try monthly deposits of 25,000, 30,000, 35,000, 40,000 and 45,000, printing how many months each would take.

### Check your numbers

If everything is right, your output ends like this:

```
Reached in 12 months.
Final balance:   466424.11
You put in:      440000.00
Interest earned: 26424.11

What if you saved a different amount each month?
  25000.00 a month: 16 months
  30000.00 a month: 14 months
  35000.00 a month: 12 months
  40000.00 a month: 11 months
  45000.00 a month: 10 months
```

Your month-by-month lines should start with `Month 1: 55200.00 (12%) - Just getting started`.

### You're done when

- [ ] All seven steps are in, with every function above `main()`
- [ ] Your final numbers match the check above exactly
- [ ] Setting `goalNote` to a real note prints it instead of `No note added.`
- [ ] Changing `goalAmount` to `200000.0` gives a shorter plan that still ends with `Goal reached!`

---

## Project B — Electricity Bill Calculator ★★★

This time there are no steps. You get the rules; you design the program.

### The brief

A power company charges for electricity in **tiers** — the more you use, the more each unit costs:

| Units used | Price per unit |
|---|---|
| The first 50 units | 20.00 |
| The next 100 units (51 to 150) | 35.00 |
| Every unit above 150 | 50.00 |

On top of the energy cost, every bill has:

- a fixed **service charge** of 500.00
- **VAT** of 7.5%, charged on the energy cost *plus* the service charge

**Be careful with the tiers.** Someone who uses 130 units does **not** pay 35.00 for all 130. They pay 20.00 for the first 50, and 35.00 for the other 80.

Each customer also gets a **usage band**: `Low` for 50 units or fewer, `Medium` for 51 to 150, `High` above 150.

### Requirements

Your program must:

1. Use a `const` for the service charge, the VAT rate and each tier price
2. Have a function that works out the energy cost for a number of units
3. Have a function that adds VAT, with the rate as a named parameter defaulting to your VAT constant
4. Have a function that returns the usage band
5. Have a `void` function that prints one full bill, with **named** parameters: the customer's name and units both required, and an optional meter note that might not exist
6. Print a full bill for each of these three customers:

| Customer | Units | Meter note |
|---|---|---|
| Mrs Okafor | 42 | *(none)* |
| Bello Stores | 130 | `Estimated reading` |
| Adeyemi Hall | 275 | *(none)* |

7. Print the note on a bill **only** if that customer has one
8. Finish with a **tariff table** using a loop: the total bill for 0, 50, 100, 150, 200, 250 and 300 units

Every amount prints with two decimal places.

### Check your numbers

| Customer | Energy | VAT | Total |
|---|---|---|---|
| Mrs Okafor, 42 units | 840.00 | 100.50 | 1440.50 |
| Bello Stores, 130 units | 3800.00 | 322.50 | 4622.50 |
| Adeyemi Hall, 275 units | 10750.00 | 843.75 | 12093.75 |

And in the tariff table, 0 units must cost **537.50** — nobody escapes the service charge.

If your Bello Stores energy cost comes out as 4550.00, you've charged all 130 units at the tier-2 price. Re-read the warning in the brief.

### You're done when

- [ ] All eight requirements are met
- [ ] Every number matches the check table
- [ ] Only Bello Stores' bill shows a note
- [ ] You can explain how your energy-cost function handles a customer who lands in the third tier

---

## After the projects

You've now written two complete programs, with real logic and real structure, entirely out of Sessions 4 to 7.

Notice what neither project needed: lists. Everything held **one** value at a time. Project B printed three bills by calling the same function three times, by hand. Session 8 gives you a way to hold all three customers in one variable and loop over them — and you'll feel exactly why that matters, because you've just done it the long way.
