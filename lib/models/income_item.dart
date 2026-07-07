class IncomeItem {
  final String? month;
  final String subType;
  final String income;
  final String tax;

  const IncomeItem({
    this.month,
    required this.subType,
    required this.income,
    required this.tax,
  });

  bool get hasTitle => month != null;
}
