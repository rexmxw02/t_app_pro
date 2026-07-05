import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../services/data_service.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final records = DataService.records.reversed.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('数据统计')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('收入趋势', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
          height: 280,
          child: Card(child: Padding(
            padding: const EdgeInsets.all(16),
            child: LineChart(LineChartData(
              gridData: const FlGridData(show: true),
              borderData: FlBorderData(show: false),
              titlesData: const FlTitlesData(rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))),
              lineBarsData: [
                LineChartBarData(isCurved: true, dotData: const FlDotData(show: true), spots: [for (int i = 0; i < records.length; i++) FlSpot(i.toDouble(), records[i].income / 10000)]),
              ],
            )),
          )),
        ),
        const SizedBox(height: 14),
        Card(child: Padding(padding: const EdgeInsets.all(16), child: Text('本年度收入 ${DataService.totalIncome.toStringAsFixed(2)} 元，已申报税额 ${DataService.totalTax.toStringAsFixed(2)} 元。图表单位为万元。'))),
      ]),
    );
  }
}
