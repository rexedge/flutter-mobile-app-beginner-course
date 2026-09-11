// Final Project A — Savings Goal Planner (one possible solution)
//
// Run it:
//   dart run project_a_savings_planner.dart
//
// Uses every session from 4 to 7:
//   Session 4 — typed variables, one nullable
//   Session 5 — const, final, arithmetic, ~/, comparisons, interpolation
//   Session 6 — if/else, switch, while, for
//   Session 7 — functions, named and required parameters, defaults, arrows
//
// Yours doesn't need to match this line for line. If it meets every
// requirement in the brief and prints sensible numbers, it's a pass.

// ---------- Step 2: the constant and a money helper ----------

const double monthlyInterestRate = 0.01; // 1% a month — simplified on purpose

String money(double amount) => amount.toStringAsFixed(2);

// ---------- Step 3: one month of saving ----------

double applyMonth(
  double balance, {
  required double deposit,
  double rate = monthlyInterestRate,
}) {
  final interest = balance * rate;
  return balance + interest + deposit;
}

// ---------- Step 5: progress and milestones ----------

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

// ---------- Step 7: how long would a different deposit take? ----------

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
  // ---------- Step 1: the saver's data ----------
  String saverName = 'Amaka';
  String goalName = 'New laptop';
  double goalAmount = 450000.0;
  double startingBalance = 20000.0;
  double monthlyDeposit = 35000.0;
  String? goalNote = null;

  // ---------- Step 4: the plan, month by month ----------
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

  // ---------- Step 6: the summary ----------
  final totalDeposited = startingBalance + monthlyDeposit * month;
  final interestEarned = balance - totalDeposited;

  print('');
  print('Reached in $month months.');
  print('Final balance:   ${money(balance)}');
  print('You put in:      ${money(totalDeposited)}');
  print('Interest earned: ${money(interestEarned)}');

  // ---------- Step 7: compare other monthly deposits ----------
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
