import 'package:flutter/material.dart';
import '../services/data_service.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xff1677ff), Color(0xff58a8ff)]),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('2025 年度收入总览', style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 10),
              Text('¥${DataService.totalIncome.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('已申报税额 ¥${DataService.totalTax.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
            ]),
          ),
          const SizedBox(height: 14),
          const _InfoCard(icon: Icons.calendar_month, title: '最近收入月份', value: '2025-12'),
          const _InfoCard(icon: Icons.task_alt, title: '申诉状态', value: '暂无待处理'),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: const [
              _Quick(icon: Icons.receipt_long, title: '收入纳税明细'),
              _Quick(icon: Icons.file_download, title: '证明下载'),
              _Quick(icon: Icons.report_problem, title: '发起申诉'),
              _Quick(icon: Icons.security, title: '账户安全'),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const _InfoCard({required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(leading: CircleAvatar(child: Icon(icon)), title: Text(title), subtitle: Text(value)),
  );
}

class _Quick extends StatelessWidget {
  final IconData icon;
  final String title;
  const _Quick({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) => Card(
    child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 34, color: const Color(0xff1677ff)),
      const SizedBox(height: 10),
      Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
    ])),
  );
}
