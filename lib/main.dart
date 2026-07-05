import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'theme/app_theme.dart';

void main() => runApp(const TaxProApp());

class TaxProApp extends StatefulWidget {
  const TaxProApp({super.key});

  @override
  State<TaxProApp> createState() => _TaxProAppState();
}

class _TaxProAppState extends State<TaxProApp> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '个人税务服务',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: LoginPage(onToggleTheme: () => setState(() => darkMode = !darkMode)),
    );
  }
}
