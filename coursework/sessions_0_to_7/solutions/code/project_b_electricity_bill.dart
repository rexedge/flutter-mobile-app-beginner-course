// Final Project B — Electricity Bill Calculator (one possible solution)
//
// Run it:
//   dart run project_b_electricity_bill.dart
//
// This was an open brief, so there are many valid answers. This one is
// here so you can compare approaches, not so you can copy it. If your
// numbers match the check values in the brief, your logic is right —
// however you structured it.

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
