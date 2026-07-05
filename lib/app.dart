import 'package:flutter/material.dart';
import 'pages/income_tax_page.dart';
import 'theme/tax_colors.dart';

class TaxPixelApp extends StatelessWidget {
  const TaxPixelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '收入纳税明细',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        return MediaQuery(
          data: mq.copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'sans-serif',
        scaffoldBackgroundColor: TaxColors.pageBg,
      ),
      home: const IncomeTaxPage(),
    );
  }
}
