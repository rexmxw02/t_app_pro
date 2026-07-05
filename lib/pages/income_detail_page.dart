import 'package:flutter/material.dart';
import '../models/income_record.dart';

class IncomeDetailPage extends StatelessWidget {
  final IncomeRecord record;
  const IncomeDetailPage({super.key, required this.record});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('收入详情')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Card(child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(record.month, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(record.company),
          const Divider(height: 30),
          _Row('收入类型', record.type),
          _Row('所得项目小类', record.subType),
          _Row('税前收入', '${record.income.toStringAsFixed(2)}元'),
          _Row('五险', '${record.insurance.toStringAsFixed(2)}元'),
          _Row('公积金', '${record.fund.toStringAsFixed(2)}元'),
          _Row('已申报税额', '${record.tax.toStringAsFixed(2)}元'),
          _Row('模拟税后收入', '${record.afterTax.toStringAsFixed(2)}元'),
        ]),
      )),
      const SizedBox(height: 14),
      FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.report_problem_outlined), label: const Text('发起申诉')),
    ]),
  );
}

class _Row extends StatelessWidget {
  final String k;
  final String v;
  const _Row(this.k, this.v);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 9),
    child: Row(children: [
      Text(k, style: const TextStyle(color: Colors.grey)),
      const Spacer(),
      Flexible(child: Text(v, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.w600))),
    ]),
  );
}
