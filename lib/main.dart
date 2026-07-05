import 'package:flutter/material.dart';
import 'pages/income_tax_page.dart';

void main() {
  runApp(const TaxApp());
}

class TaxApp extends StatelessWidget {
  const TaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '收入纳税明细',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xfff5f6fa),
        fontFamily: 'Roboto',
      ),
      home: const IncomeTaxPage(),
    );
  }
}
