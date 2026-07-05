import 'package:flutter/material.dart';
import '../models/income_record.dart';
import '../services/data_service.dart';
import 'income_detail_page.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final records = DataService.records.where((e) => e.month.contains(query) || e.company.contains(query) || e.type.contains(query)).toList();
    final totalIncome = records.fold<double>(0, (s, e) => s + e.income);
    final totalTax = records.fold<double>(0, (s, e) => s + e.tax);

    return Scaffold(
      appBar: AppBar(title: const Text('收入纳税明细'), actions: [TextButton(onPressed: () {}, child: const Text('批量申诉'))]),
      body: Column(children: [
        Container(
          color: Theme.of(context).cardColor,
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            _SummaryRow(title: '收入合计', value: '${totalIncome.toStringAsFixed(2)}元'),
            const Divider(height: 24),
            _SummaryRow(title: '已申报税额合计', value: '${totalTax.toStringAsFixed(2)}元'),
            const SizedBox(height: 12),
            TextField(
              onChanged: (v) => setState(() => query = v.trim()),
              decoration: InputDecoration(hintText: '搜索月份、单位、收入类型', prefixIcon: const Icon(Icons.search), filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none)),
            ),
          ]),
        ),
        Expanded(child: ListView.builder(itemCount: records.length, itemBuilder: (_, i) => _IncomeCard(record: records[i]))),
      ]),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  const _SummaryRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) => Row(children: [
    Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
    const Spacer(),
    Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
  ]);
}

class _IncomeCard extends StatelessWidget {
  final IncomeRecord record;
  const _IncomeCard({required this.record});

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.fromLTRB(12, 10, 12, 4),
    child: ListTile(
      contentPadding: const EdgeInsets.fromLTRB(18, 16, 12, 16),
      title: Row(children: [
        Text(record.type, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        const Spacer(),
        Text(record.month, style: const TextStyle(fontSize: 18)),
      ]),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Text('所得项目小类：${record.subType}\n扣缴义务人：${record.company}\n收入：${record.income.toStringAsFixed(2)}元\n已申报税额：${record.tax.toStringAsFixed(2)}元'),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => IncomeDetailPage(record: record))),
    ),
  );
}
