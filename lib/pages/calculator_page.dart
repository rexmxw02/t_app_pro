import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final income = TextEditingController(text: '35000');
  final deduction = TextEditingController(text: '5000');
  double tax = 0;

  void calc() {
    final i = double.tryParse(income.text) ?? 0;
    final d = double.tryParse(deduction.text) ?? 0;
    final taxable = (i - d).clamp(0, double.infinity);
    double rate = 0.03;
    double quick = 0;
    if (taxable > 12000 && taxable <= 25000) {
      rate = 0.10;
      quick = 210;
    } else if (taxable > 25000 && taxable <= 35000) {
      rate = 0.20;
      quick = 1410;
    } else if (taxable > 35000) {
      rate = 0.25;
      quick = 2660;
    }
    setState(() => tax = taxable * rate - quick);
  }

  @override
  void initState() {
    super.initState();
    calc();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('税额计算器')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      TextField(controller: income, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: '月收入')),
      const SizedBox(height: 12),
      TextField(controller: deduction, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: '专项扣除 / 起征扣除')),
      const SizedBox(height: 18),
      FilledButton(onPressed: calc, child: const Text('计算')),
      const SizedBox(height: 18),
      Card(child: Padding(padding: const EdgeInsets.all(18), child: Text('预估应纳税额：${tax.toStringAsFixed(2)} 元', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)))),
    ]),
  );
}
