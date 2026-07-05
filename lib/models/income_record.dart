class IncomeRecord {
  final String month;
  final String type;
  final String subType;
  final String company;
  final double income;
  final double tax;
  final double insurance;
  final double fund;

  const IncomeRecord({
    required this.month,
    required this.type,
    required this.subType,
    required this.company,
    required this.income,
    required this.tax,
    required this.insurance,
    required this.fund,
  });

  double get afterTax => income - tax - insurance - fund;
}
