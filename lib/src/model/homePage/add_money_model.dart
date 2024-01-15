class AddMoney {
  String amountName;
  double amount;
  int quantity;

  AddMoney({
    required this.amountName,
    required this.amount,
    required this.quantity,
  });

  AddMoney copyWith({
    String? amountName,
    double? amount,
    int? quantity,
  }) {
    return AddMoney(
      amountName: amountName ?? this.amountName,
      amount: amount ?? this.amount,
      quantity: quantity ?? this.quantity,
    );
  }

  // double totalAmountWithDecrease = getTotalAmountWithDecrease(amount);
}
