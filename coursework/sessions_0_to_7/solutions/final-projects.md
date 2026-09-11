# Solutions — Final Projects

[← Back to the projects](../final-projects.md) · [Workbook guide](../README.md)

> These are **one** way to solve each project, not *the* way. If yours meets every requirement and your numbers match the checks, it passes — however you structured it.
>
> Run them: [`code/project_a_savings_planner.dart`](code/project_a_savings_planner.dart) and [`code/project_b_electricity_bill.dart`](code/project_b_electricity_bill.dart).

---

## Project A — Savings Goal Planner

### The full program

```dart
const double monthlyInterestRate = 0.01; // 1% a month — simplified on purpose

String money(double amount) => amount.toStringAsFixed(2);

double applyMonth(
  double balance, {
  required double deposit,
  double rate = monthlyInterestRate,
}) {
  final interest = balance * rate;
  return balance + interest + deposit;
}

int percentOf(double part, double whole) => part * 100 ~/ whole;

String milestone(int percent) {
  switch (percent ~/ 25) {
    case 0:
      return 'Just getting started';
    case 1:
      return 'A quarter of the way';
    case 2:
      return 'Halfway there';
    case 3:
      return 'Three quarters done';
    default:
      return 'Goal reached!';
  }
}

int monthsToReach({
  required double goal,
  required double start,
  required double deposit,
  double rate = monthlyInterestRate,
}) {
  double balance = start;
  int months = 0;
  while (balance < goal) {
    balance = applyMonth(balance, deposit: deposit, rate: rate);
    months++;
  }
  return months;
}

void main() {
  String saverName = 'Amaka';
  String goalName = 'New laptop';
  double goalAmount = 450000.0;
  double startingBalance = 20000.0;
  double monthlyDeposit = 35000.0;
  String? goalNote = null;

  print('=== Savings plan for $saverName ===');
  print('Goal: $goalName, ${money(goalAmount)}');

  if (goalNote == null) {
    print('No note added.');
  } else {
    print('Note: $goalNote');
  }

  final ratePercent = (monthlyInterestRate * 100).toStringAsFixed(0);
  print('Starting with ${money(startingBalance)}, '
      'saving ${money(monthlyDeposit)} a month at $ratePercent% monthly interest.');
  print('');

  double balance = startingBalance;
  int month = 0;

  while (balance < goalAmount) {
    month++;
    balance = applyMonth(balance, deposit: monthlyDeposit);
    final percent = percentOf(balance, goalAmount);
    print('Month $month: ${money(balance)} ($percent%) - ${milestone(percent)}');
  }

  final totalDeposited = startingBalance + monthlyDeposit * month;
  final interestEarned = balance - totalDeposited;

  print('');
  print('Reached in $month months.');
  print('Final balance:   ${money(balance)}');
  print('You put in:      ${money(totalDeposited)}');
  print('Interest earned: ${money(interestEarned)}');

  print('');
  print('What if you saved a different amount each month?');
  for (double deposit = 25000; deposit <= 45000; deposit = deposit + 5000) {
    final months = monthsToReach(
      goal: goalAmount,
      start: startingBalance,
      deposit: deposit,
    );
    print('  ${money(deposit)} a month: $months months');
  }
}
```

### The output

```
=== Savings plan for Amaka ===
Goal: New laptop, 450000.00
No note added.
Starting with 20000.00, saving 35000.00 a month at 1% monthly interest.

Month 1: 55200.00 (12%) - Just getting started
Month 2: 90752.00 (20%) - Just getting started
Month 3: 126659.52 (28%) - A quarter of the way
Month 4: 162926.12 (36%) - A quarter of the way
Month 5: 199555.38 (44%) - A quarter of the way
Month 6: 236550.93 (52%) - Halfway there
Month 7: 273916.44 (60%) - Halfway there
Month 8: 311655.60 (69%) - Halfway there
Month 9: 349772.16 (77%) - Three quarters done
Month 10: 388269.88 (86%) - Three quarters done
Month 11: 427152.58 (94%) - Three quarters done
Month 12: 466424.11 (103%) - Goal reached!

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

With `goalNote = 'For university'` and `goalAmount = 200000.0`, the plan finishes in six months:

```
Note: For university
...
Month 5: 199555.38 (99%) - Three quarters done
Month 6: 236550.93 (118%) - Goal reached!

Reached in 6 months.
```

### Step by step — what to check in yours

**Step 1.** `goalNote` must be `String?`. It's the one piece of data that might not exist, so it's the one nullable variable.

**Step 2.** `monthlyInterestRate` is `const` because it's fixed and known in advance. It sits above `main()` so every function can use it — including as a default value.

**Step 3.** The order inside `applyMonth` matters. Interest first, on the balance you *already had*, and then the deposit. Check: `20000 + 200 + 35000 = 55200`. If you added the deposit first you'd get `55550`, and every number after that would drift.

**Step 4 — why `while`.** You don't know how many months it'll take before you start. That's the whole question the program answers. A `for` loop needs to know its count up front; a `while` loop runs *until something happens*.

**Step 4 — the percentage.** `(monthlyInterestRate * 100).toStringAsFixed(0)` turns `0.01` into `1`. Without `.toStringAsFixed(0)` you'd see `1.0%`.

**Step 5 — the switch trick.** `percent ~/ 25` squashes any percentage into a handful of values: 0–24 becomes `0`, 25–49 becomes `1`, and so on. That turns a *range* question — which is normally an `if` job — into an *exact-match* question, which `switch` handles neatly. Anything 100 or over becomes 4 or more, which `default` catches.

**Step 5 — `part * 100 ~/ whole`.** Multiplying by 100 first, then doing `~/`, gives a whole-number percentage straight away. `~/` works on `double`s too, and always hands back an `int`.

**Step 6.** `totalDeposited` counts her starting money plus every deposit. Whatever the final balance has beyond that must be interest — so `interestEarned` is simply the difference.

**Step 7.** `monthsToReach` runs the same month-by-month loop as `main()`, just quietly, without printing. Passing `rate: rate` into `applyMonth` matters: without it, `applyMonth` would use its own default and ignore any different rate given to `monthsToReach`.

The `for` loop counts with a `double` — `deposit = deposit + 5000` — because the deposit is money. Loop counters don't have to be `int`.

### The one thing worth noticing

Look at Step 7's results. Saving 5,000 a month more takes you from 16 months to 14 — but going from 40,000 to 45,000 only saves a single month. Your program just discovered something real about saving, and it did it by trying five scenarios in about a second. That's what programs are for.

---

## Project B — Electricity Bill Calculator

### The full program

```dart
const double serviceCharge = 500.0;
const double vatRate = 0.075; // 7.5%

const double tier1Rate = 20.0; // units 1 to 50
const double tier2Rate = 35.0; // units 51 to 150
const double tier3Rate = 50.0; // every unit above 150

String money(double amount) => amount.toStringAsFixed(2);

double energyCost(int units) {
  if (units <= 50) {
    return units * tier1Rate;
  } else if (units <= 150) {
    return 50 * tier1Rate + (units - 50) * tier2Rate;
  } else {
    return 50 * tier1Rate + 100 * tier2Rate + (units - 150) * tier3Rate;
  }
}

double addVat(double amount, {double rate = vatRate}) => amount + amount * rate;

String usageBand(int units) {
  if (units <= 50) {
    return 'Low';
  } else if (units <= 150) {
    return 'Medium';
  } else {
    return 'High';
  }
}

double totalBill(int units) => addVat(energyCost(units) + serviceCharge);

void printBill({required String customer, required int units, String? meterNote}) {
  final energy = energyCost(units);
  final subtotal = energy + serviceCharge;
  final vat = subtotal * vatRate;
  final total = subtotal + vat;

  print('--------------------------------');
  print('Customer: $customer');
  print('Units used: $units (${usageBand(units)} usage)');
  if (meterNote != null) {
    print('Note: $meterNote');
  }
  print('Energy:         ${money(energy)}');
  print('Service charge: ${money(serviceCharge)}');
  print('VAT (7.5%):     ${money(vat)}');
  print('TOTAL:          ${money(total)}');
}

void main() {
  printBill(customer: 'Mrs Okafor', units: 42);
  printBill(customer: 'Bello Stores', units: 130, meterNote: 'Estimated reading');
  printBill(customer: 'Adeyemi Hall', units: 275);
  print('--------------------------------');

  print('');
  print('Tariff table');
  for (int units = 0; units <= 300; units = units + 50) {
    print('  $units units: ${money(totalBill(units))}');
  }
}
```

### The output

```
--------------------------------
Customer: Mrs Okafor
Units used: 42 (Low usage)
Energy:         840.00
Service charge: 500.00
VAT (7.5%):     100.50
TOTAL:          1440.50
--------------------------------
Customer: Bello Stores
Units used: 130 (Medium usage)
Note: Estimated reading
Energy:         3800.00
Service charge: 500.00
VAT (7.5%):     322.50
TOTAL:          4622.50
--------------------------------
Customer: Adeyemi Hall
Units used: 275 (High usage)
Energy:         10750.00
Service charge: 500.00
VAT (7.5%):     843.75
TOTAL:          12093.75
--------------------------------

Tariff table
  0 units: 537.50
  50 units: 1612.50
  100 units: 3493.75
  150 units: 5375.00
  200 units: 8062.50
  250 units: 10750.00
  300 units: 13437.50
```

### The tiers, worked through by hand

The part nearly everyone gets wrong first time. Here's Adeyemi Hall's 275 units:

| Tier | Units | Price | Cost |
|---|---|---|---|
| 1 | the first 50 | 20.00 | 1,000.00 |
| 2 | the next 100 | 35.00 | 3,500.00 |
| 3 | the remaining 125 | 50.00 | 6,250.00 |
| | **275** | | **10,750.00** |

**Each tier only charges for the units that fall inside it.** That's why the third branch of `energyCost` adds up two *full* tiers — `50 * tier1Rate + 100 * tier2Rate` — and only then charges the leftover `units - 150` at the top price.

Check the other two the same way:

- **Mrs Okafor, 42 units:** all inside tier 1 → `42 * 20 = 840`
- **Bello Stores, 130 units:** 50 at tier 1, then 80 at tier 2 → `1000 + 2800 = 3800`

The common mistake, `130 * 35`, gives 4,550 — overcharging by 750.

### Decisions worth comparing with yours

**Tier prices as constants.** If the company raises prices, you change three numbers at the top of the file, not a dozen scattered through the logic. Writing `20.0` directly inside `energyCost` works too, but it's harder to find and easy to update in one place and miss in another.

**`meterNote` is `String?` with no default.** An optional named parameter with no default value must be nullable, because leaving it out has to mean *something* — and that something is `null`. Then `if (meterNote != null)` decides whether the line is printed at all.

**`totalBill` exists only for the tariff table.** `printBill` works out the same total, but it also prints. The table needs just the number, so a small function that *returns* it is cleaner. That's the lesson of exercise 7.11 again — a function that returns a value can be used in more places than one that prints.

**`usageBand` uses `if`, not `switch`.** The bands are *ranges* — 51 to 150, not exact values — and ranges are an `if` job. The `~/` trick from Project A doesn't fit here: that worked because every milestone band was the same width, 25. These bands aren't — Low covers 50 units and Medium covers 100 — so there's no single number to divide by. Choosing the right tool for the shape of the question is the whole point.

**Zero units still costs 537.50.** The service charge is paid whether you use electricity or not, and VAT is charged on it. If your table said `0.00` for zero units, the service charge was being added in the wrong place.
