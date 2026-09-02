void main() {
  // --- Step 1: Variables & Types (Session 4) ---
  String customerName = 'Alice';
  int coffeesOrdered = 3;
  double pricePerCoffee = 4.50;
  bool isForHere = false;
  String? specialInstructions = null;

  // --- Step 2: Operators & Immutability (Session 5) ---
  final totalCost = coffeesOrdered * pricePerCoffee;
  const taxRate = 0.05; // 5% tax
  final finalPrice = totalCost + (totalCost * taxRate);

  // String Interpolation
  print('$customerName ordered $coffeesOrdered coffees. Total with tax: \$${finalPrice.toStringAsFixed(2)}.');

  // --- Step 3: Control Flow - Branching (Session 6) ---
  // if/else statement
  if (specialInstructions != null) {
    print('Special instructions: $specialInstructions');
  } else {
    print('No special instructions.');
  }

  // switch statement
  switch (coffeesOrdered) {
    case 1:
      print('Single order');
      break;
    case 2:
      print('Double order');
      break;
    default:
      print('Large order');
  }

  // --- Step 4: Control Flow - Looping (Session 6) ---
  // for loop
  for (int i = 1; i <= coffeesOrdered; i++) {
    print('Preparing coffee $i...');
  }

  // while loop
  int countdown = 5;
  while (countdown > 0) {
    print(countdown);
    countdown--; // Don't forget the update to avoid an infinite loop!
  }
  print('Order ready!');
}
