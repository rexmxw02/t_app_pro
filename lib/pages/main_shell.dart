import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'income_page.dart';
import 'stats_page.dart';
import 'calculator_page.dart';
import 'settings_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final pages = const [
    DashboardPage(),
    IncomePage(),
    StatsPage(),
    CalculatorPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: '首页'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), label: '明细'),
          NavigationDestination(icon: Icon(Icons.show_chart), label: '统计'),
          NavigationDestination(icon: Icon(Icons.calculate_outlined), label: '计算'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: '我的'),
        ],
      ),
    );
  }
}
